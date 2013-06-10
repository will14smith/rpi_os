typedef struct heap_entry heap_entry;

#define NULL ((void*) 0)

struct heap_entry{
  int size;
  void* addr;
  heap_entry* next;
};

heap_entry *free_head  = NULL;
heap_entry *alloc_head = NULL;

heap_entry alloc[1000];

heap_entry* mmlist_next_slot() {
  int i = 0;

  while(1) {
    if(!alloc[i].addr) {
      return &alloc[i];
    }
  
    i++;
  }
}
void mmlist_insert(heap_entry* head, void* addr, int size) {
  heap_entry* entry = mmlist_next_slot();
  
  entry->addr = addr;
  entry->size = size;

  if(head->addr > addr) {
    entry->next = head;
        
    if(head == free_head) {
      free_head = entry;
    } else {
      alloc_head = entry;
    }
    
    return;
  }
  
  heap_entry *cur = head;

  while(1) {
    if(!cur->next) {
      cur->next = entry;
      entry->next = NULL;
      
      return;
    } else if(cur->next->addr > addr) {
      entry->next = cur->next;
      cur->next = entry;
      
      return;
    }
    cur = cur->next;
  }
}

void mm_init() {
  // init unalloc'd list
  free_head = mmlist_next_slot();
  
  free_head->size = 0x8000000; // alloc 128MB
  free_head->addr = (void*) 0x2000000; // starting at 32MB
  free_head->next = NULL;
    
  // init unalloc'd list
  alloc_head = mmlist_next_slot();
  
  alloc_head->size = 0x0100000; // alloc 1MB
  alloc_head->addr = (void*) 0x1F00000; // starting at 31MB
  alloc_head->next = NULL;
}

void* malloc(int size) {
  // Align size to 8
  size += (8 - (size & 7)) & 7;
  
  if(!free_head) {
    mm_init();
  }
  
  heap_entry *prev = NULL;
  heap_entry *cur = free_head;
  
  while(cur) {
    if(cur->size >= size) {
      void* addr = cur->addr;
            
      cur->addr = ((char*)cur->addr) + size;
      cur->size -= size;
      
      if(!cur->size) {
        if(prev) {
          prev->next = cur->next;
        } else {
          free_head = cur->next;
        }
        cur->addr = NULL;
        cur->next = NULL;
      }

      mmlist_insert(alloc_head, addr, size);
      
      return addr;
    } else {
      prev = cur;
      cur = cur->next;
    }
  }
  
  // printf("Error: malloc(%u) failed\n", size);
  return NULL;
}
void free(void* addr) {
  heap_entry *prev = NULL;
  heap_entry *entry = alloc_head;

  while(1) {
    if(entry == NULL) {
      // printf("Error: free(%x) failed\n", addr);
      return;
    }
    if(entry->addr == addr) {
      break;
    }
    prev = entry;
    entry = entry->next;
  }
  
  if(prev == NULL) {
    alloc_head = entry->next;
  } else {
    prev->next = entry->next;
  }
  
  mmlist_insert(free_head, addr, entry->size);
  
  entry->size = 0;
  entry->addr = NULL;
  entry->next = NULL;
  
  //merge adjacent blocks in free list
  prev = free_head;
  entry = free_head->next;
  
  while(entry) {
    if((int)prev->addr + prev->size == (int)entry->addr) {
      prev->size += entry->size;
      prev->next = entry->next;
      
      entry->size = 0;
      entry->addr = NULL;
      entry->next = NULL;
      
      entry = prev->next;
    } else {    
      prev = entry;
      entry = entry->next;
    }
  }
}
