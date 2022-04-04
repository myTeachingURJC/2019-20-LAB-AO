# PARCIAL 2. Programación

Escribe un programa para el procesador RV32I, en el fichero **cifrar.s**. TODAS las constantes necesarias, de cualquier tipo, tienen que estar definidas en el fichero cifrar.s (No puede haber otros ficheros)

El programa deberá pedir al usuario que introduzca una cadena con el texto a cifrar. Este texto se cifrará, y se guardará sobre la propia cadena introducida por el usuario

La cadena introducida por el usuario **DEBE** estar situada a partir de la **primera dirección** del segmento de datos

El algoritmo de cifrado utiliza una **clave variable**, que se incrementa en uno al pasar al siguiente carácter, partiendo de un valor inicial de 1. El **algoritmo a implementar** es el siguiente:

1. Inicializar el puntero de cadena (hacia la cadena introducida por el usuario)
2. Inicializar la clave (valor inicial de 1)
3. Leer el caracter actual
4. Si este caracter es '\n', terminar
5. Sumar la clave al caracter actual
6. Guardar el carácter cifrado en la posición actual
7. Incrementar el puntero de cadena
8. Incrementar la clave en una unidad
9. Repetir desde el punto 3

En este pantallazo se muestra el funcionamiento

(pantallazo)

## Bonus: Optimización en tiempo. Suponiendo que cada instrucción tarda un ciclo en ejecutarse, obtendrás este bonus si consigues cifrar el texto "Holi" empleando menos de 53 ciclos

**NOTA**: Envía el fichero cifrar.s con la solución como una entrega del laboratorio





## Solución





```asm
#-- Programa calc.s: Evaluar la siguiente expresion:
#-- f = a + b - c + 30, donde a,b,c y f son VARIABLES
#-- Deben estar inicializadas a los valores: a=1, b=2, c=3, f=0
#-- El resultado de la expresión es: 1 + 2 -3 + 30 = 30
#-- Si al ejecutar el programa tenemos el valor 30 en la variable f
#-- el calculo será correcto (Dirección de f:  0x1001000C)

	#-- (opcional) Lo desplazamientos para acceder a las
	#-- variables se pueden definir mediante constantes
	.eqv vA  0
	.eqv vB  4
	.eqv vC  8
	.eqv vF  0xC

	.data
	
a:	.word 1  #-- Variable a. Desplaz. 0
b:      .word 2  #-- Variable b. Desplaz. 4
c:      .word 3  #-- Variable c. Desplaz. 8
f:      .word 0  #-- Variable d  Desplaz. C

	.text
	
	#-- x10: Registro puntero para acceder a las variables
	la x10, a  #-- Contiene la direccion de la variable a
	
	#-- Leer las variables a,b y c en los regisrtros x1, x2 y x3
	
	#-- x1 = variable a
	lw x1, vA(x10)
	
	#-- x2 = variable b
	lw x2, vB(x10)
	
	#-- x3 = variable c
	lw x3, vC(x10)
	
	#----- Calcular la expresion. El resultado se deja en x4
	
	#-- x4 = a + b
	add x4, x1, x2
	
	#-- X4 = X4 - c
	sub x4, x4, x3
	
	#-- Resultado final: x4 = x4 + 30
	addi x4, x4, 30
	
	#-- Almacenar x4 en la variable f
	sw x4, vF(x10)
	
	#-- Terminar
	li a7, 10
	ecall
	
```
Este programa tiene 11 instrucciones. Se cumple el BONUS!
