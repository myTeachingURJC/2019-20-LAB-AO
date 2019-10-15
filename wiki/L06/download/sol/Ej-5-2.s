#-- Solución ejercicio 5
	
	.data
	
	.string "1234"
	
v1:	.word 0xDDCCBBAA
	
	.text
	
	la t0, v1
	lw t1, 0(t0)
	
	li a7,10
	ecall
	
	