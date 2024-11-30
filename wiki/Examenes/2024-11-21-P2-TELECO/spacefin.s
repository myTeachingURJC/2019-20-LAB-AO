# Programa para eliminar los espacios finales de una cadena

	.include "ecall.s"

	#-- Longitud maxima de la cadena a introducir
	.eqv MAX 50

	.data
	 
#-- Mensajes a mostrar al usuario	 
msg1: .string "Introduce cadena:"
msg2: .string "Cadena sin espacios finales:"

#-- Cadena introducida por el usuario
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
	
	#-- BONUS: Para que el programa tarde menos ciclos
	#-- asignamos fuera del bucle los valores de 
	#-- los caracteres '\n' y ' '
	li t3, '\n'
	li t2, ' '
	
bucle:
	#-- 3. Leer el caracter actual de la cadena a modificar
	#--  (Inicialmente es el primer caracter de la cadena)
	#-- t1: Caracter
	lb t1, 0(t0)  
	
	#-- 4. Si este caracter es '\n', saltar al punto 8
	#-- ¿Es el caracter \n?
	beq t1, t3, print
	
	#-- 5. Si este caracter es un espacio, saltar al punto 8
	#-- ¿Es un espacio? Si --> terminar
	beq t1,t2,print
	
	#-- 6. Pasar al siguiente caracter
	addi t0,t0,1
	
	#-- 7. Repetir desde el punto 3
	b bucle
	
print:
    #-- 8. Almacenar un \0 en la posicion actual de la cadena
    sb zero, 0(t0)
    
	#-- 9. Imprimir mensaje para el usuario
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- 10. Imprimir la cadena dos veces
	la a0, cad
	li a7, PRINT_STRING
	ecall
	ecall
	
	#-- 11. Imprimir un asterisco
	li a0, '*'
	li a7, PRINT_CHAR
	ecall
	
	#-- 12. Terminar
	li a7, EXIT
	ecall

