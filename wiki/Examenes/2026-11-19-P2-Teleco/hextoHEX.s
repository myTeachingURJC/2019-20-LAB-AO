#-- Convertir un numero hexadecimal a mayúsculas
#-- Ej. "cafe0123" --> "CAFE0123"
#-- Ej. "4567abcd" --> "4567ABCD"
#-- Ej. "ff" --> "FF"

	#-- Tamaño maximo de la cadena
	.eqv MAX 20

    #-- Servicios del sistema operativo
	.include "system.s"

	.data
origen:  .space MAX
destino:  .space MAX
msg1:	.string "Introduce numero en hexadecimal: "
msg2:   .string "Hexadecimal en mayusculas: "


	.text
	
	#-- t0: Puntero a la cadena fuente
	la t0, origen
	
	#-- t1: Puntero a la cadena destino
	la t1, destino
	
	#-- 1. Imprimir cadena para pedir numero hexadecimal al usuario
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- 2. Pedir cadena al usuario
	la a0, origen
	li a1, MAX
	li a7, READ_STRING
	ecall

	#-- BONUS! Almacenar constantes en registros t3 y t4
	li t3, '\n'  #-- Salto de linea
	li t4, '9'   #-- Digito '9'
	
punto_3:
	#-- 3. Leer digito actual (car)
	lb t2, 0(t0)
	
	#-- 4. Si car es '\n', saltar al punto 11
	beq t2, t3, punto_11
	
	#-- 5. Si car <= '9' saltar al punto 7
	ble t2, t4, punto_7
	
	#-- 6. Convertir el digito a mayusculas. car = car - 32
	addi t2, t2, -32
	
punto_7:
	#-- 7. Almacenar digito en cadena destino
	sb t2, 0(t1)
	
	#-- 8. Apuntar al siguiente caracter de la cadena origen
	addi t0, t0, 1
	
	#-- 9. Apuntar al siguiente caracter de la cadena destino
	addi t1, t1, 1
	
	#-- 10. Saltar al punto 3
	j punto_3
	
punto_11:

	#-- 11. Imprimir mensaje para el usuario
	la a0, msg2
	li a7, PRINT_STRING
	ecall

	#-- 12. Imprimir numero convertido (cadena destino)
	la a0, destino
	li a7, PRINT_STRING
	ecall

	#-- 13. Terminar
	li a7, EXIT
	ecall
	
	
