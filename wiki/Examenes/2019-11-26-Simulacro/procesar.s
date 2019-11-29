#---------------------------------------------------------------------------
#-- Subrutina procesar
#--
#-- ENTRADAS:
#--  a0: Puntero a cadena origen
#--  a1: Puntero a cadena destino
#--
#-- SALIDAS:
#---  Ninguna
#----------------------------------------------------------------------------

	.globl procesar
	
	.text
	
procesar:

        #-- Es una subrutina intermedia. Necesitamos crear
        #-- la pila para guardar la direccion de retorno
        addi sp, sp, -16
        
        #-- Guardar la direccion de retorno
        sw ra, 12(sp)
        
        #-- Guardar en la pila a1,  
        #-- con la direccion destinno, porque la necesitaremos despues
        sw a1, 0(sp)  #-- Direccion destino
        
        #-- llamar a copiar
        jal copiar

        #-- Recuperar la direccion destino en a0
        lw a0, 0(sp)
        
        #-- Llamar a upper
        jal upper
        
        #-- Recuperar la direccion de retorno
        lw ra, 12(sp)
        
        #-- Liberaer la pila
        addi sp, sp, 16

	ret
	
	