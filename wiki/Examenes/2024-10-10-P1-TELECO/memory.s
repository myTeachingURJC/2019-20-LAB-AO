#-- Calcular la expresion: f = x + 2y + 4z
#-- x,y,z son variables inicializadas a 1 en el segmento de datos
#-- f es otra variable

	.data
	
	#-- Variables (ESPECIFICACIONES)
x:	.word 1  #-- Inicializada a 1 por ESPECIFICACIONES
y:	.word 1  #-- Inicializada a 1 por ESPECIFICACIONES
z:	.word 1  #-- Inicializada a 1 por ESPECIFICACIONES
f:	.word 0

	.text
	
	#-- x1 contiene la direccion de la variable x
	#-- se usa para acceder a todas ellas
	la x1,x
	
	#-- f = x  + 2y + 4z
	#  x10  x2   x3   x4
	
	#-- Leer x
	lw x2,0(x1)  #-- x2 = x
	
	#-- Leer y. Calcular 2y
	lw x3,4(x1)  #-- x3 = y
	add x3,x3,x3 #-- x3 = 2y
	
	#-- Leer z. Calcular 4z
	lw x4,8(x1)  #-- x4 = z
	add x4,x4,x4 #-- x4 = 2z
	add x4,x4,x4 #-- x4 = 4z
	
	#-- Calculo final: f = x2 + x3 + x4  (x + 2y + 4z)
	add x10,x2,x3
	add x10,x10,x4
	
	#-- Almacenar la variable f en memoria
	#-- que está 12 bytes (0xC) más arriba que x
	sw x10,0xC(x1)
	
	#-- Mostrar f en el display de 7 segmentos
	li x2,0xFFFF0010
	sw x10,0(x2) 
	
	#-- Terminar
	li a7, 10
	ecall
