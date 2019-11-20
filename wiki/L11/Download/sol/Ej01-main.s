#--- Programa principal
#--- Imprimir la longitud de una cadena introducida por el usuario
#--- Se debe llamar a la funcion len(), que es recursiva

	.include "servicios.asm"
	
	.eqv MAX 1024
	
	.data
	
cad:	.space MAX
msg:	.string "Longitud de la cadena: "
	
	.text
	
	#-- Pedir cadena 
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Calcular su longitud
	#-- a0 = len(pcad)
	jal len
	
	#-- Guardar la longitud en s0
	mv s0, a0
	
	
	#---- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la longitud
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall