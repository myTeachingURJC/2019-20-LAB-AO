#------------------
#-- Subrutina fibo(n)

	#-- Punto de entrada
	.globl fibo


	.text
fibo:	

	#--- Si n <=2 se devuelve 1
	li t0,2
	bgt a0,t0, fibo_rec
	
	#-- Devolver 1
	li a0, 1
	b fin
	
fibo_rec:
	#-- Reservar espacio pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Guardar n en la pila
	sw a0, 0(sp)
	
	addi a0, a0, -1
	
	#-- Llamar a fibo(n-1)
	jal fibo
	
	#-- a0 contiene fibo(n-1)
	#-- guardarlo en la pila
	sw a0, 4(sp)
	
	#-- Recuerar n
	lw a0, 0(sp)
	
	addi a0, a0, -2
	
	#-- Llamar a fibo(n-2)
	jal fibo
	
	#-- a0 contiene fibo(n-2)
	
	#-- Recuperar fibo(n-1)
	lw t0, 4(sp)
	
	#-- a0 = fibo(n-1) + fibo(n-2)
	add a0, t0, a0
	
	#-- Recuperer direcciond de retorno
	lw ra, 12(sp)
	
	addi sp, sp, 16
	#-- Punto de salida	  
fin:
	ret