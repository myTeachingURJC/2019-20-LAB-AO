##-- Solución al Ejercicio 7
##-- Leer los valores de una tabla y mostrar en el display
##-- Los valores de la tabla haran que en el display aparezcan
##-- los digitos 1,2,3 y 4

	#-- Definiciones. Estos indetificadores nos permiten acceder
	#-- directamente a los elementos de la tabla: E1, E2, E3 y E4
	.eqv E1 0
	.eqv E2 4
	.eqv E3 8
	.eqv E4 0xC
	
	#-- Estos son las constantes para representar los digitos en el 7 segmentos
	#-- Valore para que se muestren en el display los diferentes digitos
	.eqv DIG1 0x06  #-- Digito 1
	.eqv DIG2 0x5B  #-- Digito 2
	.eqv DIG3 0x4F  #-- Digito 3
	.eqv DIG4 0x66  #-- Digito 4
	
	#-- Direccion del display
	.eqv DISPLAY 0xFFFF0010
	
	#----------------------- Variables
	.data
	
	#-- Tabla de 4 elementos, inicializados a ciertos valores
tabla:	.word DIG1 
	.word DIG2
	.word DIG3
	.word DIG4
	
	
	#------------------------ Código
	.text
	
	#-- x5 es un puntero a la tabla (x5 contiene la direccion del primer elemento de la tabla)
	la x5, tabla
	
	#-- x6 es el puntero al display
	li x6, DISPLAY
	
	#-- Leer el primer elmento y sacarlo por el display
	lw x10, E1(x5)
	sw x10, 0(x6)
	
	#-- Leer el segundo elemento y sacarlo por el display
	lw x10, E2(x5)
	sw x10, 0(x6)
	
	#-- Leer el tercer elemento y sacarlo por el display
	lw x10, E3(x5)
	sw x10, 0(x6)
	
	#-- Leer el cuarto elemento y sacarlo por el display
	lw x10, E4(x5)
	sw x10, 0(x6)
	
	
	
	#-- Terminar
	li a7, 10
	ecall
