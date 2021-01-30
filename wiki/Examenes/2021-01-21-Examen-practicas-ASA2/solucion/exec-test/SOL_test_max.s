#-----------------------------------
#-- Programa principal: Test_max
#-----------------------------------

	#-- Especificacion: Me piden que los codigos de los servicios
	#-- del sistema operativo se encuentre en el fichero so.s
	.include "SOL_so.s"
	
	#-- Constantes con los numeros a probar
	.eqv K1 20
	.eqv K2 30
	
	.data
msg1:	.string "\nCalcular valor max entre: "
msg2:   .string " y "
msg3:   .string "\nResultado: "
	
	.text
main:

	#--- Imprimir mensaje
	li a7, PRINT_STRING
	la a0, msg1
	ecall
	
	#-- Imprimir constante K1
	li a7, PRINT_INT
	li a0, K1
	ecall
	
	#--- Imprimir mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir constante K2
	li a0, K2
	li a7, PRINT_INT
	ecall
	
	#-- Llamar a max
	li a0, K1
	li a1, K2
	jal max
	
	#-- Guardar el resultado en s0
	#-- (se podría usar tambien un registro temporal)
	mv s0, a0
	
	#--- Imprimir mensaje
	li a7, PRINT_STRING
	la a0, msg3
	ecall
	
	#-- Imprimir el resultado
	mv a0, s0
	li a7, PRINT_INT
	ecall

	#-- Terminar
	li a7, EXIT
	ecall
