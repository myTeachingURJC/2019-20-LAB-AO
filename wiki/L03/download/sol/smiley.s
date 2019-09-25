#-- Generar un "smiley" en el monitor
#-- de acceso a memoria :-)

	.data
memoria:

	.text

	#-- Puntero al comienzo del segmento de datos
	la x5, memoria
	
	#-- Valor a almacenar en las posiciones de memoria
	#-- vale cualquiera
	li x10, 1
	
	#-- Ojos
	sw x10, 0x48(x5)
	sw x10, 0x50(x5)
	sw x10, 0x88(x5)
	sw x10, 0x90(x5)
	
	#-- Parte superior sonrisa
	sw x10, 0x104(x5)
	sw x10, 0x114(x5)
	
	#-- Parte inferior sonrisa
	sw x10, 0x148(x5)
	sw x10, 0x14C(x5)
	sw x10, 0x150(x5)
	
	#-- Terminar
	li a7, 10
	ecall
	
	