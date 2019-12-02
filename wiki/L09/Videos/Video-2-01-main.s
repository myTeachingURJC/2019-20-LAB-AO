#------------------------------------------------ PROGRAMA PRINCIPAL -----------------------------
         .include "servicios.asm"
	
	.text 
	#------------ PUNTO DE ENTRADA -----------------------------
	
	#--- Otras instrucciones....
	
	#--- Llamamos a la subrutina tarea 1
	jal tarea1
	
	#--- Otra instrucciones
	li t0, 5
	addi t0,t0, 25
	

	#--- Llamar a la subrutina tarea1 otra vez
	jal tarea1


	#-------- PUNTO DE SALIDA	
	li a7, EXIT
	ecall
	
#----------------------------------------------------------------------------------------------------------

#-------------SUBRUTINA -----------------------------------------

	.data
	
msg_tarea1:  .string "\nTAREA 1\n"
	
	.text
	
	#---- PUNTO DE ENTRADA
tarea1:	

	#---- TAREA 1
	la a0, msg_tarea1
	li a7, PRINT_STRING
	ecall
	
	#--- PUNTO DE SALIDA
	ret

#---------------------------------------------------------------


