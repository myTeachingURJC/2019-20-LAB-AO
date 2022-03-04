# Calcular la siguiente expresion:
# f = a + b - c + 30
# donde, a, b, c y f son variables situadas en memoria, de forma consecutiva, en ese orden.
# La variable a debe estar en la primera posición de memoria del segmento de datos. 
#Las variables deben estar inicializadas con los valores a=1, b=2, c=3 y f=0. 
#El programa calcula la expresión para esos valores de las variables, deja el resultado en la variable f y termina

# Bonus: Puntuación extra si el programa tiene menos de 12 instrucciones

	#-- Desplazamientos de las variables en memoria
	.eqv VA 0
	.eqv VB 4
	.eqv VC 8
	.eqv VF 0xC

	.data
	
a:	.word 1
b:	.word 2
c:	.word 3
f:	.word 0

	.text
	
	#-------- Calcular expresion
	#-- Leer las variables y llevarlas a los registros x1,x2 y x3 respectivametne
	
	#-- x10: PUntero a las variables
	la x10, a
	
	#-- x1=a
	lw x1,VA(x10)
	
	#-- x2=b
	lw x2,VB(x10)
	
	#-- x3=c
	lw x3,VC(x10)
	
	#-- Calcular la expresion
	#-- x4 = x1 + x2
	add x4,x1,x2
	
	#-- x4 = x1 + x2 - x3
	sub x4, x4, x3
	
	#-- x4 = x1 + x2 - x3 + 30
	addi x4, x4, 30
	
	#-- Dejar resultado en f
	sw x4, VF(x10)
	
	#-- Terminar
	li a7, 10
	ecall
	
	