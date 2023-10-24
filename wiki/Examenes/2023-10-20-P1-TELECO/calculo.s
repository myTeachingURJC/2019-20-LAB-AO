#-- Calcular las expresiones
#--  f = 3X - Y + 1, donde X, Y, Z son tres CONSTANTES inicializadas a 10, 5 y 3 respectivamente
#--  g = f - Z
#--
#--  f y g son VARIABLES
#--  X,Y,Z son CONSTANTES inicializadas a 10, 5 y 3 respectivamente

	#-- Constantes (ESPECIFICACIONES)
	.eqv X 10
	.eqv Y 5
	.eqv Z 3

	#-- Variables (ESPECIFICACIONES)
	.data
f:	.word 0    #-- f en la primera direccion (ESPECIFICACION)
g:	.word 0    #-- g en la siguiente direccion (de palabra) (ESPECIFICACION)

	.text
	
	#-- Registros usados para los calculos
	#-- x5 --> X
	#-- x6 --> Y
	#-- x7 --> Z
	
	#-- Inicializar los registros con los valores de las constantes
	li x5, X
	li x6, Y
	li x7, Z
	
	#-- Calcular f = 3X - Y + 1
	#-- x10 --> f
	add x10, x5, x5   #-- f = X + _X
	add x10, x10, x5  #-- f = X + X + X = 3X
	sub x10, x10, x6  #-- f = 3X - Y
	addi x10, x10, 1  #-- f = 3X - Y + 1
	
	#-- Almacenar variable f
	la x8, f       #--- x8: Direccion de f
	sw x10, 0(x8)
	
	#-- Calcular g:  g = f - Z
	sub x10, x10, x7
	
	#-- Almacenar variable g
	#-- g se encuentra 4 bytes por encima de f
	sw x10, 4(x8)
	
	
	#-- Este programa tiene 14 instrucciones... CUMPLE EL BONUS!!
	
	#-- Terinar
	li a7, 10
	ecall



