# Soluciones. Sesion 4 Laboratorio

## Ejercicio 1

Escribe un programa que defina la variable contador cuyo valor inicial esté dado por el identificador INICIO. Dentro de un bucle infinito se incrementará esta varible en la cantidad indicada por el identificador INC. Para comprobar su funcionamiento usa los valores de INICIO = 100 e INC=10. No olvides colocar un Breakpoint en el bucle infinito, o bien ejecutarlo paso a paso

## Ejercicio 2

Al ejecutar el programa, observamos que los 4 elementos de la tabla, que tienen los
valores 0xBEBECAFE, 0xFACEB00C, 0x00FABADA, 0xCACABACA se han cargado en los
registros x10, x11, x12 y x13 respectivamente

Este programa nos enseña cómo definir una tabla y cómo acceder de manera
sencilla a sus elementos, usando identificadores. Si en vez de el identificador
utilizásemos directamente los números de desplazamiento, el programa sería mucho
más difícil de entender. Somo humanos. Necesitamos que los programas tengan
información para humanos

## Ejercicio 3

Modifica el programa anterior para que cada elemento de la tabla se incremente en INC unidades, donde INC es un identificador (prueba el programa con INC=1). El programa leerá cada elemento, lo incrementará en INC unidades y lo almacenará en su sitio. Simula el programa y comprueba que tras su ejecución, efectivamente todos los elementos de la tabla se han modificado

Una vez ejecutado, y usando INC = 1, la tabla contiene los siguientes valores:

0xBEBECAFF, 0xFACEB00D, 0x00FABADB, 0xCACABACB

## Ejercicio 4

Modifica el programa del contador del ejercicio 1 para que en vez de almacenar la cuenta en la variale contador, se envíe por el puerto de salida de la dirección 0xFFFF0000. Símulalo, coloca un Breakpoint en el bucle principal, y comprueba que en esa dirección se van almacenando los valores de contador

Si este programa se ejecutase en el RISC-V real se vería la cuenta en binario en los LEDs (Bueno, en realidad habría que añadir una pausa para ralentizar el micro, pero ya veremos cómo se hace)

## Ejercicio 5

Modifica el programa del ejercicio 4 para que el valor del contador se envíe a la dirección 0xFFFF0010 donde se encuentra el Display de 7 segmentos. Lanza el display en el simulador y conéctalo. Simula el programa (no olvides el Breakpoint o bien bajar la velocidad de la ejecución). Observa lo que aparece en el display. ¿Qué valores del contador hace que aparezcan dígitos o letras reconocibles en el display? (hay 128 combinaciones posibles, 2 elevado a 7, sin tener en cuenta el punto)

Contador: 6: Aparece un 1
Contnador 7: Aparece un 7
Contador 30: Letra J
Cotnador 63: Numero 0
Contador 79: Numero 3
Contador 91: Numero 2
Contador 95: Letra a
Contador 103: Numero 9
Contador 102: Numero 4
Contador 109: Numero 5
Cotnador 110: Letra Y
Contador: 111: Otro numero 9
Contador: 113: Letra F
Contador: 115: Letra P
Contador: 116: Letra h
118: Letra H
119: Letra A
121: Letra E
124: Letra b
125: Numero 6
126: Numero 8

## Ejercicio 6

Escribe un programa que muestre por el display de 7-segmentos derecho el dígito 3. Utiliza un identificador para este valor que hace aparecer un 3. Obtén los valores para que aparezca uno 1, 2 y 4

Los valores a enviar al display para que aparezcan los números 1,2,3 y 4 bien los podemos obtener ejecutando el ejercicio anterior hasta que aparezca, o bien los podemos calcular directamente dibujando los numeros y obteniendos los bits a 1 de los segmentos que hay que encender para que aparezca cada numo.

Así, para que aparezca el dígito 3 hay que encender los segmentos a,b,c,d y g, que se corresponden con los bits 0,1,2,3 y 6. El numero binario es: 01001111, Lo pasamos a hexadecimal: 0x4F. En decimal es 79, que el valor que habiamos obtenido en el ejercicio anterior


## Ejercicio 7

## Ejercicio 8

Amplía la tabla para contener 10 valores, que hagan aparecer los dígitos del 0 al 9 en el display. El programa deberá leer los valores, uno a uno y mandarlos al display, para ver los dígitos del 0 al 9 en el display. Luego termina

Todavía no sabemos hacer bucles así que hazlo igual que en el ejercicio anterior, con instrucciones lw y sw para cada dígito

## Ejercicio 9


## Ejercicio 10
