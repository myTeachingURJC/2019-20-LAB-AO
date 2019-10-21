#-- Solución al ejericicio 5
#-- calcular la longitud de la cadena introducida por el usuario

	.include "servicios.asm"
	
	.eqv MAX 1024
	
	
	.data
	
	#-- Aqui se almacena la cadena introducida por el usuario
cad:	           .space MAX
msg_introduce_cad: .string "Introduce una cadena: "
msg_longitud:      .string "Longitud: "

	.text
	
	#-- Pedir al usuario que introduzca la cadena
	la a0, msg_introduce_cad
	li a7, PRINT_STRING
	ecall
	
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#----- La cadena introducida se encuentra en cad
	
	#-- El contador de cacteres esta en t0
	li t0, 0
	
	#-- t1 es el puntero a la cadena
	la t1, cad
	
	#--- Bucle para recorrer la cadena
bucle:
	#-- Leer el carácter de la cadena
	lb t2, 	0(t1)
	
	#-- Si el caracter es \n, terminar
	li t3, '\n'
	beq t2, t3, fin_bucle

	#-- Incrementar le contador de caracteres
	addi t0, t0, 1
	
	#-- Apuntar al siguiente caracter
	addi t1, t1, 1
	
	b bucle

	#-- Hemos llegado al final de la cadena
	#-- Imprimir su lognitud
fin_bucle:
	
	#--- Imprimir la longitud de la cadena
	la a0, msg_longitud
	li a7, PRINT_STRING
	ecall 
	
	#-- La longitud está en el contador t0
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall 

