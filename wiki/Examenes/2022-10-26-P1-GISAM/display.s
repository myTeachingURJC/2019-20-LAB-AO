	#-- Calcular la expresion digito = X + Y + W - T + 2
	
	#-- Direccion de memoria del display de 7 segmentos
	.eqv DISP_R 0xFFFF0010

	#-- (Opcional) Valores iniciales de las variables de la expresion
	#-- (Usar constantes es una buena practica de programacion)
	.eqv X 128
	.eqv Y 32
	.eqv W 4
	.eqv T 64 
	
	#--  Segmento de datos
	.data
	
	#-- Variable donde depositar el resultado (ESPECIFICACION)
digito:	.word 0

	.text

	#-- Realizar la inicializacion
	#-- Registros usados: a --> x1, b-->x2, c-->x3, d-->x4
	#-- digito -> x5
	li x1, X
	li x2, Y
	li x3, W
	li x4, T
	
	#-- Calcular la expresion
	#-- Expresion: digito = a + b + c - d + 2
	add x5, x1, x2  #-- x5 = a + b
	add x5, x5, x3  #-- x5 = a + b + c
	sub x5, x5, x4  #-- x5 = a + b + c - d
	addi x5, x5, 2  #-- x5 = a + b + c + 2

	#-- Almacenar expresion en variable de memoria (ESPECIFICACION)
	#-- El registro x6 contiene la direccion de memoria
	la x6, digito
	sw x5, 0(x6)
	
	#-- Enviar resultado al display de 7 seg (ESPECIFICACION)
	li x6, DISP_R
	sw x5, 0(x6)
	
	#-- Terminar
	li a7, 10
	ecall
	
	
