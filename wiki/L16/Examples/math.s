#----------------------------------------------------------
#-- Math. Biblioteca matematica
#----------------------------------------------------------

#----------- mul_basic(a,b) ----------
mul_basic:
 #----------------------------------------------------------------
 #-- mul_basic(a,b): Multiplicación de numeros enteros
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
 #--
 #-- Algoritmo basico de multiplicacion
 #----------------------------------------------------------------
    .global mul_basic

    #-- Implementacion 1: Basado en la definicion de multiplicacion
    #-- a.b = b + b +...+ b (a veces) = a + a +...+ a + a (b veces)

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
    j mul_basic_cont

 caso1:
 
    #-- caso 1:
    #-- t0 = n = a
    mv t0, a0
    #-- t1 = v = b
    mv t1, a1

 mul_basic_cont:

    #-- Resultado parcial = 0
    li t2, 0

    #--- Bucle principal
 mul_basic_loop:

    #-- Si n es 0, hemos terminado
    beq t0, zero, mul_basic_end

    #-- resultado = resultado + v
    add t2, t2, t1

    #-- n = n - 1
    addi t0, t0, -1

    #-- Repetir
    j mul_basic_loop

 mul_basic_end:

    #-- Devolver resultado
    mv a0, t2
    ret
#------------------------------------

#----------- _mul(a,b) --------------
_mul:
 #-----------------------------------------------------
 #-- _mul(a,b): Multiplicacion de dos numeros enteros
 #--
 #-- ENTRADAS:
 #--  -a0 (a): Operando 1
 #--  -a1 (b): Operando 2
 #-----------------------------------------------------
    .global _mul

    #-- t0: Resultado parcial
    li t0, 0

    #-- t1: Contador de bits (tamaño de los operandos)
    li t1, 32

    #-- Bucle principal
 _mul_loop:

    #-- Si contador de bits es 0, terminar
    beq t1, zero, _mul_end

    #-- t2: bit 0 de operando b
    andi t2, a1, 1

    #-- Si el bit es 0, continuar con el algoritmo
    beq t2, zero, _mul_cont

    #-- El bit es 1: Actualizar el resultado parcial
    add t0, t0, a0

 _mul_cont:

    #-- Desplazar operando 1 un bit a la izquierda
    #-- a = a << 1
    slli a0, a0, 1

    #-- Desplazar operando 2 un bit a la derecha
    #-- b = b >> 1
    srli a1, a1, 1

    #-- Decrementar contador de bits
    addi t1, t1, -1

    #-- Repetir
    j _mul_loop

 _mul_end:
    #-- Devolver resultado
    mv a0, t0
    ret
#------------------------------------

#----------- div_basic(a,b) ---------
div_basic:
  #------------------------------------------------
  #-- div_basic(a,b):
  #--
  #--   Calcular la division entre enteros a / b
  #--
  #--  ENTRADAS:
  #--   -a0 (a): Dividendo
  #--   -a1 (b): Divisor
  #--
  #--  SALIDAS:
  #--   -a0: Resultado (cociente)
  #--   -a1: Resto
  #-------------------------------------------------
    .global div_basic

    #-- Algoritmo basico: Restas sucesivas
    #-- Caso 1: Si Dividendo < divisor, entonces
    #--    el resultado es 0 y el resto = dividendo
    blt a0, a1, div_basic_caso1

    #-- Caso 2: Dividendo >= Divisor (caso normal)
    #-- t0: Resultado parcial
    li t0, 0

 div_basic_loop:
    #-- Actualizar resultado parcial
    addi t0, t0, 1

    #-- Actualizar dividendo
    sub a0, a0, a1
    
    #-- Si dividendo >= divisor, repetir
    bge a0, a1, div_basic_loop

    #-- Resto = dividendo
    mv a1, a0

    #-- Devolver resultado
    mv a0, t0

    j div_basic_end


 div_basic_caso1:
    #-- Resto = divisor
    mv a1, a0
    #-- Resultado = 0
    li a0, 0

 div_basic_end:
    ret
#------------------------------------

