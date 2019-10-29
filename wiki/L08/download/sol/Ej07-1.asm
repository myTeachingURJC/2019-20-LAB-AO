#-- Solución al ejercicio 7 
#-- Copiar una cadena de una posicion de memoria a otra

	.include "servicios.asm"
	
	.eqv MAX 32
	
	.data
cad_orig:    .space MAX
cad_destino: .space MAX
msg1:	     .string "\nIntroduce cadena: "
msg2:        .string "Cadena copia: "


	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, cad_orig
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#------ Copiar la cadena 

	#-- Puntero a la cadena destino
	la t0, cad_destino

	
bucle:			
	#-- Leer caracter original
	lb t1, 0(a0)
	
	#-- Almacenarlo en cadena destino
	sb t1, 0(t0)
	
	#-- ¿Es 0?
	beq t1,zero, fin
	
	#-- Incrementar los punteros
	addi a0, a0, 1
	addi t0, t0, 1
	
	#-- Repetir
	b bucle


	#------ Imprimir la cadena destino	
fin:
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena copiada
	la a0, cad_destino
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
