#-- Solución al ejericio 6: Conversion de una cadena 
#-- variable a número. Puede ser tanto un numero positivo
#-- como negativo

	.include "servicios.asm"

	.eqv MAX 10

	.data

cadnum: .space MAX  #-- Cadena a convertir

msg1:   .string "\nIntroduzca cadena: "
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
		
	#--- t0: Resultado parcial
	li t0, 0
	
	#-- Primero comprobamos si hay signo
	#-- En el registro t6 metemos -1 ó 1
	#-- dependiendo de si tiene o no signo
	#-- Multiplicaremos el resultdo final por t6
	li t6, 1
	
	#--- Leer primer digito
	lb t1, 0(a0)
	
	#-- ¿NO es signo menos? --> ir al bucle principal
	li t5, '-'
	bne t1, t5, next_car
	
	#-- Es signo menos, guardar -1 en t6
	li t6, -1
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Bucle principal
next_car:
	#--- Leer digito
	lb t1, 0(a0)
	
	#-- ¿Es \n? Hemos terminado
	#-- El resultado es el que esta en t0
	li t5, '\n'
	beq t1,t5, imprimir
	
	#-- El caracter no es cero
	#-- Multiplicar t0 por 10
	li t2, 10
	mul t0, t0, t2
	 
	#-- Obtener el numero del digito (t1 - '0')
	li t3, '0'
	sub t4, t1, t3  #-- t4 = t1 - '0
	
	#-- t0 = t0 + t4
	add t0, t0, t4
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b next_car
	
	
imprimir:

        #-- El resultado está en t0
        #-- multiplicar t0 = t6 * t0
        #-- para añdir el signo
        mul t0, t6, t0
	
	#-- Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir el numero calculado
	mv a0, t0
	li a7, PRINT_INT
	ecall
 
	#-- Terminar
	li a7, EXIT
	ecall
	
	
