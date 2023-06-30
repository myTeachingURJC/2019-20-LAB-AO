
	
	
	#-- Tamaño del buffer de caracteres
	.eqv MAX 16
	
	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_STRING 4
	.eqv READ_STRING 8

	.data
	
	#-- Prompt a mostrar al usuario
buffer: .space MAX   #-- Buffer de entrada
prompt: .string "$ "	
msg:    .string "Sin espacios iniciales: --"


	.text
	
loop:
	#-- Imprimir el prompt
	la a0, prompt
	li a7, PRINT_STRING
	ecall
	
	#-- Leer comando introducido por el usuario
	la a0, buffer
	li a1, MAX
	li a7, READ_STRING
	ecall

	#--- Saltar los espacios
	jal skip_spaces

	#-- Leer caracter siguiente
	lb t0, 0(a0)
	
	#-- Si es \n se termina
	li t1, '\n'
	beq t0,t1, fin
	
	#-- a0 contiene la direccion de la cadena sin espacios
	mv t1,a0
	
	#-- Imprimir mensaje
	la a0, msg
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena sin espacios
	mv a0, t1
	li a7, PRINT_STRING
	ecall
	
	#-- Repetir
	b loop
	
	
fin:
	#-- Terminar
	li a7, EXIT
	ecall
	


#TODO
#* Se les da funcion skip(str, char), con el puntero a la cadena y el caracter a saltar
#* Se les pide que implemente skip_spaces(str), que llama a a skip pasando como argumento ' '
#* Prog. Principal: Pedir cadena al usuario. Lllamar a skip_spaces(), imprimir y repetir. Si la cadena introducida es nula se termina
