	# -- Constantes
	.eqv EXIT         10	
	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4
	.eqv READ_INT     5

	.data
msg1:	.string "\nIntroduce numero en decimal: "
msg2:   .string "\nValor en binario: "
num:    .word 0

	.text
	
bucle:
	# -- Pedir cadena al usuario
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- a0 contiene el número introducido por el usuario
	
	# -- Si el numero es 0, terminar
	beq a0, zero, fin

	# -- Guardar resultado en t0
	mv t0, a0

	# -- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimirlo en binario
	mv a0, t0
	jal printbin
	
	# Repetir el bucle
	b bucle

fin:

	#-- Terminar
	li a7, EXIT
	ecall
