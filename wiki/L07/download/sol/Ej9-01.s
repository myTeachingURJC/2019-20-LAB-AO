#-- Solución al ejercicio 9
#-- Contar la cantidad de caracteres 'a' que hay en una
#-- cadena introducida por el usuario

	.include "servicios.asm"
	
	#-- Tamaño máximo de la cadena pedida al usuario 
	.eqv MAX 1024
	
	.data
msg_pide_cad:  .string "Introduce una cadena: "	
msg_result:    .string "Contador del caracter 'a': "

	#--- Cadena pedida al usuario
cad:	       .space MAX
	
	.text
	
	#-- Pedir cadena al usuario
	
	la a0, msg_pide_cad
	li a7, PRINT_STRING
	ecall
	
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- En t0 metermos el puntero a la cadena, para recorrerla
	la t0, cad
	
	#-- En t1 metemos el contador de 'a's
	li t1, 0
	
	
bucle:

	#-- Leer el caracter actual
	lb t2, 0(t0)
		
	#-- Comprobar si se ha llegado al final de la cadena
	beq t2, zero, fin_bucle
	
	#-- Comprobar si es el caracter 'a'
	li t3, 'a'
	bne t2, t3, continua  #--> NO, continua
	
	#-- Se ha encontrado una 'a'
	#-- Incrementar contador
	addi t1, t1, 1
	 
continua: 
	
	#-- Pasar al siguiente caracter: Incrementar puntero
	addi t0, t0, 1
	
	b bucle
	
	#--- Imprimir el resultado
fin_bucle:

	la a0, msg_result
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el valor del contador de 'a's
	mv a0, t1
	li a7, PRINT_INT
	ecall	
	
fin:	
	#-- Terminar
	li a7, EXIT
	ecall