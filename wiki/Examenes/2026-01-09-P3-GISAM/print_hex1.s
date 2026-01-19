	
	.global print_hex1
	
	#-- Servicios del sistema operativo
	.eqv PRINT_STRING 4
	.eqv PRINT_CHAR 11
	
	.data
prefijo_0x: .string "0x"
	
	.text
#-----------------------------------------------------------------
#-- print_hex1(n)
#--
#--  Imprimir un numero hexadecimal con el prefijo '0x'
#--
#-- ENTRADA:
#--   - a0 (n): Numero hexadecimal (0-15) a imprimir
#--
#-- SALIDA:
#--   - Ninguna. La funcion no devuelve ningun valor
#----------------------------------------------------------------
print_hex1:

	#-- Crear la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Guardar a0 (n) en la pila para no perderlo
	sw a0, 0(sp)

	#-- Imprimir prefijo
	la a0, prefijo_0x
	li a7, PRINT_STRING
	ecall
	
	#-- Recuperar a0 de la pila
	lw a0, 0(sp)

	#-- Convertir n a caracter
	jal hex_digit
	#-- a0: Caracter con el digito
	
	#-- Imprimir el digito hexadecimal
	li a7, PRINT_CHAR
	ecall
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)

	#-- Liberar la pila
	addi sp, sp, 16
	ret
	
	
	