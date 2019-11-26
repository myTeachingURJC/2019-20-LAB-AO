	.include "servicios.asm"
	
	.data
	
cad:     .string "rotorrrrr"
msg_pal: .string "PALINDROMO DETECTANO\n"
msg_NO:  .string "NO es palindromo\n"

	.text
	
	#-- t0 puntero izquiero
	#-- t1 puntero derecho
	la t0, cad
	la t1, cad
	
	#-- Incrementar t1 para que apunte al ultimo caracter
bucle1: 
        #-- Leer el caracter
	lb t3, 0(t1)
	
	#-- Si es 0, estamos en el final de la cadena
	beq t3, zero, fin_cadena
	
	addi t1, t1, 1
	
	b bucle1
	
fin_cadena:	

	#-- t1 apunta al ultimo caracter
	addi t1, t1, -1
		
bucle2:
	bgt t0, t1, es_palindromo
	
	#-- Leer los caracteres izquierdo y derecho
	lb t2, 0(t0)
	lb t3, 0(t1)
	
	#-- Comparar los caracteres
	bne t2,t3, no_palindromo
	
	#-- Apuntar a los siguientes caracteres
	addi t0, t0, 1
	addi t1, t1, -1
			
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
	
	