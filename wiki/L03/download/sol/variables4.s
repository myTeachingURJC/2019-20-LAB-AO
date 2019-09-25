#-- Programa para crear 4 variables
#-- inicializadas a unos valores

	#-- Segmento de datos
	.data
v1:	.word 0x12345678
v2:	.word 0x11223344
v3:	.word 0xCACABACA
v4:	.word 0x00FABADA

	#-- Segmento de código
	.text
	
	li a7, 10
	ecall
	