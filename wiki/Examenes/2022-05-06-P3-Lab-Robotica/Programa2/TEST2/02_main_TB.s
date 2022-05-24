
	.globl main
	.include "system.h"
	.include "test.h"

	#-- Servicios del sistema operativo
  .include "servicios.s"


	.text
	
main:

	#-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

	#-- Imprimir primer bloque
	li a0, '-'
	li a1, 2
	jal bloque

	#-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs

	#----------------------------------------------------
	
  #-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

	#-- Imprimir segundo bloque
	li a0, '='
	li a1, 3
	jal bloque

  #-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs

  #-----------------------------------------------------

	#-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

	#-- Imprimir segundo bloque
	li a0, 'O'
	li a1, 4
	jal bloque

	#-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs

	#-- Terminar
	exit(0)
	
