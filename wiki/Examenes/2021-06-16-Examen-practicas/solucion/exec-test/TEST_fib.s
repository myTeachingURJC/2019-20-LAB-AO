#-----------------------------------
#-- Programa principal: TEST_fib
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
        print_str("=========== TEST_fib ======== \n")
        
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
        li a1, 255
        jal fib
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

       # ---------------------------------------------------------
       #- Prueba 2: Probar con diferentes valores de conversion
       #----------------------------------------------------------
        
        print_str("\n------> PRUEBA 2\n")
        
        
	print_str("Numeros de fibonacci: \n")
	
	#-- Convertir numero 1
	li a0, K1_a
	li a1, K1_b
	jal fib
	
	# -- Guardar resultado en s0
	mv s0, a0
	
	#-- Imprimir resultado:
	print_str("* Resultado 1: ")
	print_int_reg(s0)
	
	#-- Comprobar resultado
	li t0, K1_r
	beq s0, t0, ok1
	
	print_str("  ERROR!\n\n")
	b next
	
ok1:
	print_str("  OK!\n")
	
next:
	
	#-- Convertir numero 2
	li a0, K2_a
	li a1, K2_b
	jal fib
	
	# -- Guardar resultado en s0
	mv s0, a0
	
	#-- Imprimir resultado:
	print_str("* Resultado 2: ")
	print_int_reg(s0)
	
	#-- Comprobar resultado
	li t0, K2_r
	beq s0, t0, ok2
	
	print_str("  ERROR!\n\n")
	b next2
	
ok2:
	print_str("  OK!\n\n")
	
next2:
	

	#-- Terminar
	exit(0)
