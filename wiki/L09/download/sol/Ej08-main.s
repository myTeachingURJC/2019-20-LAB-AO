#-- Solución al ejercicio 8
#-- Cifrar una cadena

	.include "servicios.asm"

	#-- Tamaño máximo de la cadena
	.eqv MAX 1024
	
	#-- Constante a sumar, para cifrar
	.eqv K   5
		
		
	.data 
cad:	.space MAX	
msg1:	.string "Introduce cadena: "
msg2:	.string "Cadena cifrada: "
	
	
	.text 
	
	#-- Imprimir mensaje msg1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Almacenar el puntero a la cadena en s0
	#-- Solo lo podemos almacenar en registros estáticos
	#-- que son los únicos que está garantizado que mantiene
	#-- su valor al realizar una llamda a subrutina
	mv s0, a0
	
	#-- Llamar a la funcion cifrar(a0, K)
	li a1, K
	jal cifrar

	
fin:    #-- Hemos terminado
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena
	mv a0, s0
	li a7, PRINT_STRING
	ecall			
			
	#-- Terminar
	li a7, EXIT
	ecall
	
