

	.eqv EXIT        10
	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4
	.eqv PRINT_CHAR   11

	
	.data
	
	#-- Conjunto donde se almacenaran los numeros
	#-- introducidos por el usuario
conjunto: 
        .word 0,0,0,0,0,0,0,0,0,0 	
	

msg2:   .string "\nSuma: "
msg3:   .string "\n\nConjunto de numeros: "
	
	.text
	
	
	la s0, conjunto
	
	#-- Llamar a usersuma10 para pedir los 10 numeros al usuario
	#-- y guardarlos en memoria
	mv a0, s0
	jal usersuma10
	
	#-- s1: Resultado de la suma
	mv s1, a0
	
	#-- Imprimir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall 
	
	#------ Recorrer el conjunto de numeros e imprimirlos
	#-- t1: contador de numeros
	li t1, 0
next:	
	#-- Leer numero
	lw t0, 0(s0)
	
	#-- Imprimirlo
	mv a0, t0
	li a7, PRINT_INT
	ecall 
	
	#-- Imprimir un espacio
	li a0, ' '
	li a7, PRINT_CHAR
	ecall 
	
	#-- Incrementar contador de numero
	addi t1, t1, 1
	
	#-- Incrementar puntero
	addi s0, s0, 4
	
	#-- Si t0<10 repetir
	li t2, 10
	blt t1,t2, next
	
	
	# ---- Imprimir la suma total 
	
	#-- Imprimir mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	
	#-- Imprimir resultado en la consola
	mv a0, s1
	li a7, PRINT_INT
	ecall 
	
	#-- Terminar
	li a7, EXIT
	ecall
