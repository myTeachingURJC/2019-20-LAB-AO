# Programa para eliminar los espacios iniciales de una cadena
# e imprimir el resto

	.include "sys.s"

	#-- Longitud maxima de la cadena a introducir
	.eqv MAX 50

	.data
	 
	 #-- Cadena introducida por el usuario
msg1: .string "Introduce cadena:"
msg2: .string "Cadena sin espacios iniciales:"
cad: .space MAX	
	
	
	.text
	
	#-- 1. Imprimir mensaje para pedir cadena al usuario
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- 2. Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	#-- a0: Puntero a la cadena
	#-- t0: Puntero a la cadena, para no perderlo
	mv t0, a0  
	
	#-- Meter en t2 el caracter ' ' para realizar
	#-- la comparacion
	#-- BONUS: Se coloca fuera del bucle para tardar
	#--  menos ciclos
	li t2, ' '
	
bucle:
	#-- 3. Leer el caracter actual de la cadena a modificar
	#-- t1: Caracter
	lb t1, 0(t0)  
	
	#-- 4. Si este caracter es el de final de cadena ('\0'), saltar al punto 10
	#-- ¿Es el final de la cadena? Si--> Terminar
	beq t1, zero, fin
	
	#-- 5. Si este caracter NO es un espacio, saltar al punto 8
	#-- ¿Es un espacio? NO --> Saltar a imprimir la cadena
	bne t1,t2,print
	
	#-- 6. Pasar al siguiente caracter
	addi t0,t0,1
	
	#-- 7. Repetir desde el punto 3
	b bucle
	
print:
	#-- 8. Imprimir mensaje para el usuario
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- 9. Imprimir la cadena desde la posicion actual en adelante
	#-- Usamos el servicio PRINT_STRING
	#-- pasando el puntero actual t0
	mv a0, t0
	li a7, PRINT_STRING
	ecall
	
fin:
	
	#-- 10. Terminar
	li a7, EXIT
	ecall

