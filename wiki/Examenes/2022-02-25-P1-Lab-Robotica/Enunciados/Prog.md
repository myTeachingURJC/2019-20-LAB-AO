# PARCIAL 1. Programación

Escribe un programa en ensamblador el RISC-V, en el fichero **calc.s**, que calcule la siguiente expresión:

```
f = a + b - c + 30
```

donde, *a*, *b*, *c* y *f* son **variables** situadas en memoria, de forma consecutiva, en ese orden. La variable *a* debe estar en la primera posición de memoria del segmento de datos. Las variables deben estar inicializadas con los valores a=1, b=2, c=3 y f=0. El programa calcula la expresión para esos valores de las variables, deja el resultado en la variable *f* y termina

## Bonus: Puntuación extra si el programa tiene menos de 12 instrucciones

**NOTA**: Envía el fichero calc.s con la solución como una entrega del laboratorio

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
