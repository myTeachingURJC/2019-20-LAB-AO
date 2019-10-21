#-- Solucion del ejercicio 7
#-- Cifrado sencillo de una cadena de 4 bytes,
#-- Simplemente se suma 1 a cada caracter

	#-- Códigos de los servicios del S.O
	.include "servicios.asm"


	.data
	
msg:	.string "Hola\n"

	.text
	
	#-- Puntero a la cadena
	la a0, msg
	
	#-- Imprimir el mensaje original
	li a7, PRINT_STRING
	ecall
	
	#---------- CIFRADO
	#-- Leer cada byte de la cadena, incrementarlo y guardarlo
	lb t0, 0(a0)
	addi t0, t0, 1
	sb t0, 0(a0)
	
	lb t0, 1(a0)
	addi t0, t0, 1
	sb t0, 1(a0)
	
	lb t0, 2(a0)
	addi t0, t0, 1
	sb t0, 2(a0)
	
	lb t0, 3(a0)
	addi t0, t0, 1
	sb t0, 3(a0)
	
	#-- Imprimir el mensaje cifrado
	li a7, PRINT_STRING
	ecall

	#-- Terminar
	li a7, EXIT
	ecall 
