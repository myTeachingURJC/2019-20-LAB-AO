	.text

 	.globl mul2u
#----------- _mul(a,b) --------------
mul2u:
 #-----------------------------------------------------
 #-- _mul(a,b): Multiplicacion de dos numeros enteros
 #--
 #-- ENTRADAS:
 #--  -a0 (a): Operando 1
 #--  -a1 (b): Operando 2
 #-----------------------------------------------------


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
