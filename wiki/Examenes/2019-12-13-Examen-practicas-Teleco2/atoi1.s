#------------------------------------------------------------------------------------
#-- Subrutina atoi1(char): Convertir el caracter a su numero correspondiente
#--
#-- Si el caracter es un digito válido ('0' - '9') se devuelve su valor
#-- Si el caracter no es valido se devuelve -1
#--
#--  ENTRADAS:
#--   a0: Caracter
#--
#-- SALIDA:
#---  a0: Digito convertido a numero ó -1 si no es un digito correcto
#------------------------------------------------------------------------------------

	#-- Punto de entrada
	.globl atoi1
	
	#-- Código de error
	.eqv ERROR -1
	
	.text
	
atoi1:
	#--- Es una función Hoja: No necesitamos almacenar la 
	#-- direccion de retorno al nivel superior
	
	#-- Tampoco necesitamos preservar el valor de ningún registro
	#-- Por tanto no creamos pila

        #--- Por a0 os llega el parametro de entrada
        #--- El carácter a convertir
        #-- Comprobamos primero si es un dígito correcto
        #-- Si a0 < '0' ó a0 > '9', es un digito incorrecto, y hay 
        #-- que devolver -1
        
	#-- Si a0 < '0' se retorna error
	li t1, '0'
	blt a0, t1, error	
	
	#-- Si a0 > '9' se retorna error
	li t1, '9'
	bgt a0, t1, error
	
	#-- Es un digito valido. Convertirlo a numero
	#-- Para ello hay que restar '0'
	li t1, '0'
	sub a0, a0, t1
	
	#-- En a0 está el numero convertido (0 - 9)
	b ok

error:
	li a0, ERROR

ok:
	ret



