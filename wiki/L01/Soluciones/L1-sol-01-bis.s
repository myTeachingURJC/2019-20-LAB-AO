# Sesion L1 
# Solucion al ejercicio 1 (avanzada)
#
#-- Asignar los siguientes valores a los registro indicados:
#-- x3=3, x4=4, x5=5, x6=6, x7=7 y x8=8
#--
#-- La operación de asignacion se realiza tipicamente con
#-- la pseudo-instruccion li, que no vemos hasta la sesion L3
#-- El programa es equivalente, pero usando li en vez de addi
#-- (pero genera exactamente las mismas instrucciones basicas)

	.text

	li x3, 3   # x3 = 3
 	li x4, 4   # x4 = 4
 	li x5, 5   # x5 = 5
 	li x6, 6   # x6 = 6
 	li x7, 7   # x7 = 7
 	li x8, 8   # x8 = 8
 	
	#-- Terminar
	li a7, 10
	ecall

	