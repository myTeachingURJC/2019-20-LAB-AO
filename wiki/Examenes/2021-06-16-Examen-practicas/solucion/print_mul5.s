
	#-- Constantes usadas
	.eqv FIN 10
	.eqv IMPRIMIR_ENTERO 1
	.eqv IMPRIMIR_CARACTER 11

	.globl print_mul5

	.text
	
	
print_mul5:

	#-- Es necesario crear la pila para guardar la direccion de retorno
	#-- y los registros estáticos que se están modificando
	addi sp,sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Guardar los registros estáticos en la pila
	#-- para recuperarlos al final y respectar así
	#-- el convenio
	sw s0, 0(sp)
	sw s1, 4(sp)	
	
	#-- El registro S0 lo inicializamos con n (a0)
	#-- que es el parametro de entrada
	mv s0, a0
	
# ----------------- ESTE CODIGO NO SE PUEDE MODIFICAR ----------------------------------	
	# -- Contador: 1,2,3....
	li s1, 1
	
bucle:
	beq s0, zero, terminar	
	addi s0, s0, -1
	
	# -- Calcular el siguiente multiplo de 5
	mv a0, s1
	jal mul5
	
	#-- En a0 se encuentra el multiplo
	#-- Lo imprimimos en la consola
	li a7, IMPRIMIR_ENTERO
	ecall
	
	#-- Imprimir un espacio
	li a0, ' '
	li a7, IMPRIMIR_CARACTER
	ecall
	
	#-- Pasar al siguiente multiplo
	addi s1, s1, 1
	b bucle


terminar:
#----------- FIN DEL CODIGO QUE NO SE PUEDE MODIFICAR ------------------

	#-- Recuperar los valores de los registros estáticos
	lw s0, 0(sp)
	lw s1, 4(sp)
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Recuperar el puntero de pila
	addi sp, sp, 16
	
	#-- Retornar
	ret
	
	
	
	
