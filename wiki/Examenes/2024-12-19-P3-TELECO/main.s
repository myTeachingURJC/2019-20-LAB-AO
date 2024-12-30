#----------------------------------
#-- Programa principal:
#----------------------------------

	.include "so.s"

	.data

	#-- Mensajes indicados en la ESPECIFICACION
msg1: 	.string "\nPrimer numero: "
msg2:   .string "Segundo numero: "

	.text
	
bucle:
  
  	##-- 1. Pedir el primer numero al usuario (n1)
	#-- Imprimir mensaje al usuario para el primer numero
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero 1 al usuario
	li a7, READ_INT
	ecall
	
	#-- 2. Si este número es -1, terminar
	li t0, -1
	beq a0,t0,fin
	
	
	#-- s0: Contiene el primer numero (n1)
	mv s0,a0
	
	#-- 3. Pedir segundo numero al usuario (n2)
	#-- Imprimir mensaje al usuario para el segundo numero
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero 2 al usuario
	li a7, READ_INT
	ecall
	#-- a0: n2
	mv a1, a0
	
	#-- 4. Llamar a la funcion print_min(n1,n2) para imprimir el número mínimo
	#-- print_min(n1,n2)
	mv a0, s0  #-- Primer numero (n1)
	jal print_min
	
	#-- 5. Repetir desde el paso 1
	b bucle
	
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall 














