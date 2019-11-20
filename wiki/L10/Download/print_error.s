#---------------------------------------------
#-- SUBRUTINA: Print_error(*error)
#--
#-- Se imprime el mensaje de error apuntado por el parametro error.
#-- Tanto antes como despues del mensaje se imprimen dos líneas
#-- de asteriscos para resaltarlo
#-- 
#--   Entrada:
#--      a0: Puntero al mensaje de error a sacar
#--
#--   Salida: Ninguan
#-----------------------------------------------------  

	.globl print_error
	
	.eqv TAM 40

	.include "servicios.asm"

	.text
	
	#-- PUnto de entrada
print_error:	

	#-- Necesitamos crear la pila para guardar la direccion de 
	#-- retorno (es una subrutina intermedia)
	addi sp, sp, -16
	
	#-- Guardamos la direccion de retorno
	sw ra, 12(sp)
	
	#-- En a0 tenemos el puntero a la cadena a imprimir....
	#-- Pero primero hay que llamar a la funcion linea
	#-- pasando como parametro el valor 40 en a0
	#-- Para no perder lo que hay en a0, lo guardamos
	#-- en la pila. Por ejemplo en la posicion por debajo de ra
	sw a0, 8(sp)
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir una linea de 40 asteriscos
	#-- linea(40)
	li a0, TAM
	jal linea
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Recuperar la direccion del mensaje. La metemos en a0
	lw a0, 8(sp)
	
	#-- Llamamos a PRINT_STRING
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Imprimir la linea inferior
	li a0, TAM
	jal linea
	
	#-- Imprimir '\n'
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Recuperar la pila
	addi sp, sp, 16
	
	#-- Punto de salida
	ret