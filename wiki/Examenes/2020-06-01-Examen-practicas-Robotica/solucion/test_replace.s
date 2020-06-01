#-------------------------------------------------------------------
#-- test_replace.s:  Programa para probar la funcion replace  
#-------------------------------------------------------------------

	
	# -- Servicios del sistema operativo
	.eqv PRINTSTRING 4
	.eqv EXIT 10
			
	
	.data
	
	#-- Cadenas de pruebas
 test1: .string "=== Prueba 1 ===\n"
 test2: .string "Abracadabra\n"
 

	.text
	
	#-- Imprimir la primera cadena de prueba
	la a0, test1
	li a7, PRINTSTRING
	ecall
	
	#-- Reemplazar los caracteres '=' por '*'
	li a1, '='
	li a2, '*'
	jal replace
	
	#-- Imprimir la cadena reemplazada
	la a0, test1
	li a7, PRINTSTRING
	ecall
	
	#--------- Prueba con la segunda cadena
	#-- Imprimir la cadena reemplazada
	la a0, test2
	li a7, PRINTSTRING
	ecall
	
	#-- Reemplazar las aes por '-'
	li a1, 'a'
	li a2, '-'
	jal replace
	
	#-- Imprimir la cadena reemplazada
	la a0, test2
	li a7, PRINTSTRING
	ecall
	
	#-- Exit
	li a7, 10
	ecall



