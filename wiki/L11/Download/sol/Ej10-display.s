#------------------------------------------------------
#-- Subrutina para mostrar un digito '0'-'9' en el 
#-- display de 7 segmentos
#-- ENTRADAS:
#--   a0: Numero a mostrar
#-- DEVUELVE:
#--   nada
#------------------------------------------------------

	#-- Punto de entrada
	.globl print_display
	
	#-- Direccion en memoria del display derecho
	.eqv DISP 0xFFFF0010
	
	.data
	
	#-- Tabla con los valores a envair
	#-- para mostrar los numeros 0 - 9
	#-- en el display de 7 segmentos
tabla:	.byte 0x3F  #-- Digito 0
	.byte 0x06  #-- Digito 1
	.byte 0x5B  #-- Digito 2
	.byte 0x4F  #-- Digito 3
	.byte 0x66  #-- Digito 4
	.byte 0x6D  #-- Digito 5
	.byte 0x7D  #-- Digito 6
	.byte 0x07  #-- Digito 7
	.byte 0x7F  #-- Digito 8
	.byte 0x6F  #-- Digito 9
	
	.text
	
print_display:	

	#-- Puntero base a la tabla de conversion
	la t0, tabla
	
	#-- Obtener direccion del digito: t0 + a0
	add t1, t0, a0
	
	#-- Leer el valor
	lb t2, 0(t1)
	
	#-- Meter en a0 la direccion base del display
	li a0, DISP
	
	#-- Escribirlo en la direccion del display de 7 segmentos
	sb t2, 0(a0)
	
	ret