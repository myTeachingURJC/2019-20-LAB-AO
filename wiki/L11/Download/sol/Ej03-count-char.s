#------------------------------------------
#-- Funcion count_char(pcad, char)
#-- 
#-- Contar la cantidad de caracteres que hay en la cadena
#-- USANDO UN ALGORITMO RECURSIVO
#--
#-- ENTRADAS:
#--   a0: Puntero a la cadena
#--   a1: Caracter a encontrar
#-- SALIDA:
#--   a0: La cantidad de caracteres que hay
#--------------------------------------------

	#-- Punto de entrada
	.globl count_char

	.text
	
count_char:

	
	#-- Leer el primer caracter
	lb t0, 0(a0)
	
	#--bSi es \n se devuelve 0
	li t1, '\n'
	bne t0,t1, count_char_rec
	
	#-- Es el ultimo caracter
	#-- Devolver 0
	li a0, 0
	b fin

count_char_rec:

	#-- Reservar espacio para la pila
	addi sp, sp, -16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)

	#-- Guardar el primer caracter en la pila
	sw t0, 0(sp)
	
	#-- Guardar el caracter a contar en la pila
	sw a1, 4(sp)
	
	#-- Contar la cantidad de caracteres en la subcadena
	addi a0, a0, 1
	jal count_char
	
	#-- a0 contiene el numero de caracteres en la subcadena
	#-- Si el primer caracter es igual al caracter a contar, 
	#-- lo incrementamos en una unidad
	lw t0, 0(sp)
	lw a1, 4(sp)
	
	beq t0,a1, encontrado 
	
	#-- El primer caracter no es el buscado
	#-- En a0 esta el numero de caracteres encontrdos en la subcadena
	
	b terminar

encontrado:
	#-- Incrementar a0 en una unidad: un caracter mas encontrado
	addi a0, a0, 1


terminar:
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	addi sp, sp, 16
	#-- PUnto de salida
fin: 
	ret
	
	