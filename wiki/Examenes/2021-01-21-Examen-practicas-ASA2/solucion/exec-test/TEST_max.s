#-----------------------------------
#-- Programa principal: Test_max
#-----------------------------------
	
	.globl main
	.include "system.h"
	.include "test.h"
	
	#-- Constantes con los numeros a probar
	.eqv K1 1500
	.eqv K2 2222
	
	#-- Resultado esperado
	.eqv CORRECT 2222
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_max ======== \n")
        
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
        li a0, 200
        li a1, 300
        jal max
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

       # ---------------------------------------------------------
       #- Prueba 2: comprobar que el valor devuelto es correcto
       #----------------------------------------------------------
        
        print_str("\n------> PRUEBA 2\n")
        
        
	print_str("Calcular valor max entre: ")
	print_int(K1)
	print_str(" y ")
	print_int(K2)
	
	#-- Llamar a max
	li a0, K1
	li a1, K2
	jal max
	
	#-- Guardar el resultado en s0
	#-- (se podría usar tambien un registro temporal)
	mv s0, a0
	
	#-- Imprimir el resultado
	print_str("\nResultado: ")
	
	mv a0, s0
	li a7, PRINT_INT
	ecall
	
	print_str("\n")
	
	#-- Comprobar si el resultado es correcto
	assert(s0, CORRECT)

	#-- Terminar
	exit(0)
