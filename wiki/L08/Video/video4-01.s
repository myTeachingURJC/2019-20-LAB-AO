	.include "servicios.asm"
	
	.data
	
cad:     .string "rotorrrrr"
msg_pal: .string "PALINDROMO DETECTANO\n"
msg_NO:  .string "NO es palindromo\n"

	.text
	
	#-- t0 es el puntero izquierdo
	#-- t1 el puntero derecho
	#-- Los inicializamos a cero
	la t0, cad
	la t1, cad
	
	#--- t1 debe apuntar al ultimo caracter
	#--- t0 al primero
	
bucle1:
	lb t3, 0(t1)
	beq t3, zero, fin_cadena
	
	addi t1, t1, 1
	
	b bucle1
	
fin_cadena:	
	#-- Apuntar al último caracter (antes del cero)
	addi t1, t1, -1
	
bucle2:
	#-- Condicion de terminacion
	bgt t0, t1, es_palindromo
	
	lb t2, 0(t0)
	lb t3, 0(t1)
	
	bne t2, t3, no_palindromo
	
	addi t0,t0, 1
	addi t1,t1, -1
	b bucle2
	
es_palindromo:

	la a0, msg_pal
	li a7, PRINT_STRING
	ecall
	
	b fin

no_palindromo:

	la a0, msg_NO
	li a7, PRINT_STRING
	ecall
		
			
fin:	
	#-- Terminar
	li a7, EXIT
	ecall