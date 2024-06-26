#Programa que determina si un DNI español es correcto

	.eqv PRINT_STRING 4
	.eqv READ_STRING 8
	.eqv EXIT 10

#######################################################################################
	.data
msgInicio:	.string "Bienvenidos a comprobador de DNIs"
msgPrompt:	.string "\nDNI: "
msgCorrecto:	.string "CORRECTO\n"
msgError1:	.string "ERROR DE FORMATO\n"
msgError2:	.string "LETRA DE CONTROL INCORRECTA\n"

#**bloque de datos*******************************
 		.eqv MAX_DNI_BUFFER 20
dniBuffer:	.space MAX_DNI_BUFFER 
	
restoLetraControl:
	.string "TRWAGMYFPDXBNJZSQVHLCKE"
#*********************************************
	
#######################################################################################	
	.text
	
	#mensaje de bienvenida
	la a0, msgInicio
	li a7, PRINT_STRING
	ecall			

#**bloque 1 *******************************************
mainLoop:	
	# Prompt:
	la a0, msgPrompt
	li a7, PRINT_STRING
	ecall
	
	# Lee DNI
	la a0, dniBuffer
	li a1, MAX_DNI_BUFFER
	li a7, READ_STRING
	ecall
	
	#Procesar primer caracter
	# Comprueba comando de salida
	lb t0, 0(a0)
	
	li t1, 'q'
	beq t0, t1, mainExit
#*********************************************
	#descomentado (ejercicio 2)
	jal chequeaFormatoDNI
#**bloque 2*******************************************
	bne a0, zero, imprimeFormatoError	
	# Comprueba si letra de control es correcta
	la a0, dniBuffer
#*********************************************
	jal chequeaLetraControlDNI
#**bloque 3*******************************************
	bne a0, zero, imprimeLetraIncorrecta

	la a0, msgCorrecto
	li a7, PRINT_STRING
	ecall	
			
	b mainLoop

imprimeLetraIncorrecta:
	la a0, msgError2
	li a7, PRINT_STRING
	ecall	
	
	b mainLoop

imprimeFormatoError:
	la a0, msgError1
	li a7, PRINT_STRING
	ecall	
	
	b mainLoop

mainExit:
#*********************************************
	#Terminacion del programa		
	li a7, EXIT
	ecall

#######################################################################################	


# Subrutina que chequea si la letra de control de un DNI es correcta (partiendo de un identificador de DNI correctamente formado)
# Entrada
# a0 : Direccion de memoria que apunta a string (cadena de caracteres) que contiene un DNI con formato correcto
# Salida
# a0 = 0 si es correcto, otro valor si error
chequeaLetraControlDNI:

#**bloque 4*******************************************	

	# manejo de pila 
	addi sp, sp, -16
	sw ra, 12(sp) #guarda registro RA
	sw a0, 8(sp) #guarda direccion de memoria de string de entrada

	li t6, 'X'
	li t5, 'Z'
	li t4, '0'
	#transforma primer caracter (X, Y, Z) en digito
	lb t0, 0(a0) #lee caracter
		#comprueba que es X, Y o Z
	blt t0, t6, chequeaLetraControlCambiado
	bgt t0, t5, chequeaLetraControlCambiado
		#transforma primer caracter
	sub t0,t0,t6
	add t0, t0, t4
	sb t0, 0(a0) #modifica string de entrada

chequeaLetraControlCambiado:

#*********************************************	
	jal string8ToInt #transforma string a int
#**bloque 5*******************************************	
	bne a1,zero,chequeaLetraControlError
	
	#a0 contiene el entero
	li t0, 23
	rem t1, a0, t0 # guarda en t1 el resto de la division
	
	#traduce resto a letra
	la t2, restoLetraControl
	add t2, t2,t1
	
	lb t3, 0(t2) #Obtiene letra que corresponde al digito (guarda en t3)
	
	#lee letra de control de string de entrada
	lw t2, 8(sp)
	lb t4, 8(t2) #lee letra de control de string de entrada
	bne t3, t4, chequeaLetraControlError
	li a0, 0
	b chequeaLetraControlFin

chequeaLetraControlError:
	li a0, 1 #error

chequeaLetraControlFin:
 	lw ra, 12(sp)
 	addi sp, sp, 16		
#*********************************************			
	ret

#######################################################################################	

# Si ejercicio 2 se implementa
# Funcion que chequea que un identificador de DNI tiene un formato correcto.
# El primer caracter puede ser un digito (0-9), X, Y o Z
# Del segundo al octavo puede ser un digito (0-9)
# El noveno caracter tiene que ser alfabetico (A-Z)
# Entrada
# a0. String (cadena de caracteres) con el supuesto identificador de DNI
# Salida
# a0 = 0. formato de DNI correcto. Otro valor, formato no correcto.
#
chequeaFormatoDNI:

#**bloque 5*******************************************	
	li t5, '0'
	li t6, '9'
	li t3, 'X'
	li t4, 'Z'
	
	#comprueba primer caracter
	lb t0, 0(a0)
	blt t0,t5,chequeaFormatoDNIError
	bgt t0,t4,chequeaFormatoDNIError
	bge t0,t3,chequeaFormatoDNI_initLoop
	bgt t0,t6,chequeaFormatoDNIError

chequeaFormatoDNI_initLoop:
	addi a0,a0,1 #mueve puntero a siguiente posicion
	
	#comprueba siete digitos siguienes
	li t1,0
	li t2,7 # fin de bucle
chequeaFormatoDNI_7digits:	
	lb t0, 0(a0)
	blt t0,t5,chequeaFormatoDNIError
	bgt t0,t6,chequeaFormatoDNIError

	addi t1, t1, 1
	addi a0, a0, 1
	blt t1,	t2, chequeaFormatoDNI_7digits	
	
	#comprueba letra de control
	li t2, 'A'
	lb t0, 0(a0)
	blt t0, t2, chequeaFormatoDNIError
	bgt t0, t4, chequeaFormatoDNIError

	#comprueba fin de string
	lb t0, 1(a0)
	beq t0,zero, chequeaFormatoDNIError

	li a0,0 #devuelve valor correcto
	b chequeaFormatoDNIFin
	
chequeaFormatoDNIError:
	li a0,1	
chequeaFormatoDNIFin:	
#*********************************************	
	
	ret

