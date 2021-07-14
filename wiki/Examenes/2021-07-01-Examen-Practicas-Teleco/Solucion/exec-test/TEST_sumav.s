#-----------------------------------
#-- Programa principal: TEST_fib
#-----------------------------------
	
	.globl main
	.include "system.h"
	.include "test.h"
	
	#-- Vectoresp para las pruebas
	.eqv V1_x 1   
	.eqv V1_y 2   
	.eqv V2_x 10 
	.eqv V2_y 20 
	
	.eqv V3_x -10   
	.eqv V3_y -1   
	.eqv V4_x 255 
	.eqv V4_y 100 
	
	
	
	# -- Resultados esperados
	# -- Prueba 1
	.eqv R1_x 11
	.eqv R1_y 22
	
	.eqv R2_x 245
	.eqv R2_y 99
	
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_sumav ======== \n")
        
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
        li a2, 255
        li a3, 255
        jal sumav
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

       # ---------------------------------------------------------
       #- Prueba 2: Probar con diferentes valores de conversion
       #----------------------------------------------------------
        
        print_str("\n------> PRUEBA 2\n")
        
        
	print_str("Suma de vectores V1 + V2: \n")
	
	#-- Calcular V1 + V2
	li a0, V1_x
	li a1, V1_y
	li a2, V2_x
	li a3, V2_y
	jal sumav
	
	# -- Guardar resultado en s0 y s1
	mv s0, a0
	mv s1, a1
	
	#-- Imprimir resultado:
	print_str("* Resultado 1: ")
	print_int_reg(s0)
	print_str(", ")
	print_int_reg(s1)
	
	#-- Comprobar resultado
	li t0, R1_x
	beq s0, t0, ok1_x
	
	print_str("\n   ERROR en X!\n")
	b next1
	
ok1_x:
	print_str("\n  OK x!\n")
	
next1:
	
	li t0, R1_y
	beq s1, t0, ok1_y
	
	print_str("   ERROR en Y!\n\n")
	b next2
	
ok1_y:
	print_str("  OK y!\n")
	
next2:
	
	print_str("\nSuma de vectores V3 + V4: \n")
	
	#-- Calcular V3 + V4
	li a0, V3_x
	li a1, V3_y
	li a2, V4_x
	li a3, V4_y
	jal sumav
	
	# -- Guardar resultado en s0 y s1
	mv s0, a0
	mv s1, a1
	
	#-- Imprimir resultado:
	print_str("* Resultado 2: ")
	print_int_reg(s0)
	print_str(", ")
	print_int_reg(s1)
	
	#-- Comprobar resultado
	li t0, R2_x
	beq s0, t0, ok2_x
	
	print_str("\n   ERROR en X!\n")
	b next3
	
ok2_x:
	print_str("\n  OK x!\n")
	
next3:
	
	li t0, R2_y
	beq s1, t0, ok2_y
	
	print_str("   ERROR en Y!\n\n")
	b next4
	
ok2_y:
	print_str("  OK y!\n")
	
next4:



	#-- Terminar
	exit(0)
