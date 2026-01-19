
	.text
	
	.global hex_digit
#---------------------------------------
#-- hex_digit(n)
#--
#-- Convertir un numero (0-15) a su digito
#-- hexadecimal correspondiente '0'-'F'
#--
#-- Ejemplos: 
#--    hex_digit(5) = '5'
#--    hex_digit(10) = 'A'
#--
#-- ENTRADA:
#--   - a0 (n): Numero a convertir (0<= n <=15)
#--
#-- SALIDA:
#--   - a0: Caracter ASCII del digito correspondiente
#------------------------------------------
hex_digit:

	#-- 1. Si n > 9, saltar al paso 4
	#-- a0: Variable n
	li t0, 9
	bgt a0, t0, paso_4
	
	#-- 2. Calcular: dig = n + '0'
	#-- t1 = Variable dig
	addi t1, a0, '0'
	
	#-- 3. Saltar al paso 5
	j paso_5
	
paso_4:
	#-- 4. Calcular: dig = n - 10 + 'A'
	#-- t1: Variable dig
	#-- a0: Variable n
	addi t1, a0, -10  #-- dig = n - 10
	addi t1, t1, 'A'  #-- dig = n - 10 + 'A'

paso_5:
    #-- 5. Devolver dig
    mv a0, t1
	ret
	
