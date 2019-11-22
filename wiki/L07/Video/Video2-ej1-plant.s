#-- Ejemplo de salto incondicional
#-- hacia adelante	

	.include "servicios.asm"	
		
	.text
	
	li t0, 0xCAFE
	li t1, 0xBACA
	
	b salta
	
	li t0, 0
	li t1, 1

salta:
	#-- Terminar
	li a7, EXIT
	ecall	
	
