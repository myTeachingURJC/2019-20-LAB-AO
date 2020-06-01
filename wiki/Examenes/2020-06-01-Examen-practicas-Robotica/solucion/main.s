
	# -- Servicios del sistema operativo
	.eqv PRINTSTRING 4
	.eqv EXIT 10
			
	
	.data
	
	#-- Cadenas de prueba
	
 cad1:   .string "===> a e i o u <===\n"	
 cad2:   .string "Cuando Fernando Septimo usaba paleto\n"
 

	.text
	
	#------------- TEST 1	
	# -- Imprimir la cadena original
	la a0, cad1
	li a7, PRINTSTRING
	ecall
	
	# -- Lllamar a replace_vowels
	la a0, cad1
	li a1, '*'
	jal replace_vowels
	
	# -- Imprimir la cadena reemplazada
	la a0, cad1
	li a7, PRINTSTRING
	ecall
	
	#--------------- TEST 2
	# -- Imprimir la cadena original
	la a0, cad2
	li a7, PRINTSTRING
	ecall
	
	# -- Lllamar a replace_vowels
	la a0, cad2
	li a1, 'a'
	jal replace_vowels
	
	# -- Imprimir la cadena reemplazada
	la a0, cad2
	li a7, PRINTSTRING
	ecall
	
	
	#-- Exit
	li a7, 10
	ecall
	
	
