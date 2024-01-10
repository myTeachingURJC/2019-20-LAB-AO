#-----------------------------------------------------------
#-- triangulo: Dibujar un triangulo de 4 lineas
#--
#-- ENTRADAS:
#--   Ninguna
#-- SALIDA:
#--   Ninguna
#----------------------------------------------------------

	.globl triangulo
	
	#-- Lineas del triangulo
	.eqv MAX 4
	
	.text
	
triangulo:

	#-- Añade aquí lo que consideres necesario
	

	#-- Reservar espacio para la pila
	addi sp,sp,-16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)
	
	#-- Guardar el registro s0 en la pila para
	#-- respetar el convenio de uso de registros
	sw s0, 0(sp)
	
	#---------------------------------------
	#-- CODIGO ORIGINAL: NO CAMBIAR NADA
	#--------------------------------------

	#-- Inicializar contador de lineas
	li s0,1
	
bucle:	
	#-- Dibujar linea de s0 caracteres
	mv a0,s0
	jal linea
	
	#-- Incrementar contador de linea (y numero de caracteres)
	addi s0,s0,1
	
	#-- Si hemos completado la cantidad de lineas: terminar
	li t0,MAX
	ble s0,t0,bucle
	
	#-- Fin.... Hemos terminado

	#--------------------------
	#--  FIN DEL CODIGO ORIGINAL
	#-------------------------
	
	
	#-- Añade aqui lo que consideres necesario
	
	#-- Recuperar s0
	lw s0, 0(sp)
	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp,sp,16

	ret

	
