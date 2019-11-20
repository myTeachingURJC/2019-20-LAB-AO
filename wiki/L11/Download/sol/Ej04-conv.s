#---------------------------------------------------------
#-- Subrutina conv(pcad)
#-- ENTRADA:
#--    a0: Puntero a la cadena con los digitos
#-- SALIDA:
#--    a0: Numero entero convertido
#--    a1: Peso del digito de mayor peso: 1,10,100...
#---------------------------------------------------------

	.globl conv

	.text 
	
conv:
	#-- Leer el caracter actual
	lb t0, 0(a0)
	
	#-- Si es \n se retorna (0,0). El peso es 0
	li t1, '\n'
	bne t0, t1, conv_rec
	
	#-- Fin de la cadena
	#-- Devolver (0,0)
	li a0, 0
	li a1, 0
	b fin
	
	#-- Caso general
conv_rec:

	#-- Resevar espacio en la pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Guardar en la pila el primer digito
	sw t0, 0(sp)
	
	#-- Apuntar al siguiente byte
	addi a0, a0, 1
	
	#-- Calcular el numero de la subcadena
	jal conv
	
	#-- Convertir el primer digito a numero
	lw t0, 0(sp)
	li t1,'0'
	sub t0, t0, t1
	
	#-- Analizar los casos del numero calculado
	#-- Si el peso es 0, retornar el (dig, 1)
	beq a1, zero, peso_es_0

	#-- El peso es diferente de 0
	#-- Calcular la expresion dig*p*10 + n
	
	#-- Multiplicar el peso por 10
	li t1, 10
	mul a1,a1,t1
	
	#-- Multiplicar el digito por p*10
	mul t2, a1, t0
	
	#-- Sumar el numero de la subcadena
	add a0, t2, a0 
	
	#-- Terminar
	b terminar
					
															

peso_es_0:
	mv a0, t0
	li a1, 1		

terminar:		
	#-- REcueprer direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar espacio de la pila
	addi sp, sp, 16
	
fin:
	ret