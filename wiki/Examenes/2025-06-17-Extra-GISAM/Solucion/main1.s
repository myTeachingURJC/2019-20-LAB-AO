
	#-- Servicios del sistema operativo
	.include "so.s"

		# -- Datos de prueba para el volcado (ESPECIFICACION)
		.data
test:	.word 0xCAFEBACA
		.word 0xBEBECAFE
		.word 0x01234567
		.word 0x89ABCDEF
	
	
	.text
	
	#-- Volcado de 4 palabras
	#-- Llamar a la funcion dump4
	la a0, test
	jal dump4
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
