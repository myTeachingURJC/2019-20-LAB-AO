#-- Solución al ejericio 4: Conversion de una  
#-- cadena de caracteres de 2 dígitos a un número

	.include "servicios.asm"
	
	#-- Numero maximo de caracteres: 3, dos digitos más el 0
	.eqv MAX 3


	.data

cadnum: .space MAX  #-- Se reservan 3 bytes de espaci

msg1:   .string "\nIntroduzca cadena de dos dígitos: "
msg2:   .string "\nNumero: "
			
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	#-- Pedir cadena al usuario
	la a0, cadnum
	li a1, MAX
	li a7, READ_STRING
	ecall
		
	#-- Leer los digitos d1 y d0
	#-- t0 = d0
	lb t0, 1(a0)
	
	#-- t1 = d1
	lb t1, 0(a0)	
					
	#-- Calcular la expresion: num = (d1 - 48) * 10 + (d0 - 48)
	#-- t2 = 48
	li t2, 48
	
	#-- t3 = d0 - 48
	sub t3, t0, t2
	
	#-- t4 = d1 - 48
	sub t4, t1, t2
	
	#-- t6 = (d1 - 48) * 10
	li t5, 10
	mul t6, t4, t5
	
	#-- t6 = (d1 - 48) * 10 + (d0 - 48)
	add t6, t6, t3
	
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, t6
	li a7, PRINT_INT
	ecall
 
	#-- Terminar
	li a7, EXIT
	ecall
	
	
