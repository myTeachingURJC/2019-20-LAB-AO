#------------------------------------------
#-- Banco de pruebas de la funcion triangulo
#------------------------------------------

	.globl main
	.include "system.h"
	.include "test.h"

	#-- Servicios del sistema operativo
  	.include "servicios.s"

	.text

main:
	
  #----------- Comprobar convenio uso registros

  #-- Dar valores a TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

  #-- Llamar a la funcion rect
  jal rect

  #-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs

  #-- Terminar
  exit(0)
