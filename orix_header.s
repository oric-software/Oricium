header_orix
.text
*=$800-20

	.byt $01,$00		; non-C64 marker
;2
  .byt "o", "r", "i"      ; "o65" MAGIC number :$6f, $36, $35
	.byt 1			; version
	;5
	.byt $00, $00	; mode word mode0, mode1
	.byt $00, $00		; CPU type
	.byt $00, $00		; operating system id
;11
	.byt $00 ; reserved
;12	
	.byt %01001001 ; Auto, direct, data
;13	
	.byt <start_adress,>start_adress ; loading adress
	.byt <EndOfMemory,>EndOfMemory ; end of loading adress
	.byt <start_adress,>start_adress ; starting adress

start_adress
*=$800
EndOfMemory
