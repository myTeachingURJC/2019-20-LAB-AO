
	.include "so.s"
	
#-----------------------------
#-- print_max(n1,n2,max)
#--
#-- Imprimir el mensaje: "MAX(n1, n2)=max"
#--------------------------------------------
#-- ENTRADA:
#--  -n1 (a0): Primer numero
#--  -n2 (a1): Segundo numero
#--  -max (a2): Valor maximo
#-- SALIDA:
#--  -Ninguna
#------------------------------------------------
	.globl print_max
	.data
msg4:   .string "\nMax("
msg5:   .string ", "
msg6:   .string ")= "

	.text
	
print_max:

	#-- Guardar parametros en registros temporales
	mv t0, a0
	mv t1, a1
	mv t2, a2

	#-- Imprimir "Max("
	la a0, msg4
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir primer numero
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir ", "
	la a0,msg5
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir segundo numero
	mv a0, t1
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir ")= "
	la a0,msg6
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir numero maximo
	mv a0, t2
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir \n
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Terminar
	ret
	
	
