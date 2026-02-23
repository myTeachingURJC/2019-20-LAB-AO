#----------------------------------------------------------
#-- Math. Biblioteca matematica
#----------------------------------------------------------

#----------- __mulsi3(a,b) ----------
mulsi3:
 #----------------------------------------------------------------
 #-- mulsi3(a,b): Multiplicación de numeros enteros
 #--
 #--   * si --> Single Integer (32 bits)
 #--   * 3 --> Un total de 3 operandos: 2 entradas + resultado
 #--
 #--  ENTRADA:
 #--    - a0 (a): Operador 1
 #--    - a1 (b): Operador 2
 #--
 #--  SALIDA:
 #--    - a0: Resultado (truncado a 32 bits)
 #----------------------------------------------------------------
    .global mulsi3

    #-- Implementacion 1: Basado en la definicion de multiplicacion
    #-- a.b = b+b+..+b (a veces) = a+a+...+a+a (b veces)

    #-- De forma generica lo ponemos asi:
    #--  n: Numero de repeticiones
    #--  v: Valor a sumar
    #-- n.v = v + v + v + ... + v (n veces)

    #-- Como la multiplicacion es conmutativa, elegimos la expresión
    #-- en la que hay que realizar menos sumas
    #-- Usamos n como el min(a,b)

    #-- Algoritmo:
    #-- Si a < b, n = a, v = b
    blt a0, a1, caso1

    #-- else
    #-- caso 2:
    #-- t0 = n = b
    mv t0, a1
    #-- t1 = v = a
    mv t1, a0
    j mulsi3_cont

 caso1:
 
    #-- caso 1:
    #-- t0 = n = a
    mv t0, a0
    #-- t1 = v = b
    mv t1, a1

 mulsi3_cont:

    #-- Resultado parcial = 0
    li t2, 0

    #--- Bucle principal
 mulsi3_loop:

    #-- Si n es 0, hemos terminado
    beq t0, zero, mulsi3_end

    #-- resultado = resultado + v
    add t2, t2, t1

    #-- n = n - 1
    addi t0, t0, -1

    #-- Repetir
    j mulsi3_loop

 mulsi3_end:

    #-- Devolver resultado
    mv a0, t2
    ret
#------------------------------------
