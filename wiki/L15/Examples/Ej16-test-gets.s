#-------------------------------------------------------
#--  Prueba de la funcion gets()
#--  Pedir el Login al usuario, y saludarle
#-------------------------------------------------------
	
	#-- Servicios del sistema operativo
	.include "so.h"
	
	
	.data
login:  .string "Login: "
	
	.text
	 
main:
	
	#-- Configurar el modulo E/S de bajo nivel
	jal io_init

	#-- Imprimir una cadena
	la a0, login
	jal puts

    #-- Cerrar la salida de bajo nivel
	jal io_close
	EXIT
	
	
#--------------------------------------------------
#-- puts(cad): Imprimir una cadena en la consola
#--
#-- ENTRADA:
#--   - a0 (cad): Puntero a la cadena a imprimir
#-------------------------------------------------
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
	
	