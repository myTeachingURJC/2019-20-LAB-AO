#-- Rellendo la memomria con los valores 1,2,3,4,5

	.data
inicio:

	.text
	
	la x5, inicio
	
	li x6, 0

	
bucle:			
	addi x6, x6, 1
	
	sw x6, 0(x5)
	
	addi x5, x5, 4
	
	b bucle