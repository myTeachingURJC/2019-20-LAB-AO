

	#-- Servicios del sistema operativo 
	.include "system.s"  # ESPECIFICACION

	#-- Tamaño maximo de la palabra
	.eqv MAX 12   # ESPECIFICACION

	.data
cad:    .space MAX    # Cadena en la primera posicion (ESPECIFICACION)
msg:	.string "Escribe una palabra: "   # ESPECIFICACION
msg2:   .string "Caracteres: "            # ESPECIFICACION

	.text
	
	#-- 1. Imprimir mensaje en la consola
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- 2. Pedir palabra al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- t0: Puntero a la cadena
	mv t0, a0
	
	#-- 3. Imprimir segundo mensaje en la consola
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- BONUS: Sacar los valores constantes
	#-- fuera del bucle para reducir el 
	#-- numero de ciclos
	li t2, '*'
	li t3, '\n'
	
bucle:
	#-- 4. Leer el caracter de la cadena
	lb t1, 0(t0)
	
	#-- 5. Si el caracter es '*', saltar al punto 11
	beq t1, t2, punto11
	
	#-- 6. Si el caractere es '\n', saltar al punto 13
	beq t1, t3, fin
	
	#-- 7. Imprimir caracter actual
	mv a0, t1
	li a7, PRINT_CHAR
	ecall
	
	#-- 8. Imprimir caracter '-'
	li a0, '-'
	ecall
	
	#-- 9. Pasar al siguiente caracter
	addi t0, t0, 1
	
	#-- 10. Saltar al punto 4
	j bucle
	
	
punto11:
	#-- 11. Imprimir un '*'
	li a0, '*'
	li a7, PRINT_CHAR
	ecall
	
	#-- 12. Imprimir un salto de linea
	li a0, '\n'
	ecall
	
fin:
	#-- 13. Terminar
	li a7, EXIT
	ecall
	
