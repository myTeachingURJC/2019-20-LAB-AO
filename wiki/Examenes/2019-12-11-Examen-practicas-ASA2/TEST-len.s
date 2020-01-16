
#-- PRUEBAS DE LA FUNCION LEN
#-- Pruebas de la funcion len

	.include "servicios.asm"

	#-- Cadenas de prueba y sus valores correctos
	.eqv CAD1 "Hola\n"
	.eqv VAL1 4
	
	.eqv CAD2 "URJC"
	.eqv VAL2 4
	
	.eqv CAD3 "Esta es una prueba mas larga\n"
	.eqv VAL3 28
	
	.eqv CAD4 "Hola"
	.eqv VAL4 4

	.data
	

msg1:   .string "Calculado:"
msg2:   .string " / Esperado:"
error:  .string " --->FALLADO\n"
ok:     .string " --->OK\n"


cad1:   .string CAD1
cad2:   .string CAD2
cad3:   .string CAD3
cad4:	.string CAD4

	.text

	#-- TEST 1
	la a0, cad1
	li a1, VAL1
	jal test
	
	#-- TEST 2
	la a0, cad2
	li a1, VAL2
	jal test
	
	#-- TEST 3
	la a0, cad3
	li a1, VAL3
	jal test
	
	#-- TEST 4
	la a0, cad4
	li a1, VAL4
	jal test
	
	#-- Termina
	li a7, EXIT
	ecall 
	
#-----------------------------------------------------
#-- SUBRUTINA Test
#-- ENTRADAS:
#--    a0: Puntero a la cadena a usar para la prueba
#--    a1: Valor esperado
#-----------------------------------------------------
test:

	#-- Guardar la direcion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- t0 = a0
	mv t0, a0

	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Comprobar la cadena
	mv a0, t0
	jal len
	
	#-- t0: Valor calculado
	mv t0, a0
	
	#-- print
	
	#-- Imprimir resultado cadena 1 (Calculado)
	
	li a7, PRINT_INT
	ecall
	
	#-- a1: Valor esperado
	#-- Imprmir valor esperado
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	mv a0, a1
	li a7, PRINT_INT
	ecall
	
	#-- Comprobar el calculado con el esperado
	beq t0, a1, test_ok
	
	#-- Test no ok
	la a0, error
	li a7, PRINT_STRING
	ecall
	b next

test_ok:	
	#-- Test OK
	la a0, ok
	li a7, PRINT_STRING
	ecall
	
	
next:	

	#-- Recueprar direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	
	ret
	
	


