#----------------------------------------------------------
#---- Subrutina: is_digit(char)
#---- Determina si el caracter es un dígito '0'-'9'
#----
#---- ENTRADA:
#--     * a0: Carácter a evaluar
#--   SALIDA:
#--     * a0:  El digito convertido (si era un digito ok)
#--     * a1:  0--> Es un digito ok
#--            1 --> No es un digito
#---------------------------------------------------------

	#-- Punto de entrada
	.globl is_digit
	
	.text
	
is_digit:	

	#--- Comprobar si es un digito correcto
	li t0, '9'
	bgt a0, t0, error #-- a0 > '9' ---> Error
	li t0, '0'
	blt a0, t0, error  #-- a0 < '0' --> Error
	
	#-- Es un dígito correcto
	#-- Pasarlo a entero
	#-- a0 = a0 - '0'
	sub a0, a0, t0
	
	#-- Conversion ok
	li a1, 0
	
	#-- Terminar
	b fin

error:
	li a0, 0
	li a1, 1

fin:		
	ret