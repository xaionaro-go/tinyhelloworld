SECTIONS {
	.text : { *(.text.*) }
	text_size = SIZEOF(.text);
	text_load_start = LOADADDR(.text);
	.rodata text_size + text_load_start : { *(.rodata.*) }
}
