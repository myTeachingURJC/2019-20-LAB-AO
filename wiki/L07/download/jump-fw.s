#-- Ejemplo de salto incondicional
#-- hacia adelante	
	.text
	
	#-- Dar valores a t0 y t1
	li t0, 0xCAFE
	li t1, 0xBACA
	
	#-- El procesador comienza a ejecutar
	#-- las instrucciones etiquetadas como salta
	j salta
	
	#-- "Salta" por encima de estas instrucciones,
	#-- que NO se ejecutan
	li t0, 0x0000
	li t1, 0xFFFF

salta:
	#-- Terminar
	li a7, 10
	ecall	
	
	#-- Los registros t0 y t1 
	#-- valen CAFE y BACA respectivamente