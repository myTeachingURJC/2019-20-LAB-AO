#---------------------------
#-- Programa principal
#---------------------------
#-- Prueba de la función de cuenta atrás
#-- en los displays de 7 segmentos
#----------------------------------------

	#-- Constantes de acceso a los servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv READ_INT 5

	.data
msg1:	.string "Introduce valor inicial de la cuenta atrás (0-9): "
msg2:   .string "\n¡Cuenta atrás iniciada!\n"
msg3:   .string "\nLift off!\n"

	.text
	
	#----- Pedir valor inicial de la cuenta atras
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	li a7,READ_INT
	ecall
	
	#-- t0: Guardar valor inicial cuenta atras
	mv t0, a0
	
	#-- Imprimir mensaje de arranque
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#--- Llamar a la funcion de cuentra atras
	#-- countdown(a0)
	mv a0, t0
	jal countdown

	#-- Imprmir mensaje final
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall

