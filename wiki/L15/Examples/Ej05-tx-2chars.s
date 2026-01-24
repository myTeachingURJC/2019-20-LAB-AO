#-------------------------------------------------------
#--  Pruebas del transmisor de la UART del RARs
#--  Envío de dos caracteres seguidos
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
	
	#----- Envio del primer caracter
	#-- Esperar a que el transmisor este listo
	jal uart_wait_tx_ready
	
	#-- para enviar un carácter
	li t0, 'A'
	sw t0, TX_DATA(gp)
	
	#---- Envío del segundo caracter
	jal uart_wait_tx_ready
	li t0, 'B'
	sw t0, TX_DATA(gp)
	
	#--- Esperar hasta que se envie el segundo caracter
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

