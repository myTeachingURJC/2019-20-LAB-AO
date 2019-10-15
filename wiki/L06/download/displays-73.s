#-- Ejemplo de uso de los 2 displays
#-- de 7 segmentos: el izquierdo y el derecho
#-- Se saca el numero 73 por ellos

	#-- Puertos de perifericos
	.eqv BASE 0xFFFF0010  #-- Direccion base
	
	#-- Servicios del S.O
	.eqv EXIT 10
	
	#-- Offset de acceso a los displays
	.eqv DISP_R 0  #-- Display derecho: BASE + 0
	.eqv DISP_L 1  #-- Display izquierdo: BASE + 1
		
	#-- Codigo de los digitos
	.eqv DIG_7 0x07
	.eqv DIG_3 0x4F
	
	.text
	
	#-- Puntero de acceso a los displays
	#-- Se toma la dirección base. A partir de ella se accede 
	#-- a ambos displays
	li t0, BASE
	
	#-- Sacar el numero 3 por el display derecho
	li t1, DIG_3
	sb t1, DISP_R(t0)
	
	#-- Sacar el numero 7 por el display izquierdo
	li t1, DIG_7
	sb t1, DISP_L(t0)
	
	#-- Terminar
	li a7, EXIT
	ecall
