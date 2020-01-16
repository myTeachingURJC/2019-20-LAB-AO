#-----------------------------------
#--- Pruebas de la funcion evaluar 
#-----------------------------------

	.include "servicios.asm"

	.eqv CASO1_RES  2
	.eqv CASO2_RES  45
	.eqv CASO3_RES  3
	.eqv CASO4_RES -1
	.eqv CASO5_RES -1
	.eqv CASO6_RES -1

	.data
	
caso0:  .string "\n"	
caso1:	.string "1+1\n"
caso2:  .string "1+2+3+4+5+6+7+8+9+0+0+0+0+0+0+0\n"
caso3:  .string "3\n"
caso4:  .string "hola\n"
caso5:  .string "1+\n"
caso6:  .string "1 2+4\n"
	
	.text
	
	#-- Comprobar los casos. Expresiones ok:
	la a0, caso1
	li a1, CASO1_RES
	jal test
	
	la a0, caso2
	li a1, CASO2_RES
	jal test
	
	la a0, caso3
	li a1, CASO3_RES
	jal test
	
	#-- Expresiones NO ok
	la a0, caso4
	li a1, CASO4_RES
	jal test
	
	la a0, caso5
	li a1, CASO5_RES
	jal test
	
	la a0, caso6
	li a1, CASO6_RES
	jal test
	
	li a7, EXIT
	ecall
	
#------------------------------------------------------------
#-- Subrutina de test de la funcion evaluar
#-- ENTRADAS: 
#--    a0: Puntero a la cadena a evaluar
#--    a1: Resultado esperado
#-- SALIDAS:
#--    a0:  0: Error
#--         1: OK
#------------------------------------------------------------	

	   .data
	
msg1:	   .string "--> Resultado: "	
msg_OK:    .string " --> OK\n\n"
msg_Error: .string " --> ERROR\n\n" 
what:      .string "WHAT!\n"	
	.text

test:	

	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Guardar a0 y a1 en la pila
	sw a0, 8(sp)
	sw a1, 4(sp)
	
	#-- Imprimir la expresion pasada
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Llamar a evaluar
	lw a0, 8(sp)
	jal evaluar
	
	#mv t1,a0
	#la a0, what
	#li a7, PRINT_STRING
	#ecall
	#mv a0, t1
	
	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	
	
	#-- Comprobar si ok o error
	#-- Cargar en t0 el resultado esperado
	lw t0, 4(sp)
	beq a0, t0, ok
	
	#-- Error. Imprimir mensaje y retornar 0
	la a0, msg_Error
	li a7, PRINT_STRING
	ecall
	
	li a0, 0
	b fin
	
ok:     #-- Test OK
        la a0, msg_OK
        li a7, PRINT_STRING
        ecall 
        
        li a0, 1
	
fin:	
	
	
	lw ra, 12(sp)
	addi sp, sp, 16
	ret