#-----------------------------
#-- Programa principal de pruebas: test_pesomax
#-----------------------------------------------

	.include "SOL_so.s"

	.eqv MAX 100

	.data
	
	#-- Cadenas introducidas por el usuario
cad1:	.space MAX
cad2:   .space MAX

msg1:   .string "\nIntroduzca cadena 1: "
msg2:   .string "Introduzca cadena 2: "
msg3:   .string "Peso maximo: "
	
	.text
	
bucle:
	#-- Pedir cadena 1 al usuario
	
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	la a0, cad1
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Si el primer caracter es '\n' terminar
	lb t0, 0(a0)
	li t1, '\n'
	beq t0, t1, fin
	
	#-- Pedir cadena 2 al usuario
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	la a0, cad2
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Calcular el peso máximo
	la a0, cad1
	la a1, cad2
	jal pesomax
	
	#-- Guardar el peso maximo en s0
	mv s0, a0
	
	#-- Imprimir mensaje de salida
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el peso maximo
	mv a0,s0
	li a7, PRINT_INT
	ecall
	
	#-- Repetir
	b bucle
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall
	
