#------------------------------------------------------
#-- dump4(addr)  Funcion para volcar 4 palabras
#--   a partir de la direccion addr
#--   Se imprimen en HEXADECIMAL
#-- ENTRADAS:
#--    a0: Direccion a partir de la cual volcar (addr)
#-- SALIDA:
#--    Ninguna
#------------------------------------------------------
	#-- Servicios del sistema operativo
	.include "so.s"

.globl dump4

	.text
dump4:

	#-- t0: Direccion a volcar
	mv t0, a0
	
	#-- t1: Contador: Numero de palabras a volcar
	li t1, 4
	
	#-- Bucle principal
bucle:
	#-- Comprobar si hemos terminado
	#-- Si t1==0, hemos terminado
	beq t1, zero, fin
	
	#------ No hemos terminado, Volcar la direccion
	
	#-- Leer posicion de memoria actual
	lw t2, 0(t0)
	
	#-- Imprimir palabra en hexadecimal
	mv a0, t2
	li a7, PRINT_HEX
	ecall
	
	#-- Imprimir salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall
	
	#-- Decrementar el contador
	#-- Queda una posicion menos por volcar
	addi t1, t1, -1
	
	#-- Apuntar a la siguiente palabra
	addi t0, t0, 4
	
	b bucle

fin:
	ret
	
	