# Sesion L1 
# Solucion al ejercicio 6
# Es un programa que implementa la multiplicacion
# de dos registros, usando sumas
# En los registros x5 y x6 se introducen los dos numeros 
# a multiplicar. El resultado se devuelve en x7
# Asi, el resultado de este programa es x7 = 5 * 6 = 30

	.text
	
	addi x5, x0, 5
	addi x6, x0, 6
	addi x7, x0, 0
a:
	beq x5,x0,fin
	add x7, x7, x6
	addi x5, x5, -1
	j a
fin:
	li a7, 10
	ecall
