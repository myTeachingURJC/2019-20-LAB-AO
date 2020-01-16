#------- Pruebas de la funcion procesar

	.include "servicios.asm"
	
	.eqv CASO1_RES  3
	.eqv CASO2_RES  0
	.eqv CASO3_RES -1
	.eqv CASO4_RES -1
	.eqv CASO5_RES -2

	.data
	
caso1:	.string "1+2\n"
caso2:  .string "0+0+0\n"
caso3:  .string "+5\n"
caso4:  .string " a\n"
caso5:  .string "\n"
	
	.text
	
	#-- Caso 1
	li a0, CASO1_RES
	jal test
	
	#-- Caso 2
	li a0, CASO2_RES
	jal test
	
	#-- Caso 3
	li a0, CASO3_RES
	jal test
	
	#-- Caso 4
	li a0, CASO4_RES
	jal test
	
	#-- Caso 5
	li a0, CASO5_RES
	jal test
	
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
#------------------------------------------
#- Entradas:
#-  a0: Resultado esperado
#-
#- Salidas: Ninguna
#-------------------------------------------	

	   .data
msg_OK:    .string " --> OK\n\n"
msg_Error: .string " --> ERROR\n\n" 

	.text
test:

	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Almacenar valor esperado
	sw a0, 8(sp)
	
	#-- Llamar a procesar
	jal procesar
	
	#-- Comparar valor devuelto con el esperado
	#-- Comprobar si ok o error
	#-- Cargar en t0 el resultado esperado
	lw t0, 8(sp)
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
	
	