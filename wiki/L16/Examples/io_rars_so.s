#----------------------------------------------------------------
#-- Modulo io_rars_so
#--   Entrada/salida a traves del sistema operativo del rars
#--
#----------------------------------------------------------------
.include "so.h"

#-------------------------------------------------------------
#-- io_init()
#--
#--  Configurar el modulo de Entrada/salida de bajo nivel
#--  Se debe llamar antes de ejecutar cualquier otra funcion
#--  de este modulo
#--
#--  En la implementacion usando el so de RARs, no hace
#--  falta configurar nada, por lo que esta funcion
#--  simplemente retorna
#-------------------------------------------------------------
.global io_init
io_init:

	#-- No es necesario configurar nada

	ret	
	
	
#-------------------------------------------------------------
#-- io_close()
#--
#-- Terminar de usar el modulo de entrada/salida. Finalizar
#-- las operaciones pendientes
#-------------------------------------------------------------
.global io_close
io_close:
	
	#-- En esta implementacion no es necesario
	#-- hacer nada
	ret
	
	
#---------------------------------------------------------------
#-- putchar(c): Imprimir un caracter
#--
#-- ENTRADA:
#--   - a0 (c): Carácter a imprimir
#--
#---------------------------------------------------------------
.global putchar
putchar:

    #-- Llamar al servicio del so
    #-- para imprimir un caracter
    PRINT_CHAR
   
	ret

#--------------------------------------------------------
#-- getchar()
#--
#-- Esperar a que se pulse una tecla
#-- Esta funcion es BLOQUEANTE
#--
#-- SALIDA:
#--   a0 (car): Caracter introducido por el usuario
#--
#-------------------------------------------------------
.global getchar
getchar:

    #-- Llamar al servicio del so
    #-- para leer un caracter
    READ_CHAR
    
	ret

