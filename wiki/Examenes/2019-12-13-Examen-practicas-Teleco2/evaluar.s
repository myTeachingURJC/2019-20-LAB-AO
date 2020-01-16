#----------------------------------------------------
#-- SUBRUTINA int evaluar(cad)
#--
#--  Evaluar la cadena, que debe estar compuesta por números
#--  de un solo digito y el caracter + de la suma
#--
#--  Ejemplo de cadenas correctas: "1+2", "1+2+3+4+5+5", "9+0+0+1+2+3"
#--
#--  ENTRADAS:
#--    a0: PUntero a la cadena con la expresion
#--
#-- SALIDAS:
#--    a0: Valor de la expresion
#--        -1 en caso de error
#----------------------------------------------------

	#-- Punto de entrada
	.globl evaluar

	#-- Código de error
	#-- Es valido tanto para lo que devuelve atoi
	#-- como para lo que devuelve evaluar
	.eqv ERROR -1

	.text
	
evaluar:

	#-- Es una funcion intermedia (recursiva) por lo que necesitaremos la pila para
	#-- almacenar la direccion de retorno
	#-- Además, la necesitamos para preservar el valor de algunos registros, ya que
	#-- hay llamadas a subrutinas

	#--- Crear la pila
	addi sp, sp, -16

	#-- Guardar la direccion de retorno
	sw ra, 12(sp)

	#-- Guardar la direccion del primer caracter,
	#-- para no perderlo a0 para no perderlo (puntero al primer caracter)
	sw a0, 0(sp)

	#-- Leer el primer caracter. Es el operando 1 (op1)
	lb t0, 0(a0)
	
	#--  if cad=="\n":
        #--    return -1
	li t1, '\n'
	beq t0, t1, error
	
	#-- Convertir el primer digito a numero (op1)
        #-- op1 = atoi(cad[0])
	mv a0, t0
	jal atoi1
	
	#-- Si la conversion falla, se devuelve error
  	#-- if op1 == -1:
        #     return -1
	li t0, ERROR
	beq a0, t0, error
	
	#-- El primer digito es un numero ok
	#-- Lo preservamos en la pila
	sb a0, 4(sp)
	
	#-- Si el siguiente carácter es “\n”, la expresion 
        #-- tiene solo un digito: devolvermos su valor
        #  if cad[1]=="\n":
        #    return op1;
	
	lw a1, 0(sp)  #-- Recuperar puntero a la expresion
	lb t0, 1(a1)  #-- Leer el segundo caracter
	
	#-- Si es \n, devolver el numero
	li t1, '\n'
	beq t0, t1, fin_op1
	
	#-- Si el segundo carácter NO es '+', se devuelve error
        #  if cad[1]!='+':
        #    return -1  #-- Error
	li t1, '+'
	bne t0, t1, error
	
	#-- Evaluar la expresion contenida en la subcadena desde el 
        #-- tercer carácter hasta el final, llamando a evaluar(recursivo)
        #-- op2 = evaluar(cad[2:])
	addi a0, a1, 2
	
	#-- Llamar a evaluar
	jal evaluar
	
	#-- si op2 es -1 ha habido un error
	# if op2 == -1:
        #   return -1
	li t0, ERROR
	beq a0, t0, error
	
	#-- Evaluar la suma del primer digito más el valor de la subcadena
        #  return op1 + op2 
	
	#-- Metemos en a1 el op1, que estaba en la pila
	lb a1, 4(sp)
	
	#-- Hacemos la suma de op1 + op2
	#-- a0 = a0 + a1
	add a0, a0, a1
	b fin

	#-- Retornar el operando 1 (que ya esta en a0)
fin_op1:	
	b fin
			
        #-- Retornar el codigo de error
error: 
	li a0, ERROR
	b fin
	
fin:

	#-- Recueprar la direcciond e retorno
	lw ra, 12(sp)

	#-- Liberar la pila
	addi sp, sp, 16
	
	ret	
