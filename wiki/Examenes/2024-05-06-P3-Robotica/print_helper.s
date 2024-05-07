# funciones de soporte a programa de linea de comandos

	.include "syscalls.asm"
	.globl print_prompt
	.globl print_separator
	.globl print_line_big_number
	.data
	
l_completa:	.string "*****"
l_izda: 	.string "*    "
l_dcha: 	.string "    *"
l_hueco: 	.string "*   *"
l_error:	.string "error"	
				
prompt: 
	.string "numero> "

	.text

# Function that prints a prompt
# No parameters, message to print taken from prompt memory address.

# Subrutina que imprime un prompt de línea de comandos
#a0: Mensaje
#a1: Símbolo del prompt (tipicamente '>' o '#') 		
print_prompt:
	mv a3, a0

	li a0, '\n'
	li a7,11 #PrintChar
	ecall
	
	mv a0, a3
	li a7,PRINT_STRING
	ecall
	
	li a0, ' '
	li a7, 11 #PrintChar
	ecall
	
	ret
	

# print_separator
# Prints an horizontal line (separator) of a0 size with the character in a1
# a0: number of times separator is printed
# a1: character (ASCII) used as separator
# Returns: empty
# Example:
# print_separator a0=20 a1='=' prints
# "====================\n"
print_separator:

	mv t0, a0
print_separator_loop:	
	beq t0, zero, print_separator_end
	
	mv a0, a1
	li a7, 11 #PrintChar
	ecall

	addi t0, t0, -1
	b print_separator_loop
	 
print_separator_end:
	li a0,'\n'
	li a7, 11 #PrintChar
	ecall

	ret
	
# Subrutina imprime numero 

# Párametros
# a0: número a imprimir
# a1: línea a imprimir (de 1 a 5)
# Salida:
# a0: Dirección de memoria con string de 5 caracteres que se corresponden de la linea a1 del número a0 con la representación del número 

print_line_big_number:

	beq a0, zero, cero_grande
	li t1, 1
	beq a0, t1, uno_grande
	li t2, 2
	beq a0, t2, dos_grande
	li t3, 3
	beq a0, t3, tres_grande
	li t4, 4
	beq a0, t4, cuatro_grande
	li t5, 5
	beq a0, t5, cinco_grande
	li t6, 6
	beq a0, t6, seis_grande
	li t0, 7
	beq a0, t0, siete_grande
	li t0, 8
	beq a0, t0, ocho_grande
	li t0, 9
	beq a0, t0, nueve_grande
	
			
cero_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_hueco
	li t3, 3
	beq a1, t3, ret_l_hueco
	li t4, 4 
	beq a1, t4, ret_l_hueco
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
uno_grande:
	li t1, 1
	blt a1, t1, ret_error
	li t0, 5
	bgt a1,t0, ret_error
	b ret_l_dcha

dos_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_dcha
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_izda
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
tres_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_dcha
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_dcha
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
cuatro_grande:
	li t1, 1
	beq a1, t1, ret_l_hueco
	li t2, 2
	beq a1, t2, ret_l_hueco
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_dcha
	li t5, 5
	beq a1, t5, ret_l_dcha
	
	b ret_error
cinco_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_izda
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_dcha
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
seis_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_izda
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_hueco
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
siete_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_dcha
	li t3, 3
	beq a1, t3, ret_l_dcha
	li t4, 4 
	beq a1, t4, ret_l_dcha
	li t5, 5
	beq a1, t5, ret_l_dcha
	
	b ret_error
ocho_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_hueco
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_hueco
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error
nueve_grande:
	li t1, 1
	beq a1, t1, ret_l_completa
	li t2, 2
	beq a1, t2, ret_l_hueco
	li t3, 3
	beq a1, t3, ret_l_completa
	li t4, 4 
	beq a1, t4, ret_l_dcha
	li t5, 5
	beq a1, t5, ret_l_completa
	
	b ret_error

		
ret_l_completa:	
	la a0, l_completa
	b fin
	
ret_l_hueco:
	la a0, l_hueco
	b fin
ret_l_izda:
	la a0, l_izda
	b fin
	
ret_l_dcha:
	la a0, l_dcha
	b fin
ret_error:
	b fin
fin:	ret	
	
	

