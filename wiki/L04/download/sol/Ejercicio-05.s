##-- Solución al Ejercicio 5
##-- Contador que se envía por el puerto del display

	#-- DEFINICION de constantes
	.eqv INICIO 0         #-- Valor de inicio del contador
	.eqv INC 1            #-- Incremento del contador
	.eqv DISPLAY 0xFFFF0010  #-- Direccion del puerto del display
	
	#------------------------ Código
	.text
	
	#-- X5: contador. Inicializar a INICIO
	li x5, INICIO
	
	#-- x6: Puntero para acceso al Display
	li x6, DISPLAY
	
bucle:

	#-- Sacar el contador actual por el display
	SW x5, 0(x6)
	
	#-- Incrementar contador
	addi x5, x5, INC
	
	#-- Repetir bucle
	b bucle