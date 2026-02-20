	.include "stack.h"

#--------------------------------------------------
#-- puts(cad): Imprimir una cadena en la consola
#--
#-- ENTRADA:
#--   - a0 (cad): Puntero a la cadena a imprimir
#-------------------------------------------------
.global puts
puts:
    
    #-- Crear la pila y guardar la direccion de retorno
    addi sp, sp, -16
    sw ra, 12(sp)
    
    #-- Guardar s0
    sw s0, 0(sp)
    
    #-- s0: Puntero a la cadena
    mv s0, a0
    
  puts_next:
    #-- Leer caracter de la memoria
    lb a0, 0(s0)
    
    #-- Si el caracter es '\0', terminar
    beq a0, zero, puts_end
    
    #-- Imprimir caracter actual
    jal putchar
    
    #-- Apuntar al siguiente caracter
    addi s0, s0, 1
    
    #-- Repetir
    j puts_next


  puts_end:
	#-- Recuperar s0
	lw s0, 0(sp)
	
	#-- Recuperar direccion de retorno y liberar pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret
	
#-------------------------------------------------------------
#-- sputs_char(buffer, car): Imprimir un caracter en un buffer
#--
#-- ENTRADA:
#--   - a0 (buffer): Puntero al buffer donde escribir el caracter
#--   - a1 (car): Caracter a escribir
#-- SALIDA:
#--   - a0: Puntero al siguiente byte del buffer
#-------------------------------------------------------------
.global sputs_char
sputs_char:
	#-- Escribir el caracter en el buffer
	sb a1, 0(a0)

	#-- Apuntar a la siguiente posicion
	addi a0, a0, 1

	#-- Escribir un \0
	sb zero, 0(a0)

	#-- Devolver la direccion del final del buffer
	ret


#------------------------------------------------------------------------
#-- BCD_get_digit(value, ndig, size)
#--
#--  Obtener el digito BCD numero ndig dentro del valor value, cuyo 
#--  tamaño en bits se indica con size
#--
#-- ENTRADAS:
#--   -a0 (value): Valor del que se quieren extraer el digito (32-bits)
#--   -a1 (ndig): Numero del digito a extraer (0-31)
#--   -a2 (size): Tamaño/tipo de digito:
#--      1 : Se trata de un bit
#--      2 : Se trata de un digito cuaternario (0-3)
#--      3 : Se trata de un digito octal (0-7)
#--      4 : Se trata de un digito decimal o hexadecimal (0-9, A-F)
#-----------------------------------------------------------------------
.global BCD_get_digit
BCD_get_digit:

	STACK32

	#-- Guardar los registros estaticos usados
	STACK32_PUSH4(s0, s1, s2, s3) 

	#-- Guardar los parametros
	mv s0, a0 #-- value
	mv s1, a1 #-- ndig
	mv s2, a2 #-- size

	#-- Paso 1: generar la máscara para extraer el digito
	#-- s4: Mascara
	mv a0, a2
	jal BCD_get_mask
	mv s3, a0

	#-- Paso 2: Obtener la posicion del digito
	#-- t0: Posicion del digito
	mv a0, s1
	mv a1, s2
	jal BCD_get_digit_pos
	mv t0, a0

	#-- Paso 3: Desplazar la mascara a la izquierda
	sll s3, s3, t0

	#-- Paso 4: Aplicar la mascara al valor original
	mv a0, s0
	and a0, a0, s3

	#-- Paso 5: Desplazar el resultado a la derecha para obtener el digito
	srl a0, a0, t0

	STACK32_POP4(s0, s1, s2, s3) #-- Recuperar los registros estaticos
	UNSTACK32
	ret

#-------------------------------------------------------------
#-- BCD_get_digit_pos(ndig, size)
#--
#--  Obtener la posicion del digito BCD de tamaño size
#--
#-- ENTRADAS:
#--   -a0 (ndig): Numero del digito a extraer (0-31)
#--   -a1 (size): Tamaño/tipo de digito:
#-- SALIDA:
#--   -a0 (pos) Posicion del digito dentro (0-31)
#--------------------------------------------------------------
.global BCD_get_digit_pos
BCD_get_digit_pos:

	#-- La implementacion rapida es multiplicar ndig por size
	#-- return ndig * size

	#-- Pero lo implementamos con sumas porque no disponemos
	#-- de la multiplicacion
	#-- pos = ndig + ndig + ... (size veces)

	#-- resultado parcial
	li t0, 0

	#-- Repetir size veces
  BCD_get_digit_pos_loop:

	#-- ¿Tamaño 0?
	beq a1, zero, BCD_get_digit_pos_end

	#-- Realizar la suma parcial
	add t0, t0, a0

	#-- Decrementar el tamaño
	addi a1, a1, -1

	#-- Repetir
	j BCD_get_digit_pos_loop

  BCD_get_digit_pos_end:
    #-- Devolver la posicion
	mv a0, t0
	ret

#---------------------------------------------
#-- BCD_get_mask(size)
#--
#--   Obtener una mascara de size bits
#--
#-- BCD_get_mask(1) = 0x0000_0001
#-- BCD_get_mask(2) = 0x0000_0011
#-- BCD_get_mask(3) = 0x0000_0111
#-- BCD_get_mask(4) = 0x0000_1111
#--
#--- ENTRADAS:
#--   -a0 (size): Tamaño en bits
#--     -1: Digito binario
#--     -2: Digito cuaternario
#--     -3: Digito octal
#--     -4: Digito decimal/hexa
#--
#--  SALIDA:
#--   - (a0) Mascara
#---------------------------------------------	
.global BCD_get_mask			
BCD_get_mask:

	#-- Limitar el tamaño: Si es menor a 5, OK
	#-- En caso contrario recortar a 4
	li t0, 5
	blt a0, t0, BCD_get_mask_ok
	
	#-- Es mayor a 4, recortar
	li a0, 4
	
  BCD_get_mask_ok:

	#-- Valor inicial de la mascara
	li t0, -1  #-- t0 = 0xFFFF_FFFF
	
	#-- Desplazar tantos bits a la izquierda como indique size
	sll t0, t0, a0
	
	#-- Negar los bits para obtener la mascara final
	xori a0, t0, -1

	ret					
					
	
#-----------------------------------------------------------------
#-- gets(cad): Leer una cadena (cruda) desde el teclado	
#--
#-- ENTRADA:
#--   - a0 (cad): Buffer donde guardar la cadena
#--   - a1 (max): Numero maximo de caracteres para la cadena
#--               (incluyendo el '\n' y '\0' finales)
#--
#-- SALIDA:
#--   - Ninguna
#----------------------------------------------------------------
.global gets
gets:
    #-- Crear la pila y guardar la direccion de retorno
    addi sp, sp, -16
    sw ra, 12(sp)
    
    #-- Salvar registros estaticos usados
    sw s0, 0(sp)
    sw s1, 4(sp)
    
    #-- Guardar el puntero en so
    mv s0, a0
    
    #-- Caso particular
    #-- El tamaño del buffer tiene que ser al menos 1, para
    #-- guardar el \0 final
    li t0, 2
    blt a1, t0, gets_end
    
    #-- Guardar el numero de caracteres (menos uno) en s1
    #-- (Hay que dejar 1 byte para el \0 final)
    addi s1, a1, -1

  gets_next:
	#-- Leer un caracter
	jal getchar
	
	#-- Almacenar el carácter en la posicion actual
	sb a0, 0(s0)
	
	#-- Apuntar a la siguiente posicion
	addi s0, s0, 1
	
	#-- Si el caracter es '\n', hemos terminado
	li t0, '\n'
	beq a0, t0, gets_end
	
	#-- Decrementar contador de caracters
	addi s1, s1, -1
	
	#-- Ya no caben más caracteres: terminar
	beq s1, zero, gets_end
	
	#-- Repetir
	j gets_next
	
	
  gets_end:

	#-- Almacenar el '\0' final
	sb zero, 0(s0)
	
	#-- Recuperar registros estaticos
	lw s0, 0(sp)
	lw s1, 4(sp)

	#-- Recuperar direccion de retorno y liberar pila
	lw ra, 12(sp)
	addi sp, sp, 16
	ret		
	
