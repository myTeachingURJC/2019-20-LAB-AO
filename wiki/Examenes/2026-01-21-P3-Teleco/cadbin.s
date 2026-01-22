
	.global cadbin
#-------------------------------------------------------------
#-- cadbin(cad, n): Convertir un entero a un binario cadena 
#--
#-- ENTRADAS:
#--    a0 (cad): Puntero a la cadena donde depositar el numero
#--    a1 (n): Numero a convertir a binario
#--
#-- SALIDAS:
#-     Ninguna
#-------------------------------------------------------------
cadbin:    
        
    #-- Paso 1: Inicializar el contador de digitos: cont=8
    li t0, 8  #-- t0: cont
    
    #-- Paso 2: Si cont es 0, saltar al paso 12 (fin) 
paso_2:
    beq t0, zero, paso_12
    
    # Paso 3: Si n >= 128 salta al paso 6
    li t1, 128
    bge a1, t1, paso_6
    
    # Paso 4: Almacenar el caracter '0' en la posicion actual de la cadena
    li t1, '0'
    sb t1, 0(a0)
    
    # Paso 5: Saltar al paso 8
    j paso_8
    
    # Paso 6: Almacenar el caracter '1' en la posicion actual de la cadena (cad)
paso_6:
    li t1, '1'
    sb t1, 0(a0)

    # Paso 7: n = n - 128
    addi a1, a1, -128
    
    # Paso 8: Apuntar al siguiente caracter de la cadena (cad = cad + 1)
paso_8:
    addi a0, a0, 1

    # Paso 9: n = n + n
    add a1, a1, a1
    
    # Paso 10: cont = cont - 1
    addi t0, t0, -1
    
    # Paso 11: Saltar al paso 2
    j paso_2
    
    #-- Paso 12: Fin
paso_12:
    ret
   
