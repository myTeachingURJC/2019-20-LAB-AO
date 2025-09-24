# Sesion L1 
# Solucion al ejercicio 1
#
#-- Asignar los siguientes valores a los registro indicados:
#-- x3=3, x4=4, x5=5, x6=6, x7=7 y x8=8

	.text

	addi x3, x0, 3   # x3 = 3
	addi x4, x0, 4   # x4 = 4
	addi x5, x0, 5   # x5 = 5
	addi x6, x0, 6   # x6 = 6
	addi x7, x0, 7   # x7 = 7
	addi x8, x0, 8   # x8 = 8

	#-- Terminar
	li a7, 10
	ecall
