##---------------------------------------------
#  Programa de prueba de la multiplicacion  
#----------------------------------------------

	# -- Servicio de Exit del S.O
	.eqv EXIT        10 
	.eqv PRINT_STRING 4 
	.eqv PRINT_INT    1
	.eqv READ_INT     5
	.eqv PRINT_CHAR   11

	.data

msg1:   .string "Introduce la base (no negativo): "
msg2:   .string " ^ "
msg3:   .string " = "

	.text
	
	li a0, 2
	li a1, 2
	jal exp
	
	# -- Pedir un numero al usuario
	la a0, msg1
	li a7, PRINT_STRING
	ecall 
	
	li a7, READ_INT
	ecall
	
	#-- Almacenar el numero en s0
	mv s0, a0
	
	#-- Bucle para calcular la tabla de potencias
	#-- Se usa el registro s1 como contador (1...10)
	li s1, 1
	
bucle:	
	#--- Imprimir el mensaje del calculo: "base" ^ "exp" = "Resultado"
	#-- Imprimir la base
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir la cadeba " elevado a "
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprmir el contador (exponente)
	mv a0, s1
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir el igual
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	# -- Realizar la operacion s0 elevaod a s1
	mv a0, s0
	mv a1, s1
	jal exp
	
	mv t0, a0
	
	# ------ Imprimir el resultado
	# -- Resultado
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	# --- Imprimiir un salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#--- Incrementar el contador
	addi s1, s1, 1
	
	# -- Si s1 es menor a 11, repetir 
	li t0, 11
	blt s1, t0, bucle 
	
	# -- La tabla está completa
	
	# -- Terminar
	li a7, EXIT
	ecall
	
