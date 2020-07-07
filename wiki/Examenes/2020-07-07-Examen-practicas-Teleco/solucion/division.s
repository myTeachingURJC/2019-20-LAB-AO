#-- Programa para hacer la división por software

  .globl division

  .text
	
# -----------------------------------------------------
# - Funcion division(a,b): Calcular a / b y el resto 
# - Entradas:
# -   a0: Dividendo (a)
# -   a1: Divisor (b)
# - Salidas
#-    a0: cociente
#-    a1: Resto
#------------------------------------------------------
division: 
	
	# -- Inicializar cociente y resto a 0
	li t0, 0  #-- Cociente
	li t1, 0  #-- Resto
	
bucle:	
	# -- Comprobar si Dividendo < Divisor (a0 < a1)
	blt a0, a1, fin  #-- Si: hemos terminado
	
	#-- El divisor es mayor o igual que dividendo
	#-- Calcular el resto r = a - b
	sub t1, a0, a1  #-- t1 = a0 - a1
	
	#-- El resto es el nuevo dividendo
	mv a0, t1
	
	#-- Incrementar el cociente
	addi t0, t0, 1
	
	# -- Siguiente iteracion
	b bucle
	
	
fin:
	#-- Devolver el cociente y el resto
	mv a0, t0  #-- Cociente
	mv a1, t1  #-- Resto	
	
	ret
	
	
	
	
	
