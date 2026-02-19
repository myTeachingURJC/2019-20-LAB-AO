
	.include "so.h"

	  .data
msg:  .string "Hola Mundo!\n"

	.text
	
	#-- Imprimir mensaje
	la a0, msg
	jal puts
	
	#-- Terminar
	EXIT
	
	