#-- Ejemplo de conversión de un digito decimal ASCII
#-- a su número

	.include "servicios.asm"
	
	.text
	
	#-- En t1 ponemos el carácter '2'
	#-- Es el que queremos convertir a numero
	li t1, '2'
	
	#-- En t0 metemos el caracter '0' que usaremos
	#-- para hacer la conversion
	li t0, '0'
	
	#-- Realizar la conversion
	#-- t2 = t1 - t0  ('2' - '0') 
	sub t2, t1, t0
	
	#-- Terminar
	li a7, EXIT
	ecall
	