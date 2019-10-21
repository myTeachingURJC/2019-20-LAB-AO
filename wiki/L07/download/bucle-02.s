#-- Ejemplo de uso de bucles
#-- Recorrer una cadena para calcular su longitud

	.include "servicios.asm"
	
	.data
cad:	.string "Cadena de prueba"
msg:    .string "Longitud de la cadena: "
	
	.text
	
	#-- t0 es el puntero a la cadena
	la t0, cad
	
	#-- t1 es el contador de caracteres de la cadena
	li t1, 0

bucle:	
	#--- Leer el primer caracter de la cadena
	lb t2, 0(t0)
	
	#-- Si el caracter es zero, hemos terminado de 
	#-- recorrer la cadena
	beq t2, zero, fin_bucle
	
	#-- El caracter NO es cero. Incrementar el contador
	addi t1, t1, 1
	
	#-- Apuntar al siguiente caracter
	addi t0, t0, 1
	
	#-- Repetir
	b bucle
	
	
	#-- Se ha alcanzado el final de la cadena
fin_bucle:
	
	#-- Print "Longitud cadena: "
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero de carateres, que está
	#-- en el contador t1
	mv a0, t1
	li a7, PRINT_INT
	ecall 

	#-- Terminar
	li a7, EXIT
	ecall