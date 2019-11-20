#-----------------------------------------------------
#-- Subrutina operar(x,y)
#--
#-- Imprimir el vector (x,y)
#-- Imprimir el vector incrementado (x+1, y+1)s
#--
#-- ENTRADAS:
#--  a0: Coordenada x
#--  a1: Coordenada y 
#-- SALIDAS: Ninguna
#----------------------------------------------------

	#-- Punto de entrada
	.globl operar
	
	.text
operar:	

	#--- Crear pila
	addi sp, sp, -16
	
	#-- Guardar direccion de retorno
	sw ra, 12(sp)
	
	#-- Almacenar a0 y a1 en la pila
	sw a0, 8(sp)
	sw a1, 4(sp)

	#-- Imprimir el vector (x,y)
	jal print_vec
	
	#-- Recuperar x,y
	lw a0, 8(sp)
	lw a1, 4(sp)
	
	#-- Incrementar las coordenadas
	addi a0, a0, 1
	addi a1, a1, 1
	
	#-- Imprimir el vector incrementado (x+1, y+1)
	jal print_vec

	#-- Recuperar direccion de retorno
	lw ra, 12(sp)

	addi sp, sp, 16
	ret