#-----------------------------------
#-- Programa principal: Test_peso
#-----------------------------------

	#-- Especificacion: Me piden que los codigos de los servicios
	#-- del sistema operativo se encuentre en el fichero so.s
	.include "so.s"
	
	.data
cad:	.string "ab"	

msg1:   .string "\nPeso de la cadena "
msg2:   .string ":  "

	.text
main:

	#-- Calcular el peso de cad
	la a0, cad
	jal peso

	#-- Guardar peso en s0
	mv s0, a0


	#--- Imprimir mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir cadena original
	la a0, cad
	li a7, PRINT_STRING
	ecall
	
	#--- Imprimir mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir peso
	mv a0, s0
	li a7, PRINT_INT
	ecall

	#-- Terminar
	li a7, EXIT
	ecall
