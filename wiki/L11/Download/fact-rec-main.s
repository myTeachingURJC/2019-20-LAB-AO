#-----------------------------------------------------------------
#-- Programa principal: Calculo del factorial de un numero N 
#-----------------------------------------------------------------

	.include "servicios.asm"
	
	#-- Numero del que queremos calcular el factorial
	.eqv N 3

	.data
msg1:   .string "\n\nFactorial de "	
msg2:   .string ": "
	
	.text 
	
	#-- Llamar a fact(N)
	li a0, N
	jal fact
	
r0:	#-- Direccion de retorno al principal
        #-- (para depurar)
	
	#-- En a0 esta el resultado
	#-- Guardarlo en s0
	mv s0, a0
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir N
	li a0, N
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el resultado
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
