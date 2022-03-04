# Parcial 1 del LAB. TEST

**Nota**: La respuesta correcta siempre es la primera


### L1: Instrucciones básicas

**L1**. Al ejecutar este programa:

```asm
.text

addi x3, x0, 4
addi x4, x0, 0
add x4, x0, x3
addi x5, x4, 0xFFFFFFFF

li a7, 10
ecall
```

1. El registro x5 tiene el valor 3
2. El registro x4 tiene el valor 3
3. El programa no ensambla
4. El registo x5 tiene el valor 0x00

### L1: Segmento de código

**L1**. ¿Cuanta memoria ocupa este programa?

```asm
.text

addi x3, x0, 4
addi x4, x0, 0
add x4, x0, x3
addi x5, x4, 0xFFFFFFFF

li a7, 10
ecall
```

1. 24 bytes
2. 5 palabras de 32 bits
3. 2 palabras de 64 bits y 1 de 32 bits
4. Nada, porque no ensambla

------------------------------------------

### L1: Simulación

**L1**. Simula este programa. ¿Cuál es la cuarta instrucción que se ejecuta?

```asm
.text

     addi x3, x0, 2
a:
     addi x3,x3,-1
     bgt x3,x0, a

     li a7, 10
     ecall
```
     
1. addi x3, x3, -1
2. addi x3, x0, 2
3. li a7, 10
4. bgt x3,x0, a

### L2: Código máquina

**L2**. Indica cuál es el código máquina de la tercera instrucción que ejecuta el procesador


    .text
a:
    addi x5, x0, 0
b:
    addi x6, x0, 0
c:
    addi x5, x5, 1  
    add x6, x6, x5
    b c
    
1. 0x00128293
2. 0x00000313
3. 0x00400000
4. 0x00400008

### L2: Etiquetas


**L2**. ¿Cual es el valor de la etiqueta c?

 ```asm
     .text
a:
    addi x5, x0, 0
b:
    addi x6, x0, 0
c:
    addi x5, x5, 1  
    add x6, x6, x5
    b c
 ```

1. 0x00400008
2. 0x00400000
3. 0x00128293
4. 0x10010000


### L2: Contador de programa

**L2**. Sabiendo que el PC tiene el valor 0x00400010. ¿Qué instrucción de este program es la siguiente que se va a ejecutar?

```asm
    .text
ini:
a:
    addi x5, x5, 3 
    addi x6, x6, 5 
    addi x7, x7, 7
b:
    addi x8, x8, 9 

    sub x9, x7, x8  
    add x6, x6, x6 
    add x6, x6, x6
c:  
    sub x9, x6, x9 
    add x5, x5, x5 
    add x5, x5, x9
d:  
    addi x10, x5, 15

    li a7, 10
    fin:    ecall
last:
```

1. sub x9, x7, x8
2. add x6, x6, x6
3. addi x8, x8, 9
4. ninguna. Es un valor incorrecto del PC

### L3: Segmento de datos

¿En qué dirección de memoria se encuentra almacenada la palabra 0xCAFEBACA?
.data

```asm
a:
  .word 1,2,3,4
  .word 10
  .word 20
  .word 0xCAFEBACA


  .text

  li a7, 10

  ecall
```

1. 0x10010018
2. 0x10010000
3. 0x10010006
4. 0x00400018

### L3: Instrucciones y pseudo-instrucciones

**L3**. Indica cual de las siguiente afirmaciones es cierta

```asm
         .data
dato:    .word 0xCACABACA

         .text
          la x5, dato
          li a7, 10
          ecall
```

1. Este programa tiene dos pseudo-instrucciones y una instrucción básica
2. Este programa tiene 3 instrucciones
3. Este programa ocupa 15 bytes  
4. Al ejecutarlo, se asigna el valor 0xCACABACA al registro x5


### L3: Accesos a memoria-1

**L3**. ¿Qué hace este programa?

```asm
    .data

a:
    .word 0
    .word 0

    .text
    la x5, a
    li x6, 0xFF
    sw x6, 4(x5)
```

1. Almacena el valor 0xFF en la dirección 0x10010004
2. Tansfiere el valor del registro x9 al x6
3. Carga en el registro x6 lo que hay en x5 + 4
4. La primera instrucción almacena el valor hexadecimal a en x5


--------------------------------------

### L4: Entrada-salida mapeada

¿Qué hace el siguiente programa?

```asm
	.data
	
t:  .word 0X6F, 0X7F, 0X07, 0X7D, 0X6D, 0X66, 0X4F 
	.word 0X5B, 0X06, 0X3F
	
	.text
	
	la x5, t
	li x6, 0Xffff0010
	
	lw x10, 0(x5)
	sw x10, 0(x6)
	
	lw x10, 4(x5)
	sw x10, 0(x6)
	
	lw x10, 8(x5)
	sw x10, 0(x6)
	
	lw x10, 0xC(x5)
	sw x10, 0(x6)
	
	lw x10, 0x10(x5)
	sw x10, 0(x6)
	
	lw x10, 0x14(x5)
	sw x10, 0(x6)
	
	lw x10, 0x18(x5)
	sw x10, 0(x6)
	
	lw x10, 0x1c(x5)
	sw x10, 0(x6)
	
	lw x10, 0x20(x5)
	sw x10, 0(x6)
	
	lw x10, 0x24(x5)
	sw x10, 0(x6)
	
	li a7, 10
	ecall
```

1. Saca por el display de 7 segmentos derecho los dígitos del 9 al 0 y termina
2. No hace nada, porque no accede a ningún periférico de salida
3. Saca el dígito 0 por el display de 7 segmentos derecho y termina
4. Al terminar el programa el registro x10 vale 0x6F 