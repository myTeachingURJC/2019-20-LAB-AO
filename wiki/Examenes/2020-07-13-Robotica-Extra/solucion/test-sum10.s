# Realizar la suma de los numeros de cada uno de 
# los dos conjuntos situados en la memoria
	
	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_INT 1
	.eqv PRINT_STRING 4
	
	#-- Constante: Numero de conjuntos a los que calcular su suma
	.eqv MAX 2

	.data
	
	#-- Puntero al numero del primer numero del primer conjunto
conjuntos:	
	#-- Primer conjunto de numeros
        .word 100, 50, 288, 99, 3000, 1528, 927, 318, 99, 2020
        
        #-- Segundo conjunto de numeros
        .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

msg1:   .string "\nSuma del conjunto de numeros:  "
	
	
	.text
	
	
	#---- s0: Puntero al primer numero del primer conjunto
	la s0, conjuntos
	
	#---- Contador de iteraciones
	#---- Va desde 1 hasta MAX
	li s1, 0
	
	
next:	
	#-- Imprimir mensaje 
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Llamar a sum10(): realizar la suma del conjunto actual
	mv a0, s0
	jal sum10
	
	#-- En a0 tenemos la suma de los numeros
	
	#-- Imprimir resultado en la consola
	li a7, PRINT_INT
	ecall 
	
	#-- El siguiente conjunto de numeros esta situado 10 palabras (40 bytes)
	#-- mas arriba en la memoria. Justo a continuación del anterior conjunto
	addi s0, s0, 40
	
	#-- Incrementar contador de iteraciones
	addi s1, s1, 1
	
	#-- Comprobar si hemos terminado
	li t0, MAX
	blt s1,t0, next
	
	#-- TErminar
	li a7, EXIT
	ecall
	