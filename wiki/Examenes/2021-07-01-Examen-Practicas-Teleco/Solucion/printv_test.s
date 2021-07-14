# -- Programa de prueba de la funcion printv
# -- Se imprimen 5 vectores en la consola
# -- desde el (100, 10) hasta el (105, 15):
# --
# -- SALIDA EN LA CONSOLA:
# --   
# -- (100,10)
# -- (101,11)
# -- (102,12)
# -- (103,13)
# -- (104,14)

# ----------------------------------------------------
# Funcion printv_test(n)  
#   Imprimir una lista de n vectores de prueba
# ENTRADAS:
#   a0: Numero de vectores de prueba a imprimir
# SALIDAS:
#   Ninguna
#   En la consola se imprimen los n vectores de pruebas
#   Ej. para n = 3
#  (100, 10)
#  (101, 11)
#  (102, 12)
#----------------------------------------------------

	.globl printv_test
	
	.text
printv_test:	
	# -- Como es una funcion intermedia (Es una funcion que a su
	# -- vez llama a otra funcion). Es necesario crear la pila
	# -- para guardar la direccion de retorno
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Como en el trozo de codigo que NO podemos modificiar se estan
	#-- usando los registros estaticos s0, s1 y s2, para cumplir con 
	#-- el convenio de la ABI del RISCV hay que guardarlos en la pila
	#-- para no perder su valor. Y recuperarlo antes de retornar
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)


	# -- El numero de vectores a imprimir se recibe por a0
	.eqv N 5

	.text
	
	
	# -- Numero de vectores a imprimir
	# -- Se recibe en a0
	mv s2, a0
	

# ---- [INICIO BLOQUE] NO MODIFICAR
# ---  Desde aquí hasta el final del bloque indicado en los comentarios
# --   No puedes modificar nada. Desde aquí hacia arriba puedes cambiar
# --   lo que consideres necesario
			
	# -- Contador para la coordenada x
	li s0, 100
	
	#-- Valor coordenada y inicial
	li s1, 10
	
bucle:	
	#-- Imprimir el vector
	mv a0, s0
	mv a1, s1
	jal printv
	
	# -- Incrementar componentes x, y 
	addi s0, s0, 1
	addi s1, s1, 1
	
	# -- Un vector menos por imprimir
	addi s2, s2, -1
	
	#-- Si ya no quedan vectores, terminar
	beq s2, zero, fin
	
	#-- Repetir
	b bucle
	
fin:
	
# ----- [FIN DE BLOQUE]-- Las instrucciones de aqui hacia el inicio del bloque
# ----- no las puedes modificar. De aquí hacia abajo puedes modificar lo que quieras	
	
	# -- Recuperar los registros estaticos s0, s1 y s2 para cumpliar
	# -- con el convenio de la ABI del RISCV
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	
	# -- Recuperar direccion de retorno
	lw ra, 12(sp)
	
	# -- Recuperar el puntero de pila
	addi sp, sp, 16
	
	# -- Retornar de la funcion
	ret
	
