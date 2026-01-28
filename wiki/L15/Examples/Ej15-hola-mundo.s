#-------------------------------------------------------
#--  Prueba de la funcion puts()
#--  Ejemplo "hola mundo"
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	
	.data
msg1:  .string "Hola Mundo!\n"
	
	.text
	 
main:
	
	#-- Configurar el modulo E/S de bajo nivel
	jal io_init

	#-- Imprmir una cadena
	la a0, msg1
	jal puts

    #-- Cerrar la salida de bajo nivel
	jal io_close
	EXIT
	
