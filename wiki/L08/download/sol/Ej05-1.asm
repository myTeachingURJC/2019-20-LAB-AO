#-- Solución al ejericio 5: Conversion de una cadena 
#-- variable a número

	.include "servicios.asm"

	.eqv MAX 10

	.data

cadnum: .space MAX  #-- Cadena a convertir

msg1:   .string "\nIntroduzca cadena: "
msg2:   .string "\nNumero: "
			
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	#-- Pedir cadena al usuario
	la a0, cadnum
	li a1, MAX
	li a7, READ_STRING
	ecall
		
	#--- t0: Resultado parcial
	li t0, 0
	
	
next_car:
	#--- Leer digito
	lb t1, 0(a0)
	
	#-- ¿Es \n? Hemos terminado
	#-- El resultado es el que esta en t0
	li t5, '\n'
	beq t1,t5, imprimir
	
	#-- El caracter no es cero
	#-- Multiplicar t0 por 10
	li t2, 10
	mul t0, t0, t2
	 
	#-- Obtener el numero del digito (t1 - '0')
	li t3, '0'
	sub t4, t1, t3  #-- t4 = t1 - '0
	
	#-- t0 = t0 + t4
	add t0, t0, t4
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b next_car
	
	
imprimir:
	
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, t0
	li a7, PRINT_INT
	ecall
 
	#-- Terminar
	li a7, EXIT
	ecall
	
	
