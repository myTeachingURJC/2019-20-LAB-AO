#-- Ejemplo de salto incondicional
#-- a la propia instrucción: offset 0
	.text
	
	#-- Salto a la propia instruccion
	#-- Esto es un bucle infinito, que
	#-- no hace nada
inf:	j inf