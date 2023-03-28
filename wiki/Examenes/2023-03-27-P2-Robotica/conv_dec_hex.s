#-- Conversor de decimal a hexadecimal
#-- Pedir número en decimal
#-- Terminar al introducir el número 0

        #-- Constantes del sistema operativos (ESPECIFICACION)
	.include "serv.s"

	#-- Mensajes a mostrar al usuario (ESPECIFICACION)
	.data
msg1:	.string "\n\nIntroduce numero en decimal: "
msg2:   .string "Valor en hexadecimal: "

	.text
	
bucle:			
	#---------- Mostrar mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#--- Pedir numero al usuario
	li a7, READ_INT
	ecall
	#-- a0: Contiene el numero en decimal
	mv t0, a0
	
	##-- Comprobar si el numero es 0.
	##-- Si es asi, terminar
	beq t0, zero, fin
	
	##--- BONUS-----
	#-- Almacenar el numero en la direccion 0x10010040
	la t1, msg1
	sw t0, 0x40(t1)
	#--- Fin BONUS
	
	#------ Imprimir el mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir numero en hexadecial
	mv a0, t0
	li a7, PRINT_INT_HEX
	ecall
	
	#-- Repetir
	b bucle
	
fin:

	#-- Terminar
	li a7, EXIT
	ecall
