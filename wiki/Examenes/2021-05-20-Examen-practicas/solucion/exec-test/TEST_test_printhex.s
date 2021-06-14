#-----------------------------------
#-- Programa principal: TEST_test_printhex
#-----------------------------------
	
	.globl main
	.include "system.h"
	.include "test.h"
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_test_printhex ======== \n")
        
        #-- Prueba 1: Comprobar que se llama a la funcion
        #-- y que se respeta el convenio
        print_str("\n------> PRUEBA 1\n")
        
        #-- Dar valores TODOs los registros temporales y de argumento
        #-- para asegurar que la funcion llamada no asume que tienen
        #-- el valor 0
        init_temp_regs
        
        #-- Dar valores conocidos a los registros estaticos
        init_static_regs
        
        #-- Llamar a la funcion
        jal test_printhex
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

	#-- Terminar
	exit(0)
