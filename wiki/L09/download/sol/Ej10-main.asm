#-- Solución al ejericio 10: Conversion de una cadena a número 
#-- No se tiene en cuenta la gestión de errores
#-- Supondremos que el usuario ha introducido una cadena con 
#-- los caracteres '0'-'9'

	.include "servicios.asm"

	.eqv MAX 1024

	.data

cadnum: .space MAX  #-- Cadena a convertir

msg1:   .string "\nIntroduzca cadena: "
msg2:   .string "\nNumero: "
			
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	#-- Pedir cadena al usuario
	la a0, cadnum
	li a1, MAX
	li a7, READ_STRING
	ecall
		
	#-- Llamar a num = atoi(a0)
	jal atoi
	
	#-- El numero retornado lo podemos guardar en cualquier registro
	#-- estático o temporal, porque no hay más llamadas a subrutina
	mv s0, a0

	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, s0
	li a7, PRINT_INT
	ecall
 
	#-- Terminar
	li a7, EXIT
	ecall
	
	
