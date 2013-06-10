define(`heap_entries', `0x1000')
define(`string', `syscmd(`scripts/convert_string.pl "$1"')')
include(`start.s')

heap_entry_table:
	.space heap_entries

include(`kernel/display/font.s')

include(`kernel.m4')
include(`program.m4')

