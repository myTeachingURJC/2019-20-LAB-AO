#--------------------------------------
#-- Programa principal
#--
#-- Comprobar el funcionamiento de la  
#-- funcion abs(n)
#----------------------------------------

	#-- Servicios del sistema operativo
	.eqv PRINT_STRING 4
	.eqv READ_INT  5
	.eqv PRINT_INT 1
	.eqv EXIT 10

	.data
msg1:	.string "\nIntroduce numero: "
msg2:   .string "Valor absoluto: "


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
	
	#-- Calcular valor absoluto
	jal abs
	
	#-- a0 contiene el valor absoluto
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el valor absoluto
	mv a0,t0
	li a7, PRINT_INT
	ecall
	
	#-- Repetir
	b bucle
	
fin:	
	#-- Terminar
	li a7, EXIT
	ecall