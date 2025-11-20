#---- Programa para pasar una cadena introducida por el usuario
#---- a mayusculas, siguiendo el algoritmo especificado

	.include "so.s"
	
	#-- Constantes
	#-- Cadena maxima
	.eqv MAX 10  #-- (ESPECIFICACIONES)
	
	.data
dst:	.space MAX   #-- Cadena destino (ESPECIFICACIONES)
src:	.space MAX   #-- Cadena origen (ESPECIFICACIONES)
msg1:	.string "Introduce cadena de prueba: "
msg2:   .string "Cadena copiada y convertida: "

	.text 
	
	#-- 1. Imprimir mensaje para pedir cadena al usuario
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- 2. Pedir cadena al usuario. Almacenarla en la cadena origen
	la a0, src
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- t0: Puntero a cadena origen
	la t0, src  
	
	#-- t1: Puntero a cadena destino
	la t1, dst
	
	#-- Almacenar '\n' fuera del bucle
	#-- Se saca aqui para OPTIMIZAR (BONUS)
	li t3, '\n'
	
bucle:
	#-- 3. Leer caracter de cadena origen (car)
	#-- t2: Caracter origen (car)
	lb t2, 0(t0)
	
	#-- 4. Si el caracter es 0, pasar al punto 11
	beq t2, zero, fin
	
	#-- 5. Si el caracter es '\n' pasar al punto 11
	beq t2, t3, fin
	
	#-- 6. Convertir caracter a mayusculas
	#--    Restar 32 al caracter: car = car - 32
	addi t2, t2, -32
	
	#-- 7. Escribir caracter en cadena destino
	sb t2, 0(t1)
	
	#-- 8. Apuntar al siguiente caracter de la cadena origen
	addi t0, t0, 1
	
	#-- 9. Apuntar al siguiente caracter de la cadena destino
	addi t1, t1, 1
	
	#-- 10. Repetir desde el punto 3
	j bucle
	
fin:	#-- 11. Escribir 0 en la posicion actual de la cadena destino
	sb zero, 0(t1)
	
	#-- 12. Imprimir mensaje para el usuario
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- 13. Imprimir la cadena destino
	la a0, dst
	li a7, PRINT_STRING
	ecall
	
	#-- 14. Terminar
	li a7, EXIT
	ecall
	
