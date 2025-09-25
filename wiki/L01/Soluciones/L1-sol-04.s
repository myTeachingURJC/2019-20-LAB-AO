# Sesion L1 
# Solucion al ejercicio 4
#  programa que ejecute las siguientes acciones:
#   * Inicializar el registro 6 a 0
#   * Restarle 1
#   * Terminar 

	.text
	
	#-- Inicializar registro 6 a 0
	addi x6, x0, 0
	
	#-- Restar 1
	addi x6, x6, -1
	
	#-- Terminar
	li a7, 10
	ecall

#-- configuramos para ver los registros en hexadecimal
#-- Al restar 1 a 0, x6 vale 0xFFFFFFFF (todos los bits a 1)
#-- El valor en complemento a dos de -1 es justo ese
