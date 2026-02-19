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
	

#------------------------------------------------------------------------
#-- BCD_get_digit(value, pos, size)
#--
#--  Obtener el digito BCD que se encuentra en la posicion indicada
#--  del valor dado. 
#--
#-- ENTRADAS:
#--   -value: Valor del que se quieren extraer el digito (32-bits)
#--   -pos: Posicion del digito (0-31)
#--   -size: Tamaño/tipo de digito:
#--      1 : Se trata de un bit
#--      2 : Se trata de un digito cuaternario (0-3)
#--      3 : Se trata de un digito octal (0-7)
#--      4 : Se trata de un digito decimal o hexadecimal
#-----------------------------------------------------------------------
BCD_get_digit:
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
	
