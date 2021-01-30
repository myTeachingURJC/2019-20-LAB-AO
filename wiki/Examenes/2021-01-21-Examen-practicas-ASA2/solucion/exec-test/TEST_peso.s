#-----------------------------------
#-- Programa principal: Test_peso
#-----------------------------------

	.globl main
	.include "system.h"
	.include "test.h"
	
	#-- Resultados esperados
	.eqv CORRECT2 195
	.eqv CORRECT3 420
	
	.data
test1:  .string "ab\n"  #-- Cadena para test1
test2:	.string "ab\n"  #-- Cadena para test2	
test3:  .string "hola"  #-- Cadena para test3

	.text
main:

	#-- Nombre del test: 
        print_str("=========== TEST_peso ======== \n\n")
        
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
        jal peso
        
        #-- Comprobar que los registros estaticos no se han
        #-- modificado
        check_static_regs

	#-- También de paso se comprueba que la funcion no haya
	#-- petado
	print_str("OK!!\n\n")

        # ---------------------------------------------------------
        #- Prueba 2: comprobar que el valor devuelto es correcto
        #----------------------------------------------------------
        
        print_str("----> Prueba 2\n")


	#-- Calcular el peso de cad
	la a0, test2
	jal peso

	#-- Guardar peso en s0
	mv s0, a0


	print_str("Peso de la cadena ")
	
	#-- Imprimir cadena original
	la a0, test2
	print_pstr(a0)
	print_str(": ") 
	
	#-- Imprimir peso
	print_int_reg(s0)
	print_str("\n")
	
	#-- Comprobar si el resultado es correcto
	assert(s0, CORRECT2)
	print_str("OK!!\n")
	
	# ---------------------------------------------------------
        #- Prueba 3: comprobar que el valor devuelto es correcto
        #----------------------------------------------------------
        
        print_str("----> Prueba 3\n")


	#-- Calcular el peso de cad
	la a0, test3
	jal peso

	#-- Guardar peso en s0
	mv s0, a0

	print_str("Peso de la cadena ")
	
	#-- Imprimir cadena original
	la a0, test3
	print_pstr(a0)
	print_str(": ") 
	
	#-- Imprimir peso
	print_int_reg(s0)
	print_str("\n")
	
	#-- Comprobar si el resultado es correcto
	assert(s0, CORRECT3)
	print_str("OK!!\n")


	#-- Terminar
	exit(0)
