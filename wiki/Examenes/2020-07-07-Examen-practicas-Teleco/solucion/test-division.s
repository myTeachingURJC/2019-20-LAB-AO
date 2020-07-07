	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv READ_INT 5
	.eqv PRINT_INT 1

	.data

msg1:   .string "\nIntroduce Dividendo: "
msg2:   .string "Introduce Divisor: "
msg3:   .string "Resultado:\n  Cociente: "
msg4:   .string "\n  Resto: "

	.text 
	
bucle:	
	
	#-- Imprimir mensaje  
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir dividendo al usuario
	li a7, READ_INT	
	ecall
	
	#-- Si es -1 terminamos
	li t0, -1
	beq a0, t0, fin
	
	#-- Guardar el dividendo en s0
	mv s0, a0
	
	#-- Imprimir mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir divisor al usuario
	li a7, READ_INT
	ecall
	
	#-- Guardar divisor en s1
	mv s1, a0
	
	#-- Hacer la division
	mv a0, s0
	mv a1, s1
	jal division
	
	#-- Guardar los resultados en s0 y s1
	mv s0, a0
	mv s1, a1
	
	#-- Mostrar resultado
	la a0, msg3
	li a7, PRINT_STRING
	ecall 
	
	#-- Imprimir cociente
	mv a0, s0
	li a7,	PRINT_INT
	ecall 
	
	#-- Imprimir el resto
	la a0,msg4
	li a7, PRINT_STRING
	ecall
	
	mv a0, s1
	li a7, PRINT_INT
	ecall 
	
	b bucle
	
fin:	
	
	li a7, EXIT
	ecall 
	
	
