#-------------------------------------------------------
#--  Prueba de ECO para la UART del Rars
#--  Todo lo que se recibe (teclado) se envía hacia
#--  la pantalla
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	.text
	 
main:
	
	#-- Configurar el modulo de entrada/salida
	jal io_init

loop:	
			
	#-- Esperar a que se reciba un caracter (tecla pulsada)
	jal getchar
	
	#-- Si el carácter pulsado es '0', se termina
	li t0, '0'
	beq a0, t0, fin
	
	#-- Enviar el caracter recibido (Hacer eco en la pantalla)
	jal putchar
	
	#-- Repetir 
	j loop
	
fin:
    #-- Terminar con la UART
	jal io_close
	EXIT
	
	
