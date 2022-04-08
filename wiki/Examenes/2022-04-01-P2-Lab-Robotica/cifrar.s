#-- Programa cifrar.s. Cifrar la cadena introducida por el usuario
#-- utilizando el siguiente algoritmo:
#--
#--  1. Inicializar el puntero de cadena (hacia la cadena introducida
##--    por el usuario)
#--  2. Inicializar la clave (valor inicial de 1)
#--  3. Leer el caracter actual
#--  4. Si este caracter es '\n', terminar
#--  5. Sumar la clave al caracter actual
#--  6. Guardar el carácter cifrado en la posición actual
#--  7. Incrementar el puntero de cadena
#--  8. Incrementar la clave en una unidad
#--  9. Repetir desde el punto 3

  	#-- Constantes del Sistema Operativo 
	#-- usadas. Deben estar en este fichero (POR ESPECIFICACIONES)
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv EXIT         10

	#-- Tamaño maximo cadena introducida por el usuario
	.eqv MAX 20
	
	#-- Clave del cifrado
	.eqv K    1  #-- Valor inicial
	.eqv KINC 1  #-- Incremento de la clave
			
	.data
	
#-- Cadena introducida por el usuario
#-- ESPECIFICACION: Debe ser la primera
cad:    .space MAX

#-- Resto de mensaje a imprimir
msg1:   .string "Introduce cadena: "
msg2:   .string "Cadena cifrada: "
	
	.text
	
	#-- Imprimir mensaje
	la a0, msg1
	li a7, PRINT_STRING
	ecall
	
	#-- Pedir cadena al usuario
	la a0, cad
	li a1, MAX
	li a7, READ_STRING
	ecall
	
	#-- Cifrar!!!------
	
	#-- 1. Inicializar el puntero de cadena 
	la a0, cad
	
  	#--  2. Inicializar la clave
	li t0, K

  	#-- BONUS OPTIMIZACIÓN:
	#-- En t2 ponemos el carácter \n para detectar el fin 
  	#-- Esta operación la Hacemos FUERA DEL BUCLE
	#-- para que tarde menos
	li t2, '\n'
	
 bucle:

 	#--  3. Leer el caracter actual
 	#--  t1 = Caracter actual
 	lb t1, 0(a0)
 	
 	 #--  4. Si este caracter es '\n', terminar
 	beq t1, t2, fin
 	
  	#--  5. Sumar la clave al caracter actual
 	add t1,t1,t0  #-- t0 = t0 + K
 	
 	#--  6. Guardar el carácter cifrado en la posición actual
 	sb t1, 0(a0)
 	
 	#--  7. Incrementar el puntero de cadena
 	addi a0,a0,1
 	
 	#--  8. Incrementar la clave 
 	addi t0, t0, KINC
 	
 	#--  9. Repetir desde el punto 3
 	b bucle

	#------------------
	
fin:	
	#-- Imprimir el segundo mensaje
	la a0, msg2
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimir la cadena cifrada
	la a0, cad
	li a7, PRINT_STRING
	ecall
	
	#-- Terminar
	li a7, EXIT
	ecall
