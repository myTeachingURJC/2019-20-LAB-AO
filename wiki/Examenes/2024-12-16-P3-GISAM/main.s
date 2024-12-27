#----------------------------------
#-- Programa principal:
#----------------------------------

	.include "so.s"

	.data

	#-- Mensajes indicados en la ESPECIFICACION
msg1: 	.string "\nPrimer numero : "
msg2:   .string "Segundo numero: "
msg3:   .string "Valor maximo: "


	.text
	
bucle:
    #-- 1. Pedir primer numero al usuario
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
	
	
	#-- s0: Contiene el primer numero
	mv s0,a0
	
	#-- 3. Pedir segundo numero al usuario
	#-- Imprimir mensaje al usuario para el segundo numero
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir numero 2 al usuario
	li a7, READ_INT
	ecall
	#-- s1: contiene el segundo numero
	mv s1, a0
	
	#-- 4. Calcular el valor máximo
	#-- Llamar a max(s0,s1)
	mv a0, s0
	mv a1, s1
	jal max
	#-- s2: Contiene el valor maximo
	mv s2, a0
	
	#-- 5. Imprimir en la consola el valor máximo
	#-- Imprimir mensaje para usuario: Valor maximo
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el valor maximo
	mv a0,s2
	li a7, PRINT_INT
	ecall
	
	#-- 6. Llamar a la función print_max() para imprimir el valor máximo formateado
	#-- print_max(s0,s1,s2)
	mv a0, s0
	mv a1, s1
	mv a2, s2
	jal print_max
	
	#--7. Saltar al paso 1 
	b bucle
	
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall 










