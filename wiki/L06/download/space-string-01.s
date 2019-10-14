#-- Ejemplo de reserva de espacio para almacenar  
#-- una cadena definida en tiempo de ejecucion

	#--- Tamano maximo cadena
	.eqv MAX 18

	.data
	
	#-- Reserva de espacio para una cadena
cad1:	.space MAX
	
	#-- Cadena definida en tiempo de compilacion
cad2:   .string "Nombre?: "

	
	
	
