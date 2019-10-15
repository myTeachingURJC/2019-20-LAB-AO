## Ejercicio 1

1. Ej-1.s
2. La palabra en ASCII es: "1 an"
3. 27 bytes (las cadenas tienen 8 caracteres más el 0 = 9.  9 * 3 = 27)
4.


| Direccion | Carácter |
|-----------|----------|
| 0x10010000| 'C' |
| 0x10010001| 'a' |
| 0x10010002| 'd' |
| 0x10010003| 'e' |
| 0x10010004| 'n' |
| 0x10010005| 'a' |
| 0x10010006| ' ' |
| 0x10010007| '1' |
| 0x10010008| '\0'|
| 0x10010009| 'C' |
| 0x1001000A| 'a' |
| 0x1001000B| 'd' |
| 0x1001000C| 'e' |
| 0x1001000D| 'n' |
| 0x1001000E| 'a' |
| 0x1001000F| ' ' |
| 0x10010010| '2' |
| 0x10010011| '\0'|
| 0x10010012| 'C' |
| 0x10010013| 'a' |
| 0x10010014| 'd' |
| 0x10010015| 'e' |
| 0x10010016| 'n' |
| 0x10010017| 'a' |
| 0x10010018| ' ' |
| 0x10010019| '3' |
| 0x1001001A| '\0'|

## Ejercicio 2

Ej-2.s

## Ejercicio 3

Ej-3.s

## Ejercicio 4

1. Ej-4.s
2. El carácter se encuentra en la dirección: 0x10010041

## Ejercicio 5

1. La cadena ocupa 5 bytes (4 caracteres + el \0). A continuación hay definidos 4 bytes, por lo que el tamaño total es de 5 + 4 = 9 bytes
2. En total se usan 3 palabras, aunque de la última sólo se usa un bytes
3. Los bytes en orden son '1','2','3','4','\0',0xAA,0xBB,0xCC, 0xDD
4. Se produce una excepción al ejecutar el programa. Hay un error de alineamiento
5. Como no está claro el propósito del programa, porque el programador no ha puesto comentarios, vamos a analizar las diferentes alternativas. El error es debido a que se está intentando leer la palabra que está en la direcciónn 0x10010005, que NO está alineada. Una solución es alinearla, colocando .align 2

  Otra solución sería sustituir los 4 .byte por un .word, inicializado con el valor 0xDDCCBBAA
6. La otra posibilidaad es que el programador en realidad sólo quería leer el byte situado en v1. En ese caso hay que sustutir lw por lb y ya no se producirá el error de alineamiento

Ej5-3.s

La conclusión principal de este ejercicio, además de entender bien los problemas de alineamiento... ¡Hay que comentar los programas! ¡Tenemos que facilitar la labor a los ingenieros y programadores que leerán nuestro código para entenderlo y modificarlo!

### Ejercicio 6

Ej-6.s

### Ejercicio 7
Ej-7.s

### Ejercicio 8

Ej-8.s

### Ejercicio 9

Ej-9.s

### Ejercicio 10

Ej-10.s
