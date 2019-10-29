#-- Solución al ejercicio 8
#-- Cifrar una cadena
#-- El cifrado es simple: Se suma una constante a cada caracter

	.include "servicios.asm"

	#-- Tamaño máximo de la cadena
	.eqv MAX 32
	
	#-- Constante a sumar, para cifrar
	.eqv K   5
		
		
	.data 
cad:	.space MAX	
msg1:	.string "Introduce cadena: "
msg2:	.string "Cadena cifrada: "
	
	
	.text 
	
	#-- Imprimir mensaje msg1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall

bucle:
	#-- Leer caracter
	lb t0, 0(a0)
	
	#-- Condicion de finalizacion
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Sumar K al caracter
	addi t0,t0, K
	
	#-- Almacenar el caracter cifrado
	sb t0, 0(a0)
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b bucle

	
fin:    #-- Hemos terminado
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena
	la a0, cad
	li a7, PRINT_STRING
	ecall			
			
	#-- Terminar
	li a7, EXIT
	ecall
	
