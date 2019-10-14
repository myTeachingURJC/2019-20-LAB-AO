#-- Ejemplo de lectura de un byte
#-- Se define una cadena y se imprime en la 
#-- consola su primer carácter

	#-- Código de servicios del S.O
	.eqv EXIT       10
	.eqv PRINT_CHAR 11
	

	.data
	
cad1:	.string "Hola"

	.text
	
	#-- Puntero de acceso a la cadena
	la t0, cad1
	
	#-- Leemos el primer caracter
	lb t1, 0(t0)
	
	#-- Imprimir el caracter
	mv a0, t1
	li a7, PRINT_CHAR
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall 
	
	