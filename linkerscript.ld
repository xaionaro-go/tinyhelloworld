INPUT(./linkerscript.env)

ENTRY(actual_main)
SECTIONS {
	.text_noalign text_addr : ALIGN(1) { *(.text_noalign) }

	text_size = SIZEOF(.text_noalign);
	text_load_start = LOADADDR(.text_noalign);
	.rodata text_size + text_load_start : { *(.rodata.*) }
}
