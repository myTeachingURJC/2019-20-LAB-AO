
	.globl replace
	
	.text

#-------------------------------------------
#-- replace(pcad, c_org, c_remp)
#--   Funcion para reemplazar el caracter c_orig por c_remp en la cadena
#--   apuntada por pcad
#--
#-- ENTRADAS:
#--   * a0: pcad: Puntero a la cadena
#--   * a1: c_org: caracter original 
#--   * a2: c_remp: Caracter a reemplazar
#..
#-- SALIDAS:
#--   Ninguna
#------------------------------------------
replace:
	
	#-- Es una funcion hoja: no hay que guardar la direccion 
	#-- de retorno: no es necesario guardar ra en la pila
	#-- Tampoco necesitamos la pila para otra cosa
	
        #-- Leer siguiente caracter
next:
	lb t0, 0(a0)
	
	#-- Es el final de la cadena?
	beq t0, zero, fin  # Si --> Terminar
	
	#-- Es el caracter igual al original?
	bne t0, a1, incrementar #-- No, pasar al sigueinte
	
	#-- Si, reemplazarlo por el nuevo
	sb a2, 0(a0)
	
	
incrementar:	
	#-- NO: apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir bucle
	b next	
		
	
fin:
	ret



