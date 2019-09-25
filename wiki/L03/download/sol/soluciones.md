# SESIÓN 1-3: SOLUCIONES a los ejercicios

## Ejercicio 1

1. Fichero init.s
2. El programa tiene 10 instrucciones
3. Ocupa 10 * 4 = 40 bytes
4. Fichero init.hex:

```
00500293  
00600313  
00700393
00800413
005007b3
00600833
007008b3
00800933
00a00893
00000073
```

## Ejercicio 2

1. Hay 7 palabras almacenadas
2. 7 palabras * 4 bytes cada palabra = 28 bytes
3. Tiene 2 instrucciones. Ocupa 4 bytes
4.

| Etiqueta | Dirección  |
|----------|------------|
|  a       | 0x10010000 |
|  b       | 0x10010000 |
|  c       | 0x10010010 |
|  d       | 0x10010018 |
|  e       | 0x1001001c |

5. El valor 20 (decimal)
6.

|  Dirección |  Byte  |
|------------|--------|
| **0x10010000** |  01      |
| 0x10010001 |  00      |
| 0x10010002 |  00    |
| 0x10010003 |  00    |
| **0x10010004** |  02        |
| 0x10010005 |   00   |
| 0x10010006 |   00   |
| 0x10010007 |   00   |
| ---------  | -----  |
| **0x10010018** | 30     |
| 0x10010019 |    00    |
| 0x1001001A |    00  |
| 0x1001001B |    00  |

7. Fichero Ejercicio-2.s

00000001
00000002
00000003
00000004
0000000a
00000014
0000001e

## Ejercicio 3

1. En el fichero variables4.s
2. Las 4 primeras líneas del fichero variables4.hex contienen:

12345678
11223344
cacabaca
00fabada

3. Con el comando hd vemos:

```
00000000  78 56 34 12 44 33 22 11  ca ba ca ca da ba fa 00  |xV4.D3".........|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000

```

El byte que se encuentra en la quinta posición es: 0x44  
Está en la dirección de memomria: 0x10010004

## Ejercicio 4

1. En el fichero vardir.s
2. Las direcciones son:

0x10010000
0x10010004
0x10010008
0x1001000C

Y efectivamente se cargan en los registros x5,x6, x7 y x8

3. El programa tiene 14 instrucciones. Ocupa 56 bytes


## Ejercicio 5

1. Fichero vardir2.s
2. Tiene 14 instrucciones. Ocupa: 56 bytes

## Ejercicio 6

1. Fichero vardir3.s

2. El programa tiene 8 instrucciones. Ocupa 32 bytes

3. Con esta forma de acceder a todas las variables, usando un único puntero a la variable a
tenemos un ahorro de 56 - 32 = 24 bytes.   Esta segunda forma es la que normalmente utilizaría, porque se reduce el código manteniendo la funcionalidad. También el programa tarda menos ciclos en ejecutarse, porque hay menos instrucciones

## Ejercicio 7

1. En el fichero expresion.s
2. OK. En f se debe almacenar el valor 25
3. Tiene 13 instrucciones: Ocupa 52 bytes
4. f está almacenada en la direccioon 0x10010010

## Ejercicio 8

1. Fichero fiboncci.s
2. Al ejecutarlo continuamente, como se usa un bucle infinito, al cabo de
un tiempo aparece el error:  Runtime exception at 0x00400018: address out of range 0x10400000
Es debido a que estamos intentando escribir en posiciones de memoria que están fuera del segmento de datos

## Ejercicio 9

1. Sí, según se le da al play, con el breakpoint colocado, van apareciendo casillas azules. Todas se ponen azules, no hay huecos entre medias

## Ejercicio 10

1. Programa memory-test.s

## Ejercicio 11

1. Programa smiley.s
