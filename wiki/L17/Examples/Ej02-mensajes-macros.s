#-- Acceso a puts() mediante macros

	.include "so.h"
	.include "stdio.h"

	  .data
msg1:  .string "Mensaje-1\n"
msg2:  .string "Mensaje-2\n"

	.text
	
	#-- Imprimir mensaje pasando como parametro la etiqueta
	PUTSL(msg1)
	
	#-- Imprimir mensaje pasando la cadena por el registro t0
	la t0, msg2
	PUTSR(t0)
	
	#-- Imprimir mensaje mediante cadena INMEDIATA
	PUTSI("Mensaje-3\n")
	
	#-- Terminar
	EXIT
	
	