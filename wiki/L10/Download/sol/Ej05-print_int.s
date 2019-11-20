#-----------------------------------------
#-- Subrutina: Print_int(num)
#-- ENTRADA:
#--    a0:  Imprimir el numero entero
#-- SALIDA: Ningua
#-----------------------------------------

	#-- Punto de entrada
	.globl print_int
	
	.include "servicios.asm"
	
	.data

msg:	.string "---> "	
			
	.text
print_int:
	
	#-- El parametro a0 lo necesitamos para imprimir la 
	#-- la cadena "--->"
	#-- Para no perderlo, hay que guardarlo en la pila
	
	#-- Crear pila
	addi sp, sp, -16
	
	#-- Guardar a0 en la pila
	sw a0, 12(sp)
	
	#-- Imprimir el mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Recuperar a0 de la pila
	lw a0, 12(sp)
	
	#-- Imprimri el numero entero
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir un \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Recueprar pila
	addi sp, sp, 16
	ret