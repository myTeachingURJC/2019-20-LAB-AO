## Ejercicio 6

1. El codigo maquina de estas instrucciones es:

addi x0, x0, 0  -----> 0x00000013
addi x0, x0, 0xFA ---> 0x0FA00013

2. Solo se diferencian en los caracteres hexadecimales FA. Parece  
que los digitos 5 y 6 (FA) codifican el valor de la instruccion addi

Si eso es cierto, el cóigo máquina de la instruccio addi x0,x0,0xBB seria:

0x0BB00013

Lo comprobamos en el simulador: Exacto! es esa misma!

3.

  Instrucciones:

addi x0, x1, 0  --> 0x00008013 --> 0000 0000 0000 0000 1000 0000 0001 0011
addi x0, x2, 0  --> 0x00010013 --> 0000 0000 0000 0001 0000 0000 0001 0011
                                   ==== ==== ==== ===x x=== ==== ==== ====

Solo se diferencian en 2 bits: el 15 y el 16

4.

Instrucciones:

addi x0, x0, 0 ---> 0x00000013 --> 0000 0000 0000 0000 0000 0000 0001 0011
addi x31, x0, 0 --> 0x00000F93 --> 0000 0000 0000 0000 0000 1111 1001 0011
                                   ==== ==== ==== ==== ==== xxxx x=== ====

Parece que el número de registro se codifica los bits 7-11 (5 bits)

El registro 0 tiene esos 5 bits a 0:  00000
El registro 31 tiene esos 5 bits a 1: 11111

                                   
