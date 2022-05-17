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
	.eqv N 7

	.data
msg1: .string "\nFibonacci de "
msg2: .string " ---> "

	.text
	
	#-- Calcular el termino N de fibonacci
	li a0, N
	jal fib
	
	#-- a0 contiene fib(N)
	#-- Guadar a0 en t0
	mv t0, a0
	
	
	#-- Mostrar el termino calculado
fin:
	#-- Imprimir mensaje en consola
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir n
	li a0, N
	li a7, PRINT_INT
	ecall
	
	#-- Mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall 
	
	#-- Imprimir el numero de fibonacci
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
