#------------------------------------------------------------------------------
#--- Prueba de la funcion evaluar
#------------------------------------------------------------------------------

	#-- Codigos de los servicios del Sistema operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv READ_CHAR    12
	.eqv PRINT_INT    1
	.eqv PRINT_CHAR   11
	
	#-- Longitud maxima de la expresion
	.eqv MAX 100

	.data

msg1:	 .string "\nIntroduce expresion: "
msg_err: .string "\nError\n"
exp:	 .space MAX

	.text
	
	
repetir:
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, exp
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Comprobar si es la cadena vacia
	#-- Si es asi, terminar
	lb t0, 0(a0)
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Llamar a evaluar
	jal evaluar
	
	#-- a0 contiene el resultado
	
	#-- Comprobar el resultado de evaluar
	li t0, -1
	beq a0, t0, error
	
	#-- Resultado ok. Imprimirlo!
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	
	#-- Repetir
	b repetir
	
error:
	la a0, msg_err
	li a7, PRINT_STRING
	ecall
	
	b repetir
	
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall

