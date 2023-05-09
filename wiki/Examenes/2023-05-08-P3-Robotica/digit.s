	.globl digit
	
	#-- Direccion de acceso al display de 7 segmentos
	.eqv DISP_R 0xFFFF0010
#------------------------------------------------------------
#-- Funcion digit(n): 
#-- Mostrar un digito por el display de 7 segmentos derecho 
#--
#-- ENTRADAS:
#--   * a0 (n): digito a mostrar (0-9)
#-- SALIDAS:
#--   * Ninguna
#-------------------------------------------------------------

	.data

	#-- Tabla de conversion digito --> valor a enviar
tabla:  .byte 0x3F  #-- Digito 0
        .byte 0x6   #-- Digito 1
        .byte 0x5B  #-- Digito 2 
        .byte 0x4F  #-- Digito 3
        .byte 0x66  #-- Digito 4
        .byte 0x6D  #-- Digito 5
        .byte 0x7D  #-- Digito 6
        .byte 0x07  #-- Digito 7
        .byte 0x7F  #-- Digito 8
        .byte 0x67  #-- Digito 9
        
	.text

digit:

	#-- t0: Direccion base del display
	li t0, DISP_R
	
	#-- t1: Direccion base de la tabla de conversion
	#-- entre digito y  valor a enviar al display
	la t1, tabla
	
	#-- Direccion del digito correspondiente en la tabla
	add t1, t1, a0
	
	#-- Leer el valor a enviar al display
	lb t2, 0(t1)
	
	#-- Mostrar el digito en el display
	sb t2, 0(t0) 

	ret
	
	