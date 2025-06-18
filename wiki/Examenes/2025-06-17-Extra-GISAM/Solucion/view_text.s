
	.include "so.s"
	
	.globl view_text
	
	.text
	
#-------------------------------------------------------
#-- view_text:
#--   Funcion para hacer un volcado de memoria (en bytes)
#--------------------------------------------------------
#- ENTRADAS:
#--   a0: Direccion de comienzo para el volcado
#--   a1: Numero de bloques (de 16 bytes) a volcar
#--------------------------------------------------------	
view_text:

# -- Añade aquí el código que consideres necesario
# -- para solucionar el problema

	#-- Es una funcion intermedia
	#-- Hay que crear la pila para guardar la direccion
	#-- de retorno
	addi sp,sp, -16
	sw ra, 12(sp)
	
	#-- Además, como en código original se usan los registros
	#-- estáticos s0 y s1, tenemos que guardarlos en la pila
	#-- para cumplir el convenio de uso de registros
	sw s0, 0(sp)
	sw s1, 4(sp)

# --------------------------------------------------
# ------ CODIGO ORIGINAL: NO LO PUEDES MODIFICAR
# --------------------------------------------------


	#-- Registro s0: Puntero a la siguiente direccion
	mv s0, a0
	
	#-- Registro s1: Contador de bloques
	mv s1, a1


bucle:
	#-- Comprobar si es el ultimo bloque
	beq s1, zero, fin
	
	#-- No es el ultimo bloque. Volcar!

	#-- Volcado de un bloque
	mv a0, s0
	mv a1, s1
	jal dump16_bytes
	
	#-- Imprimir un salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Apuntar al siguiente bloque
	addi s0, s0, 16
	
	#-- Queda un bloque menos por imprimir
	addi s1, s1, -1
	
	#-- Repetir
	b bucle
	
fin:
# --------------------------------------------------
# ------ FIN DEL CODIGO ORIGINAL
# --------------------------------------------------

# -- Añade aquí el código que consideres necesario
# -- para solucionar el problema

	#-- Recuperar registros estáticos
	lw s0, 0(sp)
	lw s1, 4(sp)
	
	#-- Recuperar direccion de retorno
	lw ra, 12(sp)
	
	#-- Restaurar la pila
	addi sp, sp, 16
	
	#-- Ahora ya se puede retornar con seguridad
	#-- El bucle infinito se produce si se ha recuperado
	#-- la direccion de retorno
	ret
	
	
	
	
