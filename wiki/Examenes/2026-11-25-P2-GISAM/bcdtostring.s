#-- Conversion de digitos BCD a cadenas

	.include "services.s"

	.eqv MAX 10

	.data
	
	#-- Numeros en memoria
bcd:	.byte 0, 1, 2, 3, 0xc, 0xa, 0xf, 0xe, 0x10
cad:    .space MAX

	.text
	
	#-- t0: Puntero de acceso a los numeros
	la t0, bcd
	
	#-- t1: Puntero a la cadena generada
	la t1, cad
	
punto_1:
	#-- 1.  Leer byte actual (num)
	lb t2, 0(t0)
	
	#-- 2. Si el byte es 0x10, saltar al punto 11
	li t3, 0x10
	beq t2, t3, punto_11
	
	#-- 3. Si num<=9, saltar al punto 6
	li t3, 9
	ble t2,t3, punto_6
	
	#-- 4. Convertir digito hexadecimal a caracter. num = num + 55
	addi t2, t2, 55
	
	#-- 5. Saltar al punto 7
	j punto_7
	
punto_6:
	#-- 6. Convertir digito a caracter. num = num + '0'
	addi t2, t2, '0'
		
punto_7:
	#-- 7. Almacenar num en la cadena destino
	sb t2, 0(t1)
	
	#-- 8. Apuntar al siguiente numero
	addi t0, t0, 1
	
	#-- 9. Apuntar al siguiente caracter de la cadena destino
	addi t1, t1, 1
	
	#-- 10. Saltar al punto z
	j punto_1
	
punto_11:
	#-- 11. Escribir '\n' en la cadena destino
	li t3, '\n'
	sb t3, 0(t1)

	#-- 12. Imprimir cadena destino
	la a0, cad
	li a7, PRINT_STRING
	ecall
	
	#-- 13 Terminar
	li a7, EXIT
	ecall
	
	