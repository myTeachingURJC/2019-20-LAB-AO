#-------------------------------------------------------
#--  Prueba de la funcion gets()
#--  Pedir el Login al usuario, y saludarle
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	#-- Tamaño maximo del buffer donde guardar la cadena del login
	.eqv MAX 20
	
	.data
msg1:  .string "Login: "
msg2:  .string "\nBienvenido "
login: .space MAX
	
	.text
	 
main:
	
	#-- Configurar el modulo E/S de bajo nivel
	jal io_init

	#-- Imprimir una cadena
	la a0, msg1
	jal puts
	
	#-- Esperar hasta que se introduzca una cadena
	la a0, login
	li a1, MAX
	jal gets
	
	#-- Imprimir Mensaje de bienvenida
	la a0, msg2
	jal puts
	
	#-- Imprimir nombre del usuario
	la a0, login
	jal puts
	
    #-- Cerrar la salida de bajo nivel
	jal io_close
	EXIT
	
