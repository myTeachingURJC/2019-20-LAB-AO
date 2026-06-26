
	#-- Servicios del sistema operativo
	.include "so.s"

		.data
msg1:	.string "\nIntroduzca numero a: "
msg2:   .string "Introduzca numero b: "
msg3:   .string " * "
msg4:   .string " = "

	.text

bucle:
	# -------- Pedir numero a
	la a0, msg1
	li a7, PRINT_STRING
	ecall

	# -- Lectura del numero
	li a7, READ_INT
	ecall

	# -- s0: Primero numero
	mv s0, a0

	# --- Si a < 0, terminar
	blt s0, zero, fin


	# ------- Pedir numero b
	la a0, msg2
	li a7, PRINT_STRING
	ecall

	# -- Lectura del numero
	li a7, READ_INT
	ecall

	# -- s1: Segundo numero
	mv s1, a0

	# --- Si b < 0, terminar
	blt s1, zero, fin

	# -- Llamar a mul(a,b)
	mv a0, s0
	mv a1, s1
	jal mul2u

	# -- Guardar resultado en s2
	mv s2, a0

	# -- Imprimir el operando a
	mv a0, s0
	li a7, PRINT_INT
	ecall

	# -- Imprimir el simbolo de multiplicacion
	la a0, msg3
	li a7, PRINT_STRING
	ecall

	# -- Imprimir el operando b
	mv a0, s1
	li a7, PRINT_INT
	ecall

	# -- Imprimir el simbolo de igualdad
	la a0, msg4
	li a7, PRINT_STRING
	ecall

	# -- Imprimir el resultado
	mv a0, s2
	li a7, PRINT_INT
	ecall

	# -- Repetir
	j bucle

	#-- Terminar
fin:
	li a7, EXIT
	ecall


