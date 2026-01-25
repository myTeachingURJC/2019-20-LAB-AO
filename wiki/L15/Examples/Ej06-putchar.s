#-------------------------------------------------------
#--  Pruebas del transmisor de la UART del RARs
#--  Envío de caracteres individuales mediante la
#--  funcion putchar()
#-------------------------------------------------------

	#-- Servicios del sistema operativo
	.include "so.h"
	
	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#---------- Offset de los registros
	#----- Registro de control del transmisor
	.eqv TX_CTRL 0x08
	
	#-- Registro de DATOS del transmisor
	.eqv TX_DATA 0x0C
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del transmisor
	.eqv TX_READY 0x01  
	
	.text
	
	#-- Direccion de acceso a la uart
	li gp, UART_BASE
	
	PRINT_STRINGI("Esperando al transmisor...")
	
	#----- Enviar caracteres individuales
	li a0, 'H'
	jal putchar
	
	li a0, 'O'
	jal putchar
	
	li a0, 'L'
	jal putchar
	
	li a0, 'A'
	jal putchar
	
	#--- Esperar hasta que se envie el ultimo caracter
	jal uart_wait_tx_ready
	
	#-- Terminar
	EXIT
	
	
#--------------------------------------------------------------
#-- uart_wait_tx_ready()
#--
#-- Esperar hasta que el bit READY del transmisor
#-- se ponga a 1
#--
#-- El registro gp debe contener la direccion base de la uart
#--------------------------------------------------------------
uart_wait_tx_ready:

wait_tx:
	#-- Leer el registro de control del transmisor
	lw t0, TX_CTRL(gp)
	
	#-- Aislar el bit TX_READY
	andi t0, t0, TX_READY
	
	#-- Si el bit es 0, el transmisor no esta listo
	#-- repetimos la accion hasta que se ponga a 1
	beq t0, zero, wait_tx

	#-- Trasmisor listo!
	ret
	
#---------------------------------------------------------------
#-- putchar(c): Imprimir un caracter
#--
#-- ENTRADA:
#--   - a0 (c): Carácter a imprimir
#--
#-- El registro gp debe contener la direccion base de la uart
#---------------------------------------------------------------
putchar:

	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Esperar a que el transmisor esté listo
	jal uart_wait_tx_ready
	
	#-- Escribir el caracter en el registro de datos
	sw a0, TX_DATA(gp)
	
	#-- Recuperar la dirección de retorno y liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

