#-- Solución al ejercicio 5
#-- Programa principal
#-- Contar el número de caracteres 'a' y 'e' que hay en una frase pedida al usuario

	.include "servicios.asm"
	
	#-- Longitud maxima de la cadena
	.eqv MAX 1024
	
	.data
	
msg1:	.string "Introduce una cadena: "
msg2:   .string "Numero de caracteres 'a': "
msg3:   .string "\nNumero de caracteres 'e': "

	#-- Cadena introducida por el usuario
cad:	.space MAX
		
	.text
	
	#-- Imprimir mensaje 1
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Almacenar el puntero a la cadena en s0
	#-- ¡OJO! ESTO ES MUY IMPORTANTE! Hay que almacenarlo en 
	#-- cualquiera de los registros estáticos s0-s11...
	#-- PERO NO PODEMOS USAR LOS TEMPORALES t0-t6
	mv s0, a0
	
	#-- Llamar a la funcion na = count(a0, 'a')
	li a1, 'a'
	jal count
	
	#-- El convenio de uso de registros especifica que tras la ejecucion
	#-- de una subrutina, los registros estáticos s0-s11 deben tener
	#-- el mismo valor que tenian antes de la llamada....
	#-- Sin embargo el valor de los temporales se debe considerar 
	#-- perdido. Por eso hemos almacendo el puntero de la cadena en S0
	
	#-- a0 Contiene el número de 'a'. Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 2
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	#-- Llamar a la función na =  count(a0, 'e')
	mv a0, s0
	li a1, 'e'
	jal count
	
	#-- a0 Contiene el número de 'e'. Lo guardamos en t0
	mv t0, a0
	
	#-- Imprimir mensaje 3
	la a0, msg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cantidad
	mv a0, t0
	li a7, PRINT_INT
	ecall
	
	
	#-- Terminar
	li a7, EXIT
	ecall
	
	
