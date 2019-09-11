# Solucion a la actividad no guiada 2
#-- Programa contador que se incremete de dos en dos

	.text
	
	#-- Inicializar el regitro x5 a 0
	addi x5, x0, 0
	
bucle:
	#-- Incrementar x5 en dos unidades
	addi x5, x5, 2
	
	#-- Repetir indefinidamente
	b bucle