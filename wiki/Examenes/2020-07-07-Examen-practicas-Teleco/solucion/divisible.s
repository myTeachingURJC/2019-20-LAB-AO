	.globl divisible 
	
	.text

#---------------------------------
#-- Funcion para determinar si un numero es divisible entre otro o no  
#-- Entradas:
#--   a0: Primer numero (a)  
#--   a1: Segundo numero (n) (n<=a)
#-- Salidas:
#--   a0: Devuelve 1 si a/n es una división exacta (resto 0)
#--       Devuelve 0 si a NO es divisible entre n
#------------------------------------------------------------------------

divisible:

	#-- Se traa de una funcion intermedia, 
	#-- que llama a division por lo que es necesario 
	#-- crear la pila para guarlar la direccion de retorno
	addi sp,sp,-16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Para saber si a es divisible entre n llamamos a division
	#-- NO hace falta guardar nada en la pila porque en este caso
	#-- los parámetros de divisible y division coinciden. Asi que
	#-- llamamos a division directamente
	
	jal division
	
	#-- En a1 tenemos el resto
	#-- Si el resto es 0, es divisible, por lo que hay que
	#-- devolver 1. 
	#-- Si el resto es distinto de 0 NO es divisible, y devolvemos 0
	beq a1, zero, es_divisible
	
	#-- El resto es distinto de zero
	li a0, 0  #-- No es divisible
	b fin
	

es_divisible:
	#-- El resto es cero
	li a0, 1  #-- Es divisible
			
fin:
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	addi sp,sp, 16

	ret
	
