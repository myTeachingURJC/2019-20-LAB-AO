#---------------------------------------------------
#-- Programa de prueba de la funcion de fibonacci
#---------------------------------------------------
#-- Se calculan los siguientes terminos de fibonacci
#-- fib(3) = 2
#-- fib(6) = 8
#-- fib(10 = 55

	.globl main
	.include "system.h"
	.include "test.h"

	#-- Servicios del sistema operativo
  .include "servicios.s"

	.text

main:
	
	#----------- Calcular fib(3)

	#-- Dar valores TODOs los registros temporales y de argumento
  #-- para asegurar que la funcion llamada no asume que tienen
  #-- el valor 0
  init_temp_regs
  
  #-- Dar valores conocidos a los registros estaticos
  init_static_regs
	li a0, 3
	jal fib

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

	li a0, 6
	jal fib

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

	li a0, 10
	jal fib
	
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
	
	
