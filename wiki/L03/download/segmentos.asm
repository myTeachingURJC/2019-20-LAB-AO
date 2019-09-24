#-- Mezclando etiquetas del segmento de datos
#-- y del segmento de codigo
#-- El ensamblador asigna las direcciones a las etiquetas
#-- en función del segmento en el que están
	
	.data
	
datos:

	.word 0xCAFEBACA
	.word 0xFACEB00C
	


	.text
codigo:

