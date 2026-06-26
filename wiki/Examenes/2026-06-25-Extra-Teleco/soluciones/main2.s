	#-- Servicios del sistema operativo
	.include "so.s"

	.eqv MAX 5

		.data
msg1:	.string "\nEvaluando polinomio para x="
msg2:   .string " ---> P(x)="

	.text


	# -- Contador
	li s0, 0

bucle:
	# -- Imprimir mensaje
	li a7, PRINT_STRING
	la a0, msg1
	ecall
	
	# -- Imprimir el contador
	mv a0, s0
	li a7, PRINT_INT
	ecall

	# -- Imprimir mensaje del resultado
	la a0, msg2
	li a7, PRINT_STRING
	ecall

	# --- Calcular P(2)
	mv a0, s0
	jal polinomio
	
	#-- Imprimir resultado
	li a7, PRINT_INT
	ecall
	
	# -- Comprobar si hemos llegado al valor maximo
	# -- de x
	li t0, MAX
	beq s0, t0, fin
	
	# -- Incrementar contador
	addi s0, s0, 1
	
	#-- Repetir
	j bucle


	#-- Terminar
fin:
	li a7, EXIT
	ecall

