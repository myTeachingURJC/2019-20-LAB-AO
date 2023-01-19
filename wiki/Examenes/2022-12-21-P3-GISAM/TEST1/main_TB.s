#---------------------------------------------------
#-- Programa de prueba de la funcion doble
#---------------------------------------------------
#-- Se hacen las siguientes llamadas para comprobar la función
#-- doble(8) = 16
#-- doble(1) = 2
#-- doble(16) = 32

	.globl main
	.include "system.h"
	.include "test.h"

	#-- Servicios del sistema operativo
  .include "servicios.s"

	.text

main:
	
	#----------- Calcular doble(i)

  #-- Dar valores a TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

  #-- doble(8)
	li a0, 8
	jal doble

	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir espacio
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall

	#-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs

	#------------ calcular fib(6)

	#-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

    #-- doble(1)
	li a0, 1
	jal doble

	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir espacio
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall

	#-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs


	#------------ calcular fib(10)
	#-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs

	#-- doble(16)
	li a0, 16
	jal doble
	
	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall

	#-- Comprobar que los registros estaticos no se han
  #-- modificado
  check_static_regs
	
	#-- Terminar
	exit(0)
	
	
