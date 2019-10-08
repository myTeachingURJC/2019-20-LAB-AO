#-- Ejercicio 5
#-- Pedir un numero entero al usuario
#-- y enviarlo tal cual al display de 7 segmentos derecho
#-- Test: el 255 (0xFF) debe encender todos los segmentos

	#-- Direccion del display derecho
	.eqv DISP_R 0xFFFF0010
	.eqv EXIT      10
	.eqv READ_INT  5 

	.text
	
	#-- Pedir Numero al usuario
	li a7, READ_INT
	ecall
	
	#-- El valor está en a0
	#-- t0 = puntero para acceder al display
	li t0, DISP_R
	
	#-- Sacar el numero por el display
	sw a0, 0(t0)
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	