#Programa linea de comandos

	.include "syscalls.asm"

	.eqv MAX_COMMAND_SIZE 40


	.data
prompt: .string "numero>"
command:.space MAX_COMMAND_SIZE
error_message_no_integer:
	.string "Formato de entero no reconocido. Reintente.\n'q' para terminar\n"
	.text
	
cli_loop:

	#print prompt
	la a0, prompt
        jal print_prompt
	
	#read command
	la a0, command
	li a1, MAX_COMMAND_SIZE
	li a7, READ_STRING
	ecall
	
	#process if quit is requested
	lb t0, command
	li t1, 'q'
	beq t0, t1, fin
	
	#check input is a positive integer
	la a0, command
	li a1, 0
	jal is_positive_integer
	
	beq a0, zero, no_positive_integer
	#a0 contiene el n�mero de caracteres, llamar a creaci�n de caja con n�mero grande
	
	mv a1, a0 #number of chars
	la a0, command
	jal print_box
		
	b cli_loop

no_positive_integer:

	la a0, error_message_no_integer
	li a7, PRINT_STRING
	ecall
	b cli_loop		
fin:
	#print end message and quit
	li a7, EXIT
	ecall	
	

#Subrutina que imprime en consola el entero recibido en a0 (como string) que tiene una longitud de a1 caracteres
#Lo imprime dentro de una caja con separador superior e inferior y los caracteres con tama�o 5x5
#Entrada
#a0: String con n�mero (no se comprueba que est� correctamente formado)
#a1: N�mero de caracteres
#Salida
#(vacia)

print_box:
	addi sp, sp, -32
	sw ra, 28(sp) #guarda ra en pila
	sw a0, 24(sp) # guarda cadena a imprimir
	sw a1, 20(sp) # guarda numero de caracteres
	# posicion 16 de pila para ancho de linea de separador
	# posicion 12 de pila para iteraciones al imprimir linea
	# posicion 8 de pila para iteraciones de digito
	
	#calcula la anchura de las lineas => guarda en pila (offset - 8)
	li t0, 5
	mul t0,a1,t0
	add t0, t0, a1
	addi t0, t0, 1 
	sw t0, 16(sp)

	#imprime linea cabecera
	mv a0, t0
	li a1, '='
	jal print_separator


### Bucle para imprimir las cinco l�neas correspondientes al d�gito
	li t0, 1 #inicializa a primera linea
	sw t0, 12(sp)
five_lines_loop:

	#imprime primer espacio
	li a0, ' '
	li a7, PRINT_CHAR
	ecall

	#inicializa a primer char
	li t0, 0
	sw t0, 8(sp)
	
	## Bucle para iterar por los diferentes d�gitos
digits_loop:
	lw a1, 12(sp) #t0 contiene la linea a imprimir
	lw a0, 24(sp) #carga cadena a imprimir
	
	lw t1, 8(sp) #carga desplazamiento de cadena
	add t2, a0, t1 #t2 apunta el d�gito a imprimir
	li t3, '0'
	lb t4, 0(t2) # carga el digito a imprimir
	sub t2, t4, t3 #normaliza
	mv a0, t2
	jal print_line_big_number
	#a0 es valor de retorno de print_line_big_number y entrada para esto
	li a7, PRINT_STRING
	ecall

	#imprime separador entre d�gitos (o d�gito en blanco al final)
	li a0, ' '
	li a7, PRINT_CHAR
	ecall
	
	#incrementa el digito a procesar (pasa al siguiente digito) y lo guarda en pila	
	lw t0, 8(sp)
	addi t0, t0, 1
	sw t0, 8(sp)
	
	#compara si hemos llegado al n�mero m�ximo de digitos.
	lw t1, 20(sp) # carga el n�mero de d�gitos
	bne t0, t1, digits_loop	
        ## Fin de bucle para imprimir linea de d�gitos

	# imprime salto de linea
	li a0, '\n'
	li a7, PRINT_CHAR
	ecall

	# incrementa y pasa a siguiente linea
	lw t0, 12(sp)
	addi t0, t0, 1
	sw t0, 12(sp)								
	# comprobar si hemos recorrido ya las cinco lineas
	li t1,6
	blt t0, t1, five_lines_loop		

	#imprime separador del final
	lw a0, 16(sp) # recupera valor de ancho de columnas de pila
	li a1, '='
	jal print_separator
					
	lw ra, 28(sp) # restore RA				
	addi sp, sp, 32

	ret
