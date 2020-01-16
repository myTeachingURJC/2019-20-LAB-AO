#-------------------------------------------
#-- Funcion int procesar()
#--
#-- Pedir cadena al usuario, evaluarla, imprimir el resultado y retornar, devolviendo el valor calculado
#-- Si el usuario introduce la cadena nula, se termina con codigo de error -2
#-- Si hay un error al evaluar, se imprime mensaje de error y se devuelve código -1
#-- 
#-- ENTRADAS:
#--   Ninguna
#--
#-- SALIDAS:
#--  * Si la cadena introducida por el usuario es nula, se retorna el código -2
#--  * Si la evaluacion da un error, se retorna -1
#--  * En caso contrario se devuelve el valor calculado
#-------------------------------------------------------------------

         #-- Codigos de los servicios del Sistema operativo
	.eqv EXIT         10
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv PRINT_INT    1
	
	#-- Codigos de retorno
	.eqv TERMINAR -2
	.eqv ERROR    -1
	
	 #-- Valor máximo de la cadena
	.eqv MAX 100

	 #-- Punto de entrada
	.globl procesar
	
	
	.data
	
	#-- Cadena que se pide al usuario, con la expresion a evaluar
msg1:   .string "\n\nIntroduce expresion a calcular: "
msg2:   .string "Resultado: "
msg_err: .string "Error!\n"
exp:	.space MAX
	
	
	.text
	
procesar:

	#-- Es una funcion intermedia. Necesitamos crear la pila
	#-- para guardar la direccion de retorno
	addi sp, sp, -16
	
	#-- Guardar la direccion de retorno
	sw ra, 12(sp)

	#--- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, exp
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Comprobar si es la cadena vacia
	lb t0, 0(a0)
	li t1, '\n'
	beq t0, t1, cad_nula
	
	#-- Llamar a evaluar
	jal evaluar
	
	#-- comprobar si la hay error o no
	li t0, ERROR
	beq a0, t0, error
	
	#-- Todo ok. a0 contiene el valor de la evaluacion
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir resultado de la evaluacion
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- a0 contiene el valor evaluado
	#-- Retornar
	b fin
	
	
	#-- Error de evaluacion
error:
	la a0, msg_err
	li a7, PRINT_STRING
	ecall 
	
	#-- MEter en a0 el codigo de error
        li a0, ERROR
	b fin
	
	#-- Terminar indicando codigo de retorno de cadena nula	
cad_nula:	

	li a0, TERMINAR
	
fin:	
	#-- Recuperar la direccion de retorno
	lw ra, 12(sp)
	
	#-- Liberar la pila
	addi sp, sp, 16
	ret
	
