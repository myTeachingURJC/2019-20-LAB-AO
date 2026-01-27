#-------------------------------------------------------
#--  Prueba de la biblioteca io_rars_uart.s
#--  Realizar dos acciones diferentes según las teclas
#--  pulsadas:
#--    '1': Mostrar los digitos del 0 al 9
#--    '2': Mostrar las letras de la A a la F
#--    'q': Terminar el programa
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	.text
	 
main:
	
	#-- Configurar el modulo de entrada/salida
	jal io_init

menu:	
	#-- Imprimir el prompt
    li a0, '?'
    jal putchar

	#-- Esperar a que se pulse una tecla
	jal getchar
	
	#-- Imprimir la tecla pulsada
	mv s0, a0
	jal putchar
	
	#-- Imprimir un salto de linea
	li a0, '\n'
	jal putchar
	
	
	#-- Según el valor de la tecla se hace una cosa u otra
	li t0, '1'
	beq s0, t0, opcion_1
	li t0, '2'
	beq s0, t0, opcion_2
	li t0, 'q'
	beq s0, t0, fin
	
	#-- Opcion incorrecta. volver al menu
	j menu
	 

	#-- Mostrar los digitos del '0' al '9' 	  
opcion_1: 
    li s0, '0'
   
next_1:
    #-- Imprimir digito actual
    mv a0, s0
    jal putchar 
    
    #-- Obtener el siguiente digito
	addi s0, s0, 1
	
	#-- Repetir si es <= '9'
	li t0, '9'
	ble s0, t0, next_1
	
	#-- Imprimir salto de linea
	li a0, '\n'
	jal putchar
	
	#-- Volver al menu
	j menu

	#-- Mostrar las letras de la 'A' a la 'F'
opcion_2:
	li s0, 'A'
	
next_2:
    #-- Imprimir la letra
    mv a0, s0
    jal putchar
    
    #-- Obtener la siguiente letra
    addi s0, s0, 1
    
    #-- Repetir si es <= 'F'
    li t0, 'F'
	ble s0, t0, next_2
	
	#-- Imprimir salto de linea
	li a0, '\n'
	jal putchar
	
	#-- Volver al menu
	j menu

fin:
    #-- Terminar con la UART
	jal io_close
	EXIT
	
	
