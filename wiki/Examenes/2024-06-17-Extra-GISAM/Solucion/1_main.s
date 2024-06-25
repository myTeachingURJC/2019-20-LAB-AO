#--------------------------------------
#-- Programa principal
#--
#-- Comprobar el funcionamiento de la  
#-- funcion trunc(n)
#----------------------------------------

	#-- Servicios del sistema operativo
	.eqv PRINT_STRING 4
	.eqv READ_INT  5
	.eqv PRINT_INT 1
	.eqv EXIT 10

	.data
msg1:	.string "\nIntroduce numero: "
msg2:   .string "Valor truncado: "


	.text

bucle:
	#-- Imprimir mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir entero al usuario
	li a7, READ_INT
	ecall
	
	#-- Si el numero introducido es 0 terminamos
	beq a0, zero, fin
	
	#-- Calcular valor truncado
	jal trunc255
	
	#-- a0 contiene el valor truncado
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el valor truncado
	mv a0,t0
	li a7, PRINT_INT
	ecall
	
	#-- Repetir
	b bucle
	
fin:	
	#-- Terminar
	li a7, EXIT
	ecall