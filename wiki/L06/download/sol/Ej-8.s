#-- Solucion al ejercicio 8

	#-- Código de servicios del S.O
	.eqv EXIT 10

	.data
	
	#-- Definir una palabra
v1:	.word 0xCADACAFE
v2:	.half 0xBACA
v3:	.byte 0xEA

	.text
	
	#-- Incrementar la palabra
	la t0, v1
	lw t1, 0(t0)
	addi t1,t1,1
	sw t1, 0(t0)
	
	#-- Incrementar la media palabra
	la t0, v2
	lh t1, 0(t0)
	addi t1,t1,1
	sh t1, 0(t0)
	
	#-- Incrementar el byte
	la t0, v3
	lb t1, 0(t0)
	addi t1,t1,1
	sb t1, 0(t0)
	
	
	#-- Terminar
	li a7, EXIT
	ecall