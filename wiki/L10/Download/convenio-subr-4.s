#-- Ejemplo de subrutina
#-- que respeta el convenio
#-- No está implementada, es un boceto de
#-- lo que se debería hacer para no violar
#-- el convennio
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
	
	#--- Como necesitaremos t0 tras llamar a la 
	#--- subrutina, hay que guardar su valor
	
	#--- GUARDAR t0 EN LA PILA
	
	#-- Llamar a tarea 2
	#jal tarea2
	
	#--- RECUPERAR EL VALOR DE t0 de la PILA
	
	#-- Ahora ya podemos usar su valor normalente
	addi t0,t0,1

	#-- Punnto de salida
	ret	
	
