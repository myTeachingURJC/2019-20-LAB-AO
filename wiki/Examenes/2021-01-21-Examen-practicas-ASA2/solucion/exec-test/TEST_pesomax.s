#-----------------------------
#-- Programa principal de pruebas: test_pesomax
#-----------------------------------------------

	.globl main

	.include "system.h"
	.include "test.h"

	#-- Resultados esperados
	.eqv CORRECT2 294
	.eqv CORRECT3 528

	.eqv MAX 100

	.data
	
test1:   .string "ab\n"	
test2_1: .string "ab\n"
test2_2: .string "abc\n"


	#-- Cadenas introducidas por el usuario
cad1:	.space MAX
cad2:   .space MAX

msg1:   .string "\nIntroduzca cadena 1: "
msg2:   .string "Introduzca cadena 2: "
msg3:   .string "Peso maximo: "
	
	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_pesomax ======== \n\n")
        
        #-- Prueba 1: Comprobar que se llama a la funcion
        #-- y que se respeta el convenio
        print_str("------> PRUEBA 1\n")
        
        #-- Dar valores TODOs los registros temporales y de argumento
        #-- para asegurar que la funcion llamada no asume que tienen
        #-- el valor 0
        init_temp_regs
        
        #-- Dar valores conocidos a los registros estaticos
        init_static_regs
        
        #-- Llamar a la funcion
        la a0, test1
        mv a1, a0
        jal pesomax
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        #-- También de paso se comprueba que la funcion no haya
	#-- petado
        check_static_regs
		
	# ---------------------------------------------------------
        #- Prueba 2: comprobar que el valor devuelto es correcto
        #----------------------------------------------------------
        
        print_str("\n----> PRUEBA 2\n")


	#-- Calcular el peso maximo de las cadenas
	la a0, test2_1
	la a1, test2_2
	jal pesomax

	#-- Guardar peso en s0
	mv s0, a0

	print_str("Peso maximo: ")
	
	#-- Imprimir peso
	print_int_reg(s0)
	print_str("\n")
	
	#-- Comprobar si el resultado es correcto
	assert(s0, CORRECT2)
	
	# ---------------------------------------------------------
        #- Prueba 3: comprobar que el valor devuelto es correcto
        #----------------------------------------------------------
        
        print_str("\n----> PRUEBA 3\n")


	#-- Calcular el peso maximo de las cadenas
	la a0, test3_1
	la a1, test3_2
	jal pesomax

	#-- Guardar peso en s0
	mv s0, a0

	print_str("Peso maximo: ")
	
	#-- Imprimir peso
	print_int_reg(s0)
	print_str("\n")
	
	#-- Comprobar si el resultado es correcto
	assert(s0, CORRECT3)
				

	#-- Terminar
	exit(0)
	
	.data
test3_1: .string "hola"
test3_2: .string "adios"
