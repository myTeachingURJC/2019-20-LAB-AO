#------------------------------------------------------------------------------
#--- Programa principal
#------------------------------------------------------------------------------

	#-- Codigos de los servicios del Sistema operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv PRINT_INT    1
	
	#-- Codigos de retorno
	.eqv TERMINAR -2
	.eqv ERROR    -1
	
	#-- Longitud maxima de la expresion
	.eqv MAX 100

	.data

msg1:	 .string "EVALUACION DE EXPRESIONES\n"
msg2:    .string "\nEvaluaciones ok: "

exp:	 .space MAX

	.text
	

	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Contador de expresiones evaluadas correctamente evaluadas
	li s0, 0

bucle:		
	#-- Llamar a procesar
	jal procesar
	
	#-- a0 contiene el codigo de retorno
	#-- Si se recibe el codigo TERMINAR
	#-- se sale del bucle
	li t0, TERMINAR
	beq a0, t0, fin
	
	#-- Comprobar si se ha evaluado correctamente o no
	li t1, ERROR
	beq a0, t1, bucle
	
	#-- Se ha evaluado ok. Incrementamos el contador
	addi s0, s0, 1
	
	#-- Repetir 
	b bucle	
	
fin:

	#--- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el contador de evaluaciones ok
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall

