
	.globl polinomio

	.text
# --------------------------------------------
# -- polinomio. Funcion para evaluar el polinomio 
# --  p(x) = x² + x + 1
# --
# -- ENTRADAS:
# --  a0: x
# -- SALIDAS:
# --- a0: p(x)
polinomio:

	# -- Se trata de una funcion intermdia
	# -- Hay que crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	# -- Calcular p = x² + x + 1
	# --          t1  t0  s0
	#-- a0 = x
	
	# -- s0: x
	mv s0, a0
	
	#-- t0 = x²
	mv a1, a0
	jal mul2u
	
	#-- t1 guarda el resultado parcial
	# -- t1 = x² + x
	add t1, a0, s0
	
	#-- Resultado final
	addi t1, t1, 1
	
	# -- Devolver resultado
	mv a0, t1
	
	# -- Recuerar direccion de retorno
	# -- y liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	
	ret

