#-- Solución ejercicio 5
	
	.data
	
	.string "1234"
	
	#-- Solucion 1: Alinear la etiqueta v1
	.align 2
	
v1:	.byte 0xAA
	.byte 0xBB
	.byte 0xCC
	.byte 0xDD
	
	.text
	
	la t0, v1
	lw t1, 0(t0)
	
	li a7,10
	ecall