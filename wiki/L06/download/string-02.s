#-- Ejemplo impresion de una cadena

	#-- Codigo de los servicios del Sistema Operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4

	.data
	
	#-- Definimos las cadenas en
	#-- tiempo de compilacion
cad1: 	.string "En un lab de la URJC"
cad2:	.string " de cuyo numero no quiero acordarme"
	
	
	.text
	
	#------ Imprimir la primera cadena
	
	#-- Situar en a0 la direccion de la cadena
	la a0, cad1
	
	#-- Imprimir la cadena
	li a7, PRINT_STRING
	ecall 
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	