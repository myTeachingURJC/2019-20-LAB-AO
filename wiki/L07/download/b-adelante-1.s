#-- Ejemplo de salto incondicional
#-- hacia atras	
	.text
	
	#-- Inicializar t0 a 0
	li t0, 0
	
	#-- Inicializar t1 a 2
	li t1, 2
	
bucle:
	#-- Incrementar t0 en 1
	addi t0, t0, 1
	
	#-- Incrementar t1 en 2 unidades
	addi t1, t1, 2
	
	#-- Repetir el bucle (infinitas veces)
	#-- Salto hacia atras
	b bucle
	
	#-- Como es un bucle infinito
	#-- El codigo que hay aqui nunca se ejecuta