#------------------------------------------------------------------------------
#--- Prueba de la funcion atoi1
#------------------------------------------------------------------------------

	#-- Codigos de los servicios del Sistema operativo
	.include "servicios.asm"
		
	.text
	
	
	#-- Prueba de 0
	li a0, '0'
	li a1, 0
	jal test
	
	#-- prueba de 5
	li a0, '5'
	li a1, 5
	jal test
	
	#-- Prueba de 9
	li a0, '9'
	li a1, 9
	jal test
	
	#-- Prueba de caracteres invalidos
	li a0, 'A'
	li a1, -1
	jal test
	
	li a0, '/'
	li a1, -1
	jal test
	
	li a0, ':'
	li a1, -1
	jal test
	
	
	#-- Terminar				
	li a7, EXIT
	ecall
	
#----------------------------------------
#-- Subrutina de prueba
#--
#--  ENTRADAS:
#--    a0: Caracter
#--    a1: Resultado esperado
#--
#--  SALIDAS:
#--    	0: Test ha fallado
#--     1: Test ok
#-----------------------------------------

	.data 
msg1:	.string "* atoi1("
msg2:   .string ") = "
msg_OK:    .string " --> OK\n"
msg_Error: .string " --> ERROR\n" 
	
	.text
test:	

	addi sp, sp, -16
	sw ra, 12(sp)
	sw a0, 8(sp) #-- Guardar parametro 1: Caracter
	sw a1, 4(sp) #-- Guardar parametro 2: resultado

	#--- Mensaje 1
	la a0, msg1 
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir caracter pasado como parametro
	lw a0, 8(sp)
	li a7, PRINT_CHAR
	ecall
	
	#-- Mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Llamar a atomi1
	lw a0, 8(sp)
	jal atoi1
	
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