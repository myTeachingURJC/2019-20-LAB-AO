#-- Ejemplo de reserva de espacio para almacenar  
#-- una cadena definida en tiempo de ejecucion

	#--- Tamano maximo cadena
	.eqv MAX 16

	#-- Codigo de los servicios del Sistema Operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4

	.data
	
	#-- Reserva de espacio para una cadena
cad1:	.space MAX
	
	#-- Cadena definida en tiempo de compilacion
cad2:   .string "Soy una cadena definida"

	
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
	
	
	