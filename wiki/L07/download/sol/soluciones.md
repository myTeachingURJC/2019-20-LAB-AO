## Ejercicio 10

1. En las instrucciones de salto del RISCV, el último argumento indica la dirección relativa de la instrucción destino, pero expresado en "medias palabras". Nos está indicando que el salto se realizará 10 medias-palabras hacia adelante. Es decir, 5 instrucciones hacia adelante Como el jal está en la dirección n0x00400000, salta a la dirección 0x00400000 + 5 * 4 (5 palabras más adelante), que en hexadecimal es: 0x00400000 + 0x14 = 0x00400014

  Salta a la dirección 0x0040014

2. La instrucción, por tanto, que se ejecutará después de jal será la que está en la dirección 0x00400014:  addi x30, x0, 5

3. En el código fuente trabajamos con etiquetas, por lo que el programa original podría ser:

```asm
      jal x0, next         
      addi x6,x0,1      
      addi x7,x0,2      
      addi x28,x0,3     
      addi x29,x0,4
next:     
      addi x30,x0,5     
      addi x17,x0,10    
      ecall
```

Si usamos directamente la instrucciónn *jal x0, 10*, aunque se trata de una instrucción correcta del RISC-V, el ensamblador producirá un mensaje de error. Este ensamblador nos obliga a usar etiquetas, que es lo que los humanos entendemos

4. Si ensamblamos ese código, efectivamente obtenemos el segmento de código original

Como li es una pseuinstruccion para inicilizar registros, que es equivalente a addi, el programa original también podría ser este. El segmento de código obtenido es exactamente igual

```asm
.text

      jal x0, next
      li t1, 1
      li t2, 2
      li t3, 3
      li t4, 4
next:	li t5, 5
      li a7, 10
      ecall
```
