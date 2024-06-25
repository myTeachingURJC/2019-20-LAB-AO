#-----------------------------------------------------------
#-- rect: Dibujar un rectangulo de 5 lineas
#--
#-- ENTRADAS:
#--   Ninguna
#-- SALIDA:
#--   Ninguna
#----------------------------------------------------------
# INSTRUCCIONES:
#  - Añade código en las zonas indicadas (comienzo y fin) para
#    hacer que la funcion rect() funcione correctamente
#
#  - El codigo dentro de la zona CODIGO ORIGINAL no se puede
#    modificar
#----------------------------------------------------------------

	.globl rect
	
	.eqv MAX 5    #-- Lineas del rectangulo
	.eqv WIDTH 20 #-- Anchura del rectangulo
	
	.text
	
rect:

	#-- NOTA: Añade aquí lo que consideres necesario para que
	#-- la subrutina funcione
	



	
	#---------------------------------------
	#-- CODIGO ORIGINAL: NO CAMBIAR NADA
	#--------------------------------------

	#-- Inicializar contador de lineas
	li s0,1
	
bucle:	
	#-- Dibujar linea de WIDTH caracteres
	li a0, WIDTH
	jal linea
	
	#-- Incrementar contador de linea 
	addi s0,s0,1
	
	#-- Si hemos completado la cantidad de lineas: terminar
	li t0,MAX
	ble s0,t0,bucle
	
	#-- Fin.... Hemos terminado

	#--------------------------
	#--  FIN DEL CODIGO ORIGINAL
	#-------------------------
	
	
	#-- NOTA: Añade aqui lo que consideres necesario
	#-- para que la subrutina funcione
	
	
	
	
	
	
	
	
