
	.globl is_positive_integer
	.text
	
# is_positive_integer
# Subroutine that checks if  first a1 characters in string a0 are ASCII digits (0-9)
# a0: memory address of string with digits
# a1: number of characters in string to check
#     0 - until the end of string or '\n' character
# Returns:
# a0: 0 -> No positive integer
#     1 -> Number of digits in string
#is_positive_integer
#Subrutina que comprueba si los caracteres del string (a0) son dígitos ASCII (0-9)
#a0: Dirección de memoria del string con dígitos
#a1: número de caracteres del inicio del string sobre los que se comprueba si son enteros
#    0 - chequea que todos los caracteres del string son dígitos hasta \n o \0
# Salida
#a0: 0 -> No es entero positivo
#    Número de dígitos en el string 

is_positive_integer:

	li t2, '0'
	li t3, '9'
	beq a1, zero, check_whole_string
	
loop_is_positive_integer:	
	lb t0, 0(a0)
	mv t4, a1 #a1 is not modified to return 
	
	blt t0,t2, no_positive_integer
	bgt t0,t3, no_positive_integer

	addi t4, t4, -1
	addi a0, a0, 1
	bgt t4,zero, loop_is_positive_integer

	mv a0, a1 #return a0 = number of analyzed chars
	b is_positive_integer_end

check_whole_string:

        #inicializar loop
	li t4,'\n'
check_whole_string_loop:	
	lb t0, 0(a0)
	beq t0, t4, positive_integer
	beq t0, zero, positive_integer
	
	blt t0,t2, no_positive_integer
	bgt t0,t3, no_positive_integer

	addi a1, a1, 1 #usado como contador de digitos
	addi a0, a0, 1
	b check_whole_string_loop
	

positive_integer:
	mv a0, a1
	b is_positive_integer_end
				
no_positive_integer:
	# String is containing other things than digits. Return a0=0
	li a0,0
is_positive_integer_end:

	ret
    	