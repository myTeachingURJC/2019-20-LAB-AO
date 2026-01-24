#-------------------------------------------------------
#--  Pruebas del transmisor de la UART del RARs
#--  Envío de un carácter y lectura del bit de READY
#--  para comprobar su evolucion
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
	li s0, UART_BASE
	
	PRINT_STRINGI("Esperando al transmisor...")
	
	#-- Esperar a que el transmisor este listo
wait_tx:
	#-- Leer el registro de control del transmisor
	lw t0, TX_CTRL(s0)
	
	#-- Aislar el bit TX_READY
	andi t0, t0, TX_READY
	
	#-- Si el bit es 0, el transmisor no esta listo
	#-- repetimos la accion hasta que se ponga a 1
	beq t0, zero, wait_tx
	
	#-- El transmisor está listo!!! 
	#-- Escribir en el registro de datos del transmisor
	#-- para enviar un carácter
	li t0, 'A'
	sw t0, TX_DATA(s0)
	
	#--- Ahora vamos a comprobar el funcionamiento del bit READY
	#--- Nada mas escribir un caracter el transmisor esta OCUPADO
	#-- Leer el bit READY
	lw t0, TX_CTRL(s0)
	
	#-- Imprimir el bit READy
	PRINT_CHARI('\n')
	PRINT_INTR(t0)
	PRINT_CHARI('\n')
	
	#-- Esperar un tiempo
	nop
	nop
	nop
	nop
	nop
	
	#-- Transcurrido un tiempo, el carácter se termina de transmitir,
	#-- se imprime en la pantall. El bit de READY se pone a 1 para
	#-- indicar que ya está listo de nuevo
	#-- Volver a imprimir el bit READY
	lw t0, TX_CTRL(s0)
	PRINT_INTR(t0)
	PRINT_CHARI('\n')
	
	#-- Terminar
	EXIT
