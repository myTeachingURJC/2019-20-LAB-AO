

#--------------------------------------------------
#-- Funcion bloque(car, lineas)
#--
#-- ENTRADAS:
#--
#--   a0: (car) Caracter a usar en la linea
#--   a1: (lineas) Numero de lineas del bloque
#--
#-- SALIDAS:
#--   Ninguna
#--------------------------------------------------

	.globl bloque
	.include "system.h"
	.include "test.h"

	.text
	
bloque:
	#-- Es una funcion intermedia
	#-- Hay que crear la pila para guardar la direccion de retorno
	addi sp,sp,-16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)
	
	#-- Usamos registros estaticos para no perder la informacion
	#-- al llamar a la funcion linea
	#-- Para cumplir el convenio guardamos estos registros
	#-- en la pila
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)


	mv s0,a0  #-- Guardar el caracter de la linea
	mv s1,a1  #-- Guardar el numero de lineas
	
	#-- Contador de lineas
	li s2,0  
	
bucle:
	#-- Comprobar si se han impreso todas las lineas del bloque
	beq s2,s1,fin
	
	#-- Imprimir la linea
	mv a0,s0
	jal linea
	
	#-- Incrementar contador de linea
	addi s2,s2,1
	
	b bucle

fin:

	#-- Recuperar los registros estáticos para no violar
	#-- el convenio de uso de registros
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)

	#-- Recueprar la direccion de retorno
	lw ra, 12(sp)
	
    #-- Recuperar la pila
	addi sp,sp,16

	#-- Modificar todos los registros temporales y de argumentos
	init_temp_regs
	ret
	
	
