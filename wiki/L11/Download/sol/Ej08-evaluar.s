#----------------------------------
#-- Subrutina evaluar(pcad)
#--
#-- Evaluar una expresion compuesta por sumas de números de 1 dígito  
#-- Se hace de forma recursiva
#-- 
#-- ENTRADAS:
#--    a0: Puntero a la cadena
#--
#-- SALIDAS:
#--    a0: Valor calculado
#--    a1: 
#--        1: Hay un error en la expresión
#--        0: Expresion evaluada ok
#------------------------------------------

	.globl evaluar

	.text
	
evaluar:

	#-- Crear pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)

	#-- Leer primer caracter
	lb t0, 0(a0)
	
	#-- Leer operacion
	lb t1, 1(a0)
	
	#-- Guardar operacion en la pila
	sw t1,4(sp)
	
	#-- Actualizar puntero para apuntar al siguiente digito
	addi a0, a0, 2
	
	#-- Guardar puntero en la pila
	sw a0, 0(sp)
	
	#-- a0 = primer digito
	mv a0, t0
	
	#-- Comprobar si es un digito
	jal is_digit
	
	#-- Guardar digito convertido
	sw a0, 8(sp)
	
	#-- Si a1 es distinto de cero, hay un error
	bne a1,zero, error
	
	#--Recuperar operacion
	lw t0, 4(sp)
	
	#-- Si la operacion es '\n', hay que devolver el valor del digito
	li t1, '\n'
	beq t0, t1, last_digit
	
	#-- Comprobar si la operaccion es valida
	li t1, '+'
	bne t0, t1, error
	
	#-- Evaluar la expresion
	lw a0, 0(sp)
	jal evaluar
	
	#-- Recuperar digito convertido
	lw t0, 8(sp)
	
	#-- Sumar la expresion más el digito
	add a0, a0,t0
	
	#-- conversion ok
	li a1,0
	
	b terminar

last_digit:
	#-- Recuperar digito convertido
	lw a0, 8(sp)	
	li a1, 0
	b terminar
		
				
	#-- Devolver a1 = 1 para indicar error
error:	li a0, 0
	li a1, 1	

			
terminar:									
	#-- Recueprar direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16
	
	ret