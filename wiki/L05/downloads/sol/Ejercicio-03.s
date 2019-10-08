#-- Suma de dos numeros introducidor por el teclado
#-- Los valores leidos se deben almacenar en las
#-- variables a y b. El resultado en f
#-- El resultado se saca por la consola

	#-- Códigos de servicio
	.eqv EXIT      10
	.eqv READ_INT  5
	.eqv PRINT_INT 1
	
	#-- Cosntantes de acceso a  las variables
	.eqv VA 0
	.eqv VB 4
	.eqv VF 8
	
	.data
	
	#-- Variables. Inicializadas a 0
variables: 
        .word 0   #-- Variable a
	.word 0   #-- Variable b
	.word 0   #-- Variable f = a + b
	
	.text
	
	#-- s0: Puntero a las variables
	la s0, variables
	
	#-- Pedir el primer numero al usuario
	li a7, READ_INT
	ecall
	
	#-- El valor introducido se devuelve en a0
	
	#-- Almacenarlo en a
	sw a0, VA(s0)
	
	#-- Pedir el segundo numero
	li a7, READ_INT
	ecall
	
	#-- Almacenarlo en b
	sw a0, VB(s0)
	
	#-- Realizar la suma. Nos indican explicitamente que leamos
	#-- las variables
	
	#-- t0 = a
	lw t0, VA(s0)
	
	#-- t1 = b
	lw t1, VB(s0)
	
	#-- Realizar la suma
	#-- a0 = t0 + t1
	add a0, t0, t1
	
	#-- Almacenar la suma en F
	sw a0, VF(s0)
	
	#-- Imprimir el numero en la consola
	li a7, PRINT_INT
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	