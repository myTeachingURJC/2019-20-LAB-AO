#-- Ejemplo de lectura de una variable

	.data
v1:	.word 0xCAFEBACA

	.text
	
	#-- Guardar en x6 la dirección de la variable
	la x6, v1
	
bucle:	
	
	#-- Leer la variable de memoria y guardarla en x5
	lw x5, 0(x6)
	
	#-- Incrementar en 1 el registro x5
	addi x5, x5, 1
	
	#-- Escribir la variable con el valor incrementdo
	sw x5, 0(x6)
	
	b bucle
	
	#-- Terminar
	li a7, 10
	ecall