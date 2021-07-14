#-----------------------------------
#-- Programa principal: TEST_printv_test
#-----------------------------------
	
	.globl main
	.include "system.h"
	.include "test.h"
	
	#-- Numeros de fibonacci para las pruebas 
	.eqv K1_a 5   #-- Num Fib
	.eqv K1_b 8   #-- Num Fib
	.eqv K1_r 13  #-- Resultado
	
	.eqv K2_a 233
	.eqv K2_b 377
	.eqv K2_r 610 #-- Resultado
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_printv_test ======== \n")
        
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
        li a0, 10
        jal printv_test
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

       # ---------------------------------------------------------
       #- Prueba 2: Probar con diferentes valores de conversion
       #----------------------------------------------------------
        
        print_str("\n------> PRUEBA 2\n")
        
        
	print_str("Imprimir 5 vectores de prueba: \n")
	
	
	li a0, 5
	jal printv_test
	
	print_str("\n\nImprimir 2 vectores de prueba: \n")
	
	li a0, 2
	jal printv_test
	
	#-- 0 Multiplos de 5
	print_str("\n\n1 vectores de prueba: \n")
	
	li a0, 1
	jal printv_test
	
	#-- Terminar
	exit(0)
	
