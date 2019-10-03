#-- Solucion al ejercicio 6
#-- Programa para mostrar por el display
#-- el digito 3

	#-- CONSTANTES
	.eqv DISPLAY 0xFFFF0010  #-- Direccion del puerto de salida del display
	
	#-- Valore para que se muestren en el display los diferentes digitos
	.eqv DIG1 0x06  #-- Digito 1
	.eqv DIG2 0x5B  #-- Digito 2
	.eqv DIG3 0x4F  #-- Digito 3
	.eqv DIG4 0x66  #-- Digito 4
	
	.text
	
	#-- x5 es el puntero al display
	li x5, DISPLAY
	
	#-- Valor a sacar por el display
	li x6, DIG4
	
	#-- Sacarlo por el display
	sw x6, 0(x5)
	
	#-- Terminar
	li a7, 10
	ecall