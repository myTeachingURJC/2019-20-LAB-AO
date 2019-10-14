#-- Ejemplo de lectura de las teclas
#-- de la primera fila delt eclado

	#-- Direccion BASE
	.eqv BASE 0xFFFF0010
	
	#-- Servicios del S.O
	.eqv EXIT 10
	
	#-- Codigo de los digitos
	.eqv DIG_7 0x07
	.eqv DIG_3 0x4F
	
	#------ Acceso al teclado
	
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
	
	b bucle
	
