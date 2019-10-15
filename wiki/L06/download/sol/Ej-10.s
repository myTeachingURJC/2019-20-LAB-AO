#-- Solucion al ejercicio 10
#-- Leer las teclas de la primera fila del teclado hexadecimal
#-- y escribir su código en el puerto de salida del display
#-- izquierdo

	#-- Servicios del S.O
	.eqv EXIT 10

	#-- Direccion base de acceso a perifericos
	.eqv BASE 0xFFFF0010
	
	#--- Offset para accdeder a los diferentes perifericos
	
	#-- Display izquierdo
	.eqv DISP_L 01  #-- BASE + 1
	
	#-- Seleccion de la fila
	.eqv KEY_ENA 02  #-- BASE + 2
	
	#-- Lectura del codigo de tecla
	.eqv KEY_RD  04  #-- BASE + 4
	
	.text
	
	#-- Puntero base de acceso a perifericos
	li t0, BASE

	#-- Bucle infinito que está constntemente leyendo la 
	#-- primera fila
bucle:		
	#-- Seleccionar la fila 1
	li t1, 01
	sb t1, KEY_ENA(t0)
	
	#-- Leer la tecla
	lb t2, KEY_RD(t0)
	
	#-- Escribir el código en el display izquierdo
	sb t2, DISP_L(t0)
	
	b bucle
	
	