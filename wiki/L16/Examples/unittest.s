    #-- Macros para funciones y pila
    .include "stack.h"
    .include "stdio.h"
    .include "so.h"

#-------------------------------------------------
#-- assert_str_equal(str1, str2)
#--
#-- Asegurarse que las dos cadenas str1 y str2
#-- son iguales. Si NO lo son, se aborta el test
#--
#-- ENTRADAS:
#--   - a0 (str1): Puntero a cadena 1
#--   - a1 (str2): Puntero a cadena 2
#-- SALIDA:
#--   - Ninguna
#-------------------------------------------------
	.data
result_ok:   .string "OK!\n"
result_fail: .string "FAIL!\n"
msg_abort:   .string "ABORT!\n"
real_cad:    .string "  * Cadena generada: "
expect_cad:  .string "  * Cadena esperada: "


	.text
.global assert_str_equal
assert_str_equal:

	STACK16
	PUSH2(s0, s1)

	#-- Guardar los parametros
	mv s0, a0
	mv s1, a1

	#-- Comparar las cadenas
	jal cmpstr

	#-- Analizar resultado
	beq a0, zero, assert_str_equal_ne

	#-- Las cadenas son iguales!!
	la a0, result_ok
	jal puts
	j assert_str_equal_end

 assert_str_equal_ne: 
    #-- Las cadenas NO son iguales
	#-- Test NO pasado!
	la a0, result_fail
	jal puts

	#------ Imprimir resultados
	#-- Cadena generada
	la a0, real_cad
	jal puts

	mv a0, s0
	jal puts

	li a0, '\n'
	jal putchar

	#-- Cadena esperada
	la a0, expect_cad
	jal puts

	mv a0, s1
	jal puts

	li a0, '\n'
	jal putchar

	#-- Abortar test!
	la a0, msg_abort
	jal puts
	EXIT

assert_str_equal_end:
	POP2(s0, s1)
	UNSTACK16


#-------------------------------------------------
#-- assert_equal(val1, val2)
#--
#-- Asegurarse que los dos numeros son iguales
#-- Si NO lo son, se aborta el test
#--
#-- ENTRADAS:
#--   - a0 (val1): Valor 1: Valor devuelto
#--   - a1 (val2): Valor 2: Valor esperado
#-- SALIDA:
#--   - Ninguna
#-------------------------------------------------
.global assert_equal
assert_equal:

	STACK16
	PUSH2(s0, s1)

	#-- Guardar los parametros
	mv s0, a0
	mv s1, a1

	#-- Comparar los numeros
	bne a0, a1, assert_equal_ne
	
	#-- Los valores son iguales
	la a0, result_ok
	jal puts
	j assert_equal_end

 assert_equal_ne: 
    #-- Los valores NO son iguales
	#-- Test NO pasado!
	la a0, result_fail
	jal puts

	#------ Imprimir resultados
	#-- Imprimir valor devuelto
	PUTSI("Valor devuelto: ")
	PRINT_INTR(s0)
	PRINT_CHARI('\n')

	#-- Imprimir valor esperado
	PUTSI("Valor esperado: ")
	PRINT_INTR(s1)
	PRINT_CHARI('\n')

	#-- Abortar test!
	PUTSL(msg_abort)
	EXIT

assert_equal_end:
	POP2(s0, s1)
	UNSTACK16

ret



#--------------------------------------------
#-- cmpstr(str1, str2)
#--
#-- Comparar dos cadenas
#--
#-- ENTRADA:
#--   - a0 (str1): Puntero a cadena 1
#--   - a1 (str2): Puntero a cadena 2
#--
#-- SALIDA:
#--   - a0: Resultado de la comparacion
#--     - 0: NO son iguales
#--     - 1: Son iguales
#---------------------------------------------
cmpstr:

 cmpstr_next:
	#-- Leer caracteres fuente y destino
	lb t0, 0(a0)
	lb t1, 0(a1)

	#-- Compararlos!
	bne t0, t1, cmpstr_not_equal

	#-- Los caracteres son iguales
	#-- comprobar si hemos llegado al final de la 
	#-- cadena destino
	beq t1, zero, cmpstr_end_equal

	#--- No se ha llegado al final
	#--- Incrementar punteros de las cadenas origen y destino
	addi a0, a0, 1
	addi a1, a1, 1

	#-- Siguiente caracter
	j cmpstr_next

 cmpstr_not_equal: 
    #-- Las cadenas NO son iguales
	li a0, 0
	j cmpstr_end

 cmpstr_end_equal:
	#-- Las cadenas son iguales!!
	li a0, 1

 cmpstr_end:
	ret

