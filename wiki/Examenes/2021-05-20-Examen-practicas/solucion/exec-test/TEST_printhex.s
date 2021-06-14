#-----------------------------------
#-- Programa principal: TEST_printhex
#-----------------------------------
	
	.globl main
	.include "system.h"
	.include "test.h"
	
	#-- Constantes con los numeros a probar
	.eqv K1 0xCACA
	.eqv K2 0xCAFEBACA
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_printhex ======== \n")
        
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
        li a0, 255
        jal printhex
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

       # ---------------------------------------------------------
       #- Prueba 2: Probar con diferentes valores de conversion
       #----------------------------------------------------------
        
        print_str("\n------> PRUEBA 2\n")
        
        
	print_str("Conversion de numeros: \n")
	
	#-- Convertir numero 1
	li a0, K1
	jal printhex
	
	# -- Convertir numero 2
	li a0, K2
	jal printhex

	#-- Terminar
	exit(0)