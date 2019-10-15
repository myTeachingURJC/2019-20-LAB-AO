#-- Solucion al ejercicio 9
#-- Se tienen dos contadores, uno empieza en 0 y el otro en 1
#-- que se van incrementando en cada pasada de un bucle
#-- infinito. Estos valores se deben escribir en los puertos
#-- de salida de los displays Derecho e izquierdo, respectivamente

	#-- Direccion base de acceso a los displays
	.eqv BASE 0xFFFF0010
	
	#-- Desplazamientos de acceso a los displays
	.eqv DISP_R 0
	.eqv DISP_L 1

	.text
	
	#-- Registro t0 para acceder a los displays de 7 segmentos
	li t0, BASE
	
	
	#-- Contador 1 en registro t1. Inicializado a 0
	li t1, 0
	
	#-- Contador 2 en registro t2. Inicializado a 1
	li t2, 1
	
bucle:	#-- Escribir contadores en los puertos de salida de los displays
	sb t1, DISP_R(t0)
	sb t2, DISP_L(t0)
	
	#-- Incrementar los contadores
	addi t1, t1, 1
	addi t2, t2, 1
	
	#-- Repetir
	b bucle
	