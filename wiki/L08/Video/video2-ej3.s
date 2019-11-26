#-- Conversion de una cadena de 2 dígitos a número

	.include "servicios.asm"

	.data

msg1:   .string "\nCadena: "
msg2:   .string "\nNumero: "

	#-- Cadena a convertir a numero
cadnum:	.string "23"
			
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir cadena a convertir
	la a0, cadnum
	li a7, PRINT_STRING
	ecall
	
	#--- Calcular la expresion de conversion
	#--- t3 = (d1 -'0') * 10 + (d0 - '0')
	
	##-- Leer digito de mayor peso
	##-- t1 = d1
	lb t1, 0(a0)
	
	#-- Convertir el dígito ASCII a número
	li t6, '0'
	sub t1, t1, t6  #-- t1 = t1 - '0'
	
	##-- Leer digito de menor peso
	##-- t0 = d0
	lb t0, 1(a0)
	
	#-- Covnertirlo a numero
	sub t0, t0, t6  #-- t0 = t0 - '0'
	
	#-- Calcular d1 * 10
	li t5, 10
	mul t2, t1, t5
	
	#-- Calcular t3 = d1 * 10 + d0
	add t3, t2, t0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, t3
	li a7, PRINT_INT
	ecall

fin:		
	#-- Terminar
	li a7, EXIT
	ecall