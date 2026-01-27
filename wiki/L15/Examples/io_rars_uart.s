#----------------------------------------------------------------
#-- Modulo io_rars_uart 
#--   Entrada/salida a traves de la UART del RARs
#--
#--  Antes de utilizar el modulo hay que llamar a la funcion 
#--    io_ini()
#--
#--  Antes de acabar el program ahay que llamar a io_close()
#----------------------------------------------------------------

	#--- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#---------- Offset de los registros
	#----- Registro de control del receptor
	.eqv RX_CTRL 0x00
	
	#----- Registro de datos del receptor
	.eqv RX_DATA 0x04
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del receptor
	.eqv RX_READY 0x01  
	
	#----- Registro de control del transmisor
	.eqv TX_CTRL 0x08
	
	#-- Registro de DATOS del transmisor
	.eqv TX_DATA 0x0C
	
	#-- Máscaras de acceso a los bits
	#-- Bit Ready del transmisor
	.eqv TX_READY 0x01  


	.text
	
#-------------------------------------------------------------
#-- io_init()
#--
#--  Configurar el modulo de Entrada/salida de bajo nivel
#--  Se debe llamar antes de ejecutar cualquier otra funcion
#--  de este modulo
#-------------------------------------------------------------
.global io_init
io_init:

	#-- Direccion de acceso a la uart
	li gp, UART_BASE

	ret	
	
#-------------------------------------------------------------
#-- io_close()
#--
#-- Terminar de usar el modulo de entrada/salida. Finalizar
#-- las operaciones pendientes
#-------------------------------------------------------------
.global io_close
io_close:
	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- Esperar a que se termine de enviar
	#-- el caracter en vuelo (si lo hay)
	jal uart_wait_tx_ready

	#-- Recuperar la dirección de retorno y liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret
	
	
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
.global putchar
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

#--------------------------------------------------------
#-- getchar()
#--
#-- Esperar a que se pulse una tecla
#-- Esta funcion es BLOQUEANTE
#--
#-- SALIDA:
#--   a0 (car): Caracter introducido por el usuario
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#-------------------------------------------------------
.global getchar
getchar:
	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)

	#-- Esperar a que se pulse una tecla
	jal uart_wait_rx
	
	#-- Leer el caracter recibido. Se lee del registro
	#-- de datos del receptor
	lw a0, RX_DATA(gp)

	#-- Recuperar la direccion de retorno y
	#-- liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#-------------------------------------------------------
#-- uart_wait_rx()
#--
#--  Esperar hasta que se reciba un caracter
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#----------------------------------------------------------
uart_wait_rx:

	#-- Crear la pila y guardar la direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Esperar hasta que se reciba una tecla
wait_rx:
	jal keypressed
	beq a0, zero, wait_rx
	
	#-- Tecla recibida!
	#-- retornar
	
	#-- Recuperar la direccion de retorno y
	#-- liberar la pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#-------------------------------------------------------
#-- keypressed()
#--   Detectar si hay una tecla pulsada
#--
#-- SALIDA:
#--   0: Tecla no pulsada
#--   1: Tecla pulsada
#--
#-- Se supone que el registro gp contiene la direccion
#--   base de la UART
#------------------------------------------------------
.global keypressed
keypressed:

	#-- Leer el registro de control del transmisor
	lw a0, RX_CTRL(gp)
	
	#-- Quedarse solo con el bit 0
	andi a0, a0, RX_READY
	
	#-- y devolverlo
	ret
