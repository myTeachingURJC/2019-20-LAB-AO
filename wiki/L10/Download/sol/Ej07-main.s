#---- Programa principal

	.include "servicios.asm"
	
	.data
msg_x:  .string "Coordenada x: "
msg_y:  .string "Coordenada y: "	
	
	.text
	
	#----- Pedir la coordenada x
	la a0,msg_x
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Guardar cordenada x en s0
	mv s0, a0
	
	#----- Pedir la coordenada y
	la a0,msg_y
	li a7, PRINT_STRING
	ecall
	
	li a7, READ_INT
	ecall
	
	#-- Guardar cordenada y en a1
	mv a1, a0
	
	mv a0, s0
	
	#--- Llamar a la subrutina operar(x,y, 10, 100)
	li a2, 10
	li a3, 100
	jal operar
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
