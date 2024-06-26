
	.globl string8ToInt


	.text

#Funcion que transforma un string de 8 digitos a un entero
#Argumentos:
# - a0. Puntero/direccion de memoria del string de 8 digitos
#Valor de retorno:
# - a0. Entero con el valor
# - a1. 0 = OK, 1 = ERROR
	
string8ToInt:

	li t3, 0 # registro temporal donde guardar los resultados parciales de valor entero
	li t4, 0 # indice del string
	li t6, 7 # MAX INDEX

string8ToIntLoop:

	lb t0, 0(a0)
	li t1, '0'
	li t2, '9'
	blt t0,t1, string8ToIntError
	bgt t0,t2, string8ToIntError
	sub t5, t0, t1 # Trasnforma ASCII en entero
	
	add t3,t3,t5
		
	beq t4, t6, string8ToIntOk
	addi a0, a0, 1
	addi t4,t4,1
	li t5, 10
	mul t3, t3, t5
	
	b string8ToIntLoop
string8ToIntOk:
	mv a0, t3
	li a1, 0

	b string8ToIntFin
string8ToIntError:
	li a1, 1
string8ToIntFin:	
	ret
