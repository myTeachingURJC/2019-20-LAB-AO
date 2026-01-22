
	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_CHAR 11

	.text
	
#-----------------------------
#-- Programa principal
#-----------------------------	
	
  	# 1. Inicializar contador a 0. cont = 0
  	li s0, 0
  
  bucle:
  	# 2. Cuando cont es 16, terminar
  	li t0, 16
  	beq s0, t0, fin
  	
  	# 3. Llamar a la funcion print_bin(cont), para imprimir en binario el valor actual del contador
  	mv a0, s0
  	jal print_bin
  	
  	# 4. Imprimir un salto de linea
  	li a0, '\n'
  	li a7, PRINT_CHAR
  	ecall
  	
  	# 5. Incrementar contador
  	addi s0, s0, 1
  	
  	# 6. Repetir desde el punto 2	
  	j bucle
	
fin:
	li a7, EXIT
	ecall
