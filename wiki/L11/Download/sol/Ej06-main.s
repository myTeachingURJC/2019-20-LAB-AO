#----- Programa principal
#-- Calculo del maximo

	.include "servicios.asm"
	
	.data
	
	#-- Lista de bytes para calcular el valor maximo
num:	.byte 5,8,9,20,112,73,21,7,0	
msg1:	.string "Valor maximo: "	



	.text 
	
	#-- Llamar a la funcion para calcular el maximo
	la a0, num
	jal maximo
	
	#-- Guardar a0 en s0
	mv s0, a0
	
	#-- Imprimir el mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el valor máximo
	mv a0, s0
	li a7, PRINT_INT
	ecall

	
	li a7, EXIT
	ecall