##-- Ejemplo de subrutina
##-- Funcion para devolver el incremento de su parámetro

	.include "servicios.asm"


	.text
	
	#-- Llamar a la funcion de evaluacion
	li a0, 5
	li a1, 10
	li a2, 15
	jal evaluar
	
	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall

#--------------------------------------------
#-- SUBRUTINA
#--------------------------------------------
evaluar:
	
	#-- t0 = a0 + a1
	add t0, a0, a1
	
	#-- t1 = a2 - 1
	addi t1, a2, -1
	
	#-- t2 = a0 + a1 + a2 - 1
	add t2, t0, t1
	
	#-- El resultdo lo devolvemos por a0
	mv a0, t2
	
	ret
	



