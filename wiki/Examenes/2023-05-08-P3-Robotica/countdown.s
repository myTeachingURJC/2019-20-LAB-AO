	.globl countdown

	#-- Servicio SLEEP del sistema operativo
	.eqv SLEEP 32

	#-- Tiempo de espera en microsegundos
	.eqv TIEMPO_MS 500
	
	.text
#---------------------------------------------------------
#-- Funcion de cuenta atras
#-- counddown(ini)
#--
#-- ENTRADAS:
#--   a0: (ini): Valor inicial de la cuenta atrás (0-9)
#-- SALIDAS:
#--   Ninguna
#--------------------------------------------------------

countdown:

	#-- Reservar espacio para la pila
	addi sp,sp,-16
	
	#-- Guardar direccion de retorno
	sw ra,12(sp)
	
	#-- Meter s0 en la pila para cumplir con el convenio
	sw s0, 0(sp)
	
	#-- Usamos s0 como contador
	#-- Inicializar s0
	mv s0, a0

bucle:	
	#-- Mostrar numero actual en el display
	mv a0, s0
	jal digit
	
	#-- Llamar a sleep
	li a0, TIEMPO_MS
	li a7, SLEEP
	ecall
	
	#-- Comprobar si hemos llegado a 0
	beq s0, zero, fin
	
	#-- Decrementar el contdor
	addi s0,s0,-1
	
	#-- Repetir
	b bucle

fin:

	#-- Recuperar s0
	lw s0, 0(sp)

	#-- Recuperar direccion de retorno
	lw ra,12(sp)
	
	addi sp,sp,16
	ret
	
	