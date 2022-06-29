#---------------------------
#-- Sucesion de Fibonacci
#-- Calcular el término n
#---------------------------
#-- fib(0) = 0
#-- fib(1) = 1
#-- fib(2) = 1
#-- fib(3) = 2
#-- fib(4) = 3
#-- fib(5) = 5
#-- fib(6) = 8
#-- fib(n) = fib(n-1) + fib(n-2)

	#-- Servicios del sistema operativo
  	.eqv PRINT_INT    1
	.eqv PRINT_STRING 4
	.eqv EXIT         10
	
	#-- Termino de fibonacci a Calcular: fib(N)
	#-- (Debe ser > 1)
	.eqv N 6

	.data
msg1: .string "\nFibonacci de "
msg2: .string " ---> "

	.text
	
	#-- Meter en t6 el termino a calcular
	li t6, N  
	
	#-- El registro t5 se usa para indicar el numero del termino 
	#-- de fibonacci actual (n)
	li t5, 1  #-- Termino final a calcular
	
	
	#-- Los registros t0 y t1 contienen fib(n) y fib(n+1)
	li t0, 0
	li t1, 1

bucle:		
	#-- Comprobar si hemos calculado el termino pedido
	beq t5,t6, fin
	
	#-- Calcular el siguiente termino: t2 = t1 + t0
	add t2, t1, t0
	
	#-- Actualizar los valores recordados
	mv t0, t1   #-- t0 = t1 (termino anterior)
	mv t1, t2   #-- t1 = t2 (nuevo termino)
	
	#-- Incrementar el termino actual
	addi t5, t5, 1
	
	#-- Repetir bucle
	b bucle
	
	
	#-- Mostrar el termino calculado
	#-- El termino esta almacenado en t2
fin:
	#-- Imprimir mensaje en consola
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir n
	mv a0, t6
	li a7, PRINT_INT
	ecall
	
	#-- Mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	#-- Imprimir el numero de fibonacci
	mv a0, t2
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
