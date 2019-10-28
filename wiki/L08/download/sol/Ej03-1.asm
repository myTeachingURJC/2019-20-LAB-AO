#-- Solución al ejercicio 3
#-- Pedir al usuario un carácter y convertirlo a  
#-- su número entero, si es válido ('0' - '9')

	.include "servicios.asm"

	.data

msg1:	.string "Introduce un numero de un digito (0 - 9): "
error:   .string "\nCaracter inválido\n"
msg2:	.string "\nEl número es: "	
			
	.text
	
bucle_pedir:	
	#--- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall 
	
	#-- Pedir el dígito (es un caracter)
	li a7, READ_CHAR
	ecall
	
	#-- El dígito está en a0. Lo movemos a t0
	#-- Si es menor que '0' es incorrecto
	li t1, '0'
	blt a0, t1, no_valido
	
	#-- Si es mayor que '9' es incorrecto
	li t1, '9'
	bgt a0, t1, no_valido
	
	#-- El carácter es válido: Realizar la conversión
	li t1 '0'
	sub t2, a0, t1  #-- t2 = a0 - '0'
	
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero en la consola: Servicio PRINT_INT
	mv a0, t2
	li a7, PRINT_INT
	ecall
	
	#-- Terminar: saltar al punto de salida
	b fin
	
no_valido:

	#-- El digito introducido NO es valido
	#-- Imprimir mensaje de error
	la a0, error
	li a7, PRINT_STRING
	ecall	
	
	#-- volver a pedir
	b bucle_pedir

fin:		
	#-- Terminar
	li a7, EXIT
	ecall
	
	
