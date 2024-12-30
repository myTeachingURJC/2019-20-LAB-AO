
	.include "so.s"
	
#-----------------------------
#-- print_min(n1,n2)
#--
#-- Imprimir el mensaje: "MIN(n1, n2)=min"
#--------------------------------------------
#-- ENTRADA:
#--  -n1 (a0): Primer numero
#--  -n2 (a1): Segundo numero
#-- SALIDA:
#--  -Ninguna
#------------------------------------------------
	.globl print_min
	.data
msg4:   .string "\nMin("
msg5:   .string ", "
msg6:   .string ")= "

	.text
	
print_min:

    #-- ¡¡Es una funcion intermedia!!

	#-- Crear la pila
	addi sp,sp,-16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)

	#-- Guardar parametros en la pila
	sw a0, 0(sp)  #-- Numero 1
	sw a1, 4(sp)  #-- Numero 2

	#-- Imprimir "Min("
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir primer numero
	lw a0, 0(sp)  #-- Recuperar numero 1 de la pila
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir ", "
	la a0,msg5
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir segundo numero
	lw a0, 4(sp)  #-- Recuperar numero 2 de la pila
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir ")= "
	la a0,msg6
	li a7, PRINT_STRING
	ecall
	
	#-- Calcular el numero minimo
	lw a0, 0(sp)
	lw a1, 4(sp)
	jal min
	
	#-- Imprimir numero minimo
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp,sp,16
	
	#-- Terminar
	ret
	
	
