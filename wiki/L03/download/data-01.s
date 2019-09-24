#-- Programa de ejemplo que inicializa la primera palabra del 
#-- semgneto de datos a un valor

	#-- Indicar al ensamblador que lo que viene a 
	#-- continuacion esta en el segmento de datos
	.data
	
	#-- Dato a colocar en el segmento de datos
	#-- (en la primera posicion)
	.word 0xBEBECAFE
	
