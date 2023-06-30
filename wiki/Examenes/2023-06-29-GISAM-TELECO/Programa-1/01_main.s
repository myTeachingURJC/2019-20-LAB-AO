#--------------------------------------------------------
#-- Programa de pruebas. Este programa hace lo siguiente:
#--
#--   * Pide al usuario una cadena (que representa un comando)
#--   * Esta cadena se copia a otra zona de memoria (cmd)
#--   * Se imprime la nueva cadena para comprobar que se ha copiado bien
#------------------------------------------------------------------------

	#-- Tamaño del buffer de caracteres
	.eqv MAX 16
	
	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv READ_STRING 8

	.data
	
	
buffer: .space MAX   #-- Buffer de entrada
cmd:    .space MAX   #-- Zona donde copiar el comando introducido
prompt: .string "$ "	#-- Prompt a mostrar al usuario
msg:    .string "Comando: "

	
	.text
	
	#-- Imprimir el prompt
	la a0, prompt
	li a7, PRINT_STRING
	ecall
	
	#-- Leer comando introducido por el usuario
	la a0, buffer
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Copiar el buffer introducido a la zona de comando
	#-- a0: Puntero a buffer (cadena fuente)
	#-- a1: Puntero a cmd  (cadena destino)
	la a1, cmd
	jal strcpy

	#-- Imprimir mensaje al usuario
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena copiada
	la a0, cmd
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
	