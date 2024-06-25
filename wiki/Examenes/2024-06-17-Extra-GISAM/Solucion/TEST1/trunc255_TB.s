#---------------------------------------------------
#-- Programa de prueba de la funcion trunc255()
#---------------------------------------------------

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

  #-- trunc255(1)
  li a0, 1
  jal trunc255

  #-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs
	
  #---- Test 1: Comprobar funcionalidad
  #-- trunc255(5)
  li a0, 5
  jal trunc255

  assert(a0,5)

  #---- Test 2: Comprobar funcionalidad
  #-- trunc255(300)
  li a0, 300
  jal trunc255

  assert(a0,255)

#---- Test 3: Comprobar funcionalidad
  #-- trunc255(250)
  li a0, 250
  jal trunc255

  assert(a0,250)


  #-- Terminar
  exit(0)
	
	
