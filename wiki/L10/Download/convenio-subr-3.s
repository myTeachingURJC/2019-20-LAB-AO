#-- Ejemplo de subrutina
#-- que VIOLA EL CONVENIO de USO de REGISTROS
#-- ¡¡¡CUIDADO!!
	.globl tarea1

	.include "servicios.asm"
			
	.text

#-----------------------------------------
#-- Subrutina Tarea 1
#--------------------------------------------

	.data
msg1:	.string "Tarea 1\n"

	.text
	#--- PUnto de entrada de la subrutia
tarea1:	
	#-- Imprimir un mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Inicializar t0 a 25
	li t0, 25
	
	#-- Llamar a tarea 2
	jal tarea2
	
	#-- ¡VIOLACION! NO podemos usar el valor de t0. Hay que  
	#-- darlo por perdido!
	addi t0,t0,1

	#-- Punnto de salida
	ret	
	
