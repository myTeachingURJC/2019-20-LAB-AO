#------------------------------------------------------
#-- Funcion strcpy(src, dest)
#--
#--  Copiar la cadena fuente en la cadena destino
#--
#-- ENTRADAS:
#--   a0  : Src. Puntero a cadena fuente
#--   a1  : Dest. Puntero a cadena destino
#--
#-- DEVUELVE: Nada
#-------------------------------------------------------
	.globl strcpy
strcpy:
	
	bucle:
	#-- Leer byte
	lb t0, 0(a0)
	
	#-- Copiarlo a cadena destino
	sb t0, 0(a1)
	
	#-- Si el byte leido es 0, hemos llegado al final. Salir del bucle
	beq t0, zero, fin
	
	#-- Incrementar punteros fuente y destino
	addi a0, a0, 1
	addi a1, a1, 1
	
	#-- Repetir
	b bucle
	
	
fin:
	ret
	