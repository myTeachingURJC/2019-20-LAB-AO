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
	
