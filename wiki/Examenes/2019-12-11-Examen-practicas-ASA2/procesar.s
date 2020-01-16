#-------------------------------------------------------------------------
#-- SUBRUTINA: Procesar(cad)
#--
#-- Imprimir a longitud de la cadena y la cadena al revés
#-- Para obtener la longitud se invoca a la funcion len()
#-- Para imprimir del revés se llama a la función reverse()
#--
#--  ENTRADAS:
#--    a0: Puntero a la cadena a procesar
#--
#--  SALIDAS:
#--    Ninguna
#------------------------------------------------------------------------

	.globl procesar

	.eqv PRINT_STRING  4
	.eqv PRINT_INT     1

	.data
msg1:   .string "\nLongitud cadena: "
msg2:   .string "\nCadena invertida: "
	.text
	
procesar:

	#-- Es una funcion intermedia
	#-- Hay que crear la pila para guardar la direccion de retorno
	addi sp, sp, -16

	#-- Guardar la direccion de retorno
	sw ra, 12(sp)
	
	#-- Almacenar la direccion de la cadena para no perderla
	sw a0, 8(sp)
    	
    	#---- Imprimir mensaje 1
    	la a0, msg1
    	li a7, PRINT_STRING
    	ecall
    	
    	#------ Calcular la longitud de la cadena, llamandando a la funcion len()
    	lw a0, 8(sp)
    	jal len
    	
    	#-- Imprimir la longitud
    	li a7, PRINT_INT
    	ecall
    	
    	#--- Imprimir mensaje 2
    	la a0, msg2
    	li a7, PRINT_STRING
    	ecall
    	
    	#-- Recuperar el puntero de la cadena
    	lw a0, 8(sp)
    	
    	#-- Imprimir la cadena invertida
    	jal reverse

	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16

	ret
	
	
