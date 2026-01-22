
	#-- Servicios del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_STRING 4

	.data
	
	 # Reserva en el segmento de datos una cadena (cad) con espacio para 10 caracteres
cad:	.space 10  #-- (ESPECIFICACIONES)
prefix: .string "0b"	
	.text

	.global print_bin
#-----------------------------------------------------------------------
#-- print_bin(n): Imprimir en la consola un numero binario de 8 bits
#--
#-- ENTRADAS:
#--   a0 (n): Numero entero
#-- 
#-- SALIDAS:
#--   Ninguna
#------------------------------------------------------------------------
print_bin:

  #-- Como es una funcion intermedia, hay que crear la pila
  #-- para guardar la direccion de retorno
  addi sp, sp, -16
  sw ra, 12(sp)

  #-- Guardar los parametros
  mv t0, a0  #-- a0: numero n
  
  # Imprimir el prefijo "0b"
  la a0, prefix
  li a7, PRINT_STRING
  ecall 
  
  # Llamar a cadbin(cad, n) para obtener la cadena con el numero n convertido a binario
  la a0, cad
  mv a1, t0
  jal cadbin
  
  # Imprimir la cadena cad llamando al servicio PRINT_STRING del sistema operativo
  la a0, cad
  li a7, PRINT_STRING
  ecall
  
  #-- Recuperar direccion de retorno
  #-- y liberar la pila
  lw ra, 12(sp)
  addi sp, sp, 16
  
  # Retornar
  ret
  
  