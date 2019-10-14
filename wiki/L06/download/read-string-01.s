#-- Ejemplo de reserva de espacio para almacenar  
#-- una cadena definida en tiempo de ejecucion

	#--- Tamano maximo cadena
	.eqv MAX 18
	
	#-- Codigo de los servicios del Sistema Operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8	


	.data
	
	#-- Reserva de espacio para una cadena
cad1:	.space MAX
	
	#-- Cadena definida en tiempo de compilacion
cad2:   .string "Nombre?: "
	
	.text
	
	#------ Imprimir mensaje para pedir el nnombre
	
	#-- Situar en a0 la direccion de la cadena
	la a0, cad2
	
	#-- Imprimir la cadena
	li a7, PRINT_STRING
	ecall 
	
	#--- Llamar al servicio ReadString para pedir el nombre
	#-- Direccion donde almacenar la cadena del usuario
	la a0, cad1
	
	#-- Longitud máxima de la cadena
	li a1, MAX
	
	li a7, READ_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
	
