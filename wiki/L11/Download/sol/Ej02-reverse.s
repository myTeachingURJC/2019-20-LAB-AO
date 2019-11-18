#-------------------------------------------------
#--- Subrutina Reverse(pcad)
#--- Imprimimr la cadena al revés
#--- El algoritmo es recursivo
#-- ENTRADAS:
#--    a0: Punter a la cadena a dar la vuelta
#-- SALIDAS:
#--    Ninguna
#--------------------------------------------------

	.include "servicios.asm"

	#-- Punto de entrada	
	.globl print_reverse
	
	.text 

print_reverse:
		
	#-- Leer primer caracter
	lb t0, 0(a0)
	
	#-- Comprobar si es el ultimo (\n)
	li t1, '\n'
	bne t1, t0, reverse_rec
	
	#-- Es el último: retornar
	b fin
	
	
	#-- No es el ultimo caracter
reverse_rec:	

	#-- Reservar memoria en la pila
	addi sp, sp, -16
	
	#-- Guardar dir. de retorno
	sw ra, 12(sp)

	#-- Guardar el primer caracter en la pila
	sw t0, 0(sp)

	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Imprimir al revés la cadena restante
	jal print_reverse
	
	#-- Imprimir el primer caracter al final
	lw a0, 0(sp)
	li a7, PRINT_CHAR
	ecall
	

	#-- Recuperar dir. de retorno
	lw ra, 12(sp)

	addi sp, sp, 16
	#-- Punto de salida	
fin:	
	ret
	
	