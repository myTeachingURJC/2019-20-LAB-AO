#-- Nuestro primer programa escrito desde cero
#-- Esto que sale en verde son COMENTARIOS
#-- y siempre es lo primero que tenemos que hacer
#-- ¡Somos ingenieros! ¡Hay que documentar!

#-- Programa para asignar el valor 30 al registro x3,
#-- y terminar

	#-- Esto NO es una instruccion. Lo veremos mas
	#-- adelante. Es una Directiva. Se usa para 
	#-- indicar al ensamblador que lo que va a 
	#-- continuacion es codigo
	.text

	#-- Mi primera instruccion
	addi x3, x0, 30   #-- x3 = 0 + 30 = 30
	
	#-- Terminar. Estas instrucciones no saben
	#-- que significan. Lo veremos mas adelante
	#-- Las usamos para terminar el programa y 
	#-- devolver el control al sistema operativo
	li a7, 10
	ecall
	
	
