#-------------------------------------------------------
#--  SUBRUTINA: Reverse(cad)
#--  
#--  ENTRADA:
#--   a0: Puntero a la cadena a imprimir al reves
#--
#--  SALIDAS:
#--   Ninguna
#-------------------------------------------------------

	.eqv PRINT_CHAR 11

	.globl reverse

	.text
	
reverse:  

	#-- Ultimo nivel: Si la cadena es "'\n'" o "" 
	lb t0, 0(a0)      ### DEBUG: REVERSE
	beq t0, zero, terminar
	
	li t1, '\n'
	beq t0, t1, terminar
	
	#------- Algoritmo recursivo
	
	#-- Es necesario crear la pila
	addi sp, sp, -16
	
	#-- Guardar la direccion de retonro
	sw ra, 12(sp)


	#-- Guardar el puntero a la cadena actual, para no
	#-- perderlo al llamar a reverse
	sw a0, 8(sp)

	#-- Obtener la subcadena
	addi a0, a0, 1
	
	#-- Imprimir la subcadena al reves
	jal reverse
	

	#-- Recuperar puntero de la pila
	lw a0, 8(sp)
		
	#-- Imprimir el primer caracter
	lb a0, 0(a0)
	li a7, PRINT_CHAR
	ecall

	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16

	b fin

	#-- Ultimo nivel
terminar:
        #-- Aqui llega en el ultimo nivel
        #-- ESta es una instruccion nula, que se usa para poner un breakpoint
        #-- y saber el valor del sp en este último nivel
        addi zero, zero, 0  #--- ULTIMO NIVEL
        #-- El valor del sp es: 0x7fffefac
fin:
	#-- Imprimir la cadena 

	ret
	
	
