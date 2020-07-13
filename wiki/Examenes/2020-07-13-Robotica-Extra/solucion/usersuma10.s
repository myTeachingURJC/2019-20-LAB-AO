
	.globl usersuma10
	
	.eqv PRINT_STRING 4
	.eqv READ_INT 5
	
	
	.data
msg1:	.string "Introduce numero: "	
	
	.text
#-------------------------------------------
#- Funcion usersum10: Pedir al usuario que introduzca 10 
#- numeros enteros consecutivos, almacenarlos en la memoria y 
#- realizar su suma
#- ENTRADAS:
#-   a0: Puntero para situar los numeros introducidos por el usuario
#- SALIDAS:
#-   a0: Suma de los numeros
#---------------------------------------------------------------	
usersuma10:
	
	#-- Se trata de una funcion intermedia por lo que 
	#-- hay que guardar la direccion de retorno en la pila
	addi sp, sp, -16
	sw ra, 12(sp)
	
		
	#-- t0: Puntero del conjunto de numeros
	mv t0, a0 
	
	#-- Guardar el valor inicial del puntero en la pila, para usarlo
	#-- despues al hacer la suma
	sw a0, 8(sp)
	
	#-- t1: Contador de numeros introducidos
	li t1, 0
	
bucle:	
	#-- Imprimir mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall				
	
	#-- Pedir numero al usuario
	li a7, READ_INT
	ecall
	
	
	#-- Guardar numero en la memoria
	sw a0, 0(t0)
	
	# -- Incrementar puntero para apuntar al siguiente numero
	addi t0, t0, 4
	
	#-- Incrementar contador de numeros
	addi t1, t1 , 1
	
	#-- Mientras sea menor a 10, repetimos
	li t2, 10
	blt t1, t2, bucle
	
	#-- Ya estan todos los numeros en la memoria
	#-- Recuperar el puntero inicial del conjunto
	lw a0, 8(sp)
	
	#-- Llamar a sum10() para sumarlos
	jal sum10
	
	#-- En a0 tenemos el resultado de la 
	#-- suma, que se devuelve
		
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Recuperar valor del puntero de pila
	addi sp, sp, 16	
	
	#-- Retornar
		
	ret	
	
	
	
	
