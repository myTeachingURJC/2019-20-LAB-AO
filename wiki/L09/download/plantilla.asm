#-- Plantilla con programa principal y Subrutinas

	.include "servicios.asm"
	
#-----------------------------------------------------------
#--- PROGRAMA PRINCIPAL
#-----------------------------------------------------------

	#-- Datos para el programa principal
	.data	
	
	#-- Código del programa principal
	.text
	
	#-- Punto de ENTRADA
	
	#---  ....
	
	#-- Punto de SALIDA
	li a7, EXIT
	ecall
	
#---------------- FIN PROGRAMA PRINCIPAL ------------------------

#---------------------------------------------------------------
#--- SUBRUTINA 1
#---------------------------------------------------------------

	#-- Hacer el punto de entrada global
	.globl subr1

	#-- Datos de la subrutina 1
	.data	
	
	#-- Código de la subrutina 1
	.text
	
	#-- PUNTO DE ENTRADA
subr1:  

	#--- .....
	
	#-- PUNTO DE SALIDA
	ret
