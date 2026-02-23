	.include "stack.h"


#------------ puts(cad) --------------------------------------
puts:
	#--------------------------------------------------
	#-- puts(cad): Imprimir una cadena en la consola
	#--
	#-- ENTRADA:
	#--   - a0 (cad): Puntero a la cadena a imprimir
	#-------------------------------------------------
    .global puts

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

#------------ sputs_char(buffer, car) ------------------------
sputs_char:
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

	#-- Escribir el caracter en el buffer
	sb a1, 0(a0)

	#-- Apuntar a la siguiente posicion
	addi a0, a0, 1

	#-- Escribir un \0
	sb zero, 0(a0)

	#-- Devolver la direccion del final del buffer
	ret
#-------------------------------------------------------------

#------------ sputs(buffer, cad) -----------------------------
sputs:
	#-----------------------------------------------------------------
	#-- sputs(buffer, cad): Imprimir una cadena en un buffer
	#-----------------------------------------------------------------
	#-- ENTRADA:
	#--   - a0 (buffer): Puntero al buffer donde escribir la cadena
	#--   - a1 (cad): Puntero a la cadena a escribir
	#-- SALIDA:
	#--   - a0: Puntero al siguiente byte del buffer
	#-----------------------------------------------------------------
	.global sputs

	STACK16
	PUSH1(s1)

	#-- Guardar a1
	mv s1, a1

  sputs_loop:

	#-- Leer caracter actual
	lb a1, 0(s1)

	#-- Si es el caracter final, terminar
	beq a1, zero, sputs_end

	#-- Imprimir el caracter actual en el buffer
	#-- Tambien se imprime el \0 final
	jal sputs_char

	#-- Apuntar al siguiente caracter de la cadena
	addi s1, s1, 1

	#-- Repetir
	j sputs_loop

  sputs_end:

	#-- Terinar con \0
	sb zero, 0(a0)

	POP1(s1)
	UNSTACK16
	ret
#-------------------------------------------------------------

#------------ BCD_get_digit_size(base) -----------------------
BCD_get_digit_size:
  #-----------------------------------------------------------------------
  #-- BCD_get_digit_size(base): 
  #--    Obtener el tamaño en bits de un digito BCD
  #-- 
  #-- ENTRADA:
  #--   - a0 (base): Base de impresion (2, 4, 8, 16)
  #-- SALIDA:
  #--   - a0: Tamaño en bits del digito BCD
  #-----------------------------------------------------------------------
  #-- BCD_get_digit_size(2) = 1
  #-- BCD_get_digit_size(4) = 2
  #-- BCD_get_digit_size(8) = 3
  #-- BCD_get_digit_size(16) = 4
  #-- BCD_get_digit_size(resto) = 0
  .global BCD_get_digit_size

     #-- Tabla de conversion
	 #-- | Base   | Tamaño |
	 #-- |--------|--------|
	 #-- | 2      | 1      |
	 #-- | 4      | 2      |
	 #-- | 8      | 3      |
	 #-- | 16     | 4      |	

	 #-- Si dividimos la base entre 2, la tabla queda asi:
	 #-- | Base/2 | Tamaño |
	 #-- |--------|--------|
	 #-- | 1      | 1      |
	 #-- | 2      | 2      |
	 #-- | 4      | 3      |
	 #-- | 8      | 4      |

	 #-- Tabla de 9 posiciones:
	 #-- | Pos | Base/2 | Tamaño |
	 #-- |-----|--------|--------|
	 #-- | 0   | x      | 0      |
	 #-- | 1   | 1      | 1      |
	 #-- | 2   | 2      | 2      |
	 #-- | 3   | x      | 0      |
	 #-- | 4   | 4      | 3      |
	 #-- | 5   | x      | 0      |
	 #-- | 6   | x      | 0      |
	 #-- | 7   | x      | 0      |
	 #-- | 8   | 8      | 4      |

	.data
  _digit_size_table:
    #-- Pos: 0, 1, 2, 3, 4, 5, 6, 7, 8
	   .byte 0, 1, 2, 0, 3, 0, 0, 0, 4
	.text

	#-- Dividir la base entre 2
	srli a0, a0, 1

	#-- Si base < 9, Leer valor de la tabla
	li t0, 9
	blt a0, t0, _get_from_table

	#-- Es mayor a 8, devolver 0
	li t1, 0
	j BCD_get_digit_size_end

	#-- Leer el valor de la tabla
  _get_from_table:

	#-- Obtener la direccion base
	la t0, _digit_size_table

	#-- Dir = base + offset (a0)
	add t0, t0, a0

	#-- Leer el valor de la tabla
	lbu t1, 0(t0)

  BCD_get_digit_size_end:
    mv a0, t1
	ret

#-------------------------------------------------------------

#------------ BCD_get_number_of_digits(num_size, dig_size) ---
BCD_get_number_of_digits:
  #-----------------------------------------------------------------------
  #-- BCD_get_number_of_digits(num_size, dig_size): 
  #--    Obtener el numero de digitos BCD que se necesitan para representar
  #--    un numero de tamaño num_size con digitos de tamaño dig_size
  #-- 
  #-- ENTRADA:
  #--   - a0 (num_size): Tamaño del numero en bits (8, 16, 32)
  #--   - a1 (dig_size): Tamaño en bits del digito BCD
  #-- SALIDA:
  #--   - a0 (ndig): Numero de digitos BCD necesarios
  #-----------------------------------------------------------------------
  #-- Se calcula haciendo la operacion: ndig = num_size / dig_size
  #-- Pero lo implementamos con restas sucesivas para no usar la division
  #-- BCD_get_number_of_digits(4, 1) = 4
  #-- BCD_get_number_of_digits(4, 2) = 2
  #-- BCD_get_number_of_digits(4, 3) = 2
  #-- BCD_get_number_of_digits(4, 4) = 1
  #-- BCD_get_number_of_digits(8, 1) = 8
  #-- BCD_get_number_of_digits(8, 2) = 4
  #-- BCD_get_number_of_digits(8, 3) = 3
  #-- BCD_get_number_of_digits(8, 4) = 2
  #-- BCD_get_number_of_digits(16, 1) = 16
  #-- BCD_get_number_of_digits(16, 2) = 8
  #-- BCD_get_number_of_digits(16, 3) = 6
  #-- BCD_get_number_of_digits(16, 4) = 4
  #-- BCD_get_number_of_digits(32, 1) = 32
  #-- BCD_get_number_of_digits(32, 2) = 16
  #-- BCD_get_number_of_digits(32, 3) = 11
  #-- BCD_get_number_of_digits(32, 4) = 8
  .global BCD_get_number_of_digits
	
	#-- t0: ndig. Inicialmente 0
	li t0, 0

	#-- Bucle del algoritmo de restas sucesivas
 _BCD_get_number_of_digits_loop:

	#-- Si num_size < dig_size, terminar
	blt a0, a1, _BCD_get_number_of_digits_end

	#-- num_size = num_size - dig_size
	sub a0, a0, a1

	#-- Incrementar ndig
	addi t0, t0, 1

	#-- Repetir
	j _BCD_get_number_of_digits_loop

  _BCD_get_number_of_digits_end:

	#-- Si el resto es 0, terminamos
	beq a0, zero, _BCD_get_number_of_digits_end2

	#-- Si el resto no es 0, necesitamos un digito mas
	addi t0, t0, 1

  _BCD_get_number_of_digits_end2:
	mv a0, t0 #-- Devolver ndig

	ret

#-------------------------------------------------------------

#------------ BCD_get_digit_pos(ndig, size) -------------------
BCD_get_digit_pos:
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
#--------------------------------------------------------------

#------------ BCD_get_digit(value, ndig, dig_size) ------------
BCD_get_digit:
	#------------------------------------------------------------------------
	#-- BCD_get_digit(value, ndig, dig_size)
	#--
	#--  Obtener el digito BCD numero ndig dentro del valor value, cuyo 
	#--  tamaño en bits se indica con size
	#--
	#-- ENTRADAS:
	#--   -a0 (value): Valor del que se quieren extraer el digito (32-bits)
	#--   -a1 (ndig): Numero del digito a extraer (0-31)
	#--   -a2 (dig_size): Tamaño/tipo de digito:
	#--      1 : Se trata de un bit
	#--      2 : Se trata de un digito cuaternario (0-3)
	#--      3 : Se trata de un digito octal (0-7)
	#--      4 : Se trata de un digito decimal o hexadecimal (0-9, A-F)
	#-----------------------------------------------------------------------
	.global BCD_get_digit

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

#--------------------------------------------------------------


#----------------- BCD_set_digit(value, ndig, bcd)
BCD_set_digit:
 #-----------------------------------------------------------------------
 #-- BCD_set_digit(value, ndig, bcd)  
 #--
 #-- Insertar el digito bcd (de 4 bits) en la posicion ndig de value
 #--
 #-- ENTRADAS:
 #--   -a0 (value): Valor inicial
 #--   -a1: (ndig) Numero de digito BCD donde insertar el nuevo valor (7-0)
 #--   -a2: (bcd) Valor bcd (4 bits)
 #--
 #-- SALIDA:
 #--   -a0: Nuevo valor actualizado
 #----------------------------------------------------------------------
 #-- Pruebas:
 #--   BCD_set_digit(0x0, 0, 0xA) --> 0x0000_000A
 #--   BCD_set_digit(0xFFFFFFFF, 0, 0xA) --> 0xFFFFFFFA
 #--   BCD_set_digit(0x00000000, 1, 0x5) --> 0x00000050
 #--   BCD_set_digit(0xCAFEBACA, 1, 0x5) --> 0xCAFEBA5A
 #--   BCD_set_digit(0x00000000, 2, 0xF) --> 0x00000F00
 #--   BCD_set_digit(0xDEADBEEF, 2, 0x0) --> 0xDEADB0EF
 #--   BCD_set_digit(0x00000000, 7, 0xC) --> 0xC0000000
 #--   BCD_set_digit(0xCAFEBACA, 7, 0xB) --> 0xBAFEBACA 
	.global BCD_set_digit

	#-- 1. t0: Mascara de 4 bits para acceder a campo BCD
	li t0, 0xF

	#-- 2. t1: Posicion del campo a actualizar
	#--    pos = ndig * 4  (pos = ndig << 2)
	slli t1, a1, 2

	#-- 3. t0: Mascara posicionada sobre el campo BCD a modificar
	#--   mask << pos
	sll t0, t0, t1

	#-- 4. t0: Máscara negada (para borrar campo BCD actual)
	xori t0, t0, -1  #-- t0 = not t0

	#-- 5. Borrar campo bcd: value = value and t0
	and a0, a0, t0

	#-- 6. Llevar el nuevo valor (bdd) a su posicion
	#--  bcd = bcd << pos
	sll a2, a2, t1

	#-- 7. Añadir el valor bcd: value = value | bcd
	or a0, a0, a2

	#-- Devolver el valor actualizado 
	ret
#-----------------------------------------------------------------------

#------------ BCD_to_ascii(dig) --------------------------------------
BCD_to_ascii:
	#-----------------------------------------------------------------------
	#-- BCD_to_ASCII(dig): Convertir un digito BCD a su representacion ASCII
	#--
	#-- ENTRADA:
	#--   - a0 (dig): Digito BCD a convertir
	#-- SALIDA:
	#--   - a0: Caracter ASCII correspondiente al digito BCD
	#-----------------------------------------------------------------------
	#-- Si el digito es menor o igual a 9, se convierte sumando '0'
	#-- Si el digito es mayor que 9, se convierte sumando 'A' - 10
	#-- BCD_to_ASCII(0) = '0'
	#-- BCD_to_ASCII(1) = '1'
	#-- ...
	#-- BCD_to_ASCII(9) = '9'
	#-- BCD_to_ASCII(10) = 'A'
	#-- BCD_to_ASCII(11) = 'B'
	#-- ...
	#-- BCD_to_ASCII(15) = 'F'
	.global BCD_to_ascii

	li t0, 10
	blt a0, t0, _BCD_to_ASCII_digit

	#-- Es mayor que 9, convertir a letra mayuscula
	addi a0, a0, 0x37  #-- 0x37 = 'A' - 10
	j BCD_to_ASCII_end

 _BCD_to_ASCII_digit:
	#-- Es menor o igual a 9, convertir a numero
	addi a0, a0, '0'

 BCD_to_ASCII_end:
	ret	

#--------------------------------------------------------------------

#------------- sputs_number_base--------------------------------------
sputs_number_base:
	#---------------------------------------------------------------------------
	#-- sputs_number_base(buffer, num, num_size, base): 
	#--   Imprimir un numero en un buffer. El numero tiene el tamaño size 
	#--   Se impreme en la base indicada, que debe ser potencia de dos:
	#--     - base = 2: Binario
	#--     - base = 4: Cuaternario
	#--     - base = 8: Octal
	#--     - base = 16: Hexadecimal
	#--
	#-- ENTRADA:
	#--   - a0 (buffer): Puntero al buffer donde escribir el numero
	#--   - a1 (num): Numero a imprimir
	#--   - a2 (num_size): Tamaño del numero en bits (8, 16, 32)
	#--   - a3 (base): Base de impresion (2, 4, 8, 16)
	#-- SALIDA:
	#--   - a0: Puntero al siguiente byte del buffer
	#---------------------------------------------------------------------------
	.global sputs_number_base

	STACK32
	STACK32_PUSH6(s0, s1, s2, s3, s4, s5)

	#-- Guardar los parametros
	mv s0, a0 #-- buffer
	mv s1, a1 #-- num
	mv s2, a2 #-- num_size
	mv s3, a3 #-- base

	#-- Obtener el tamaño de los digitos
	#-- a partir de la base
	#-- s4: dig_size
	mv a0, s3
	jal BCD_get_digit_size
	mv s4, a0 

	#-- Numero de digitos: ndig = num_size / dig_size
	#-- Lo calculamos con una funcion especifica, para
	#-- no usar la division
	#-- s5: ndig
	mv a0, s2
	mv a1, s4
	jal BCD_get_number_of_digits
	mv s5, a0 

	#-- Hay ndig digititos, desde el 0 al ndig-1
	#-- El ditito de mayor peso es ndig-1
	#-- s5 = ndig: Numero de digito actual (empezando por el de mayor peso)
	addi s5, s5, -1

	#------ Bucle: repetirlo para cada digito, empezando por el de mayor peso
 sputs_number_base_loop:
	#-- Obtener el digito BCD actual
	mv a0, s1 #-- num
	mv a1, s5 #-- ndig
	mv a2, s4 #-- dig_size
	jal BCD_get_digit

	#-- Convertir el digito a su representacion ASCII
	jal BCD_to_ascii
	mv t0, a0 #-- t0: Caracter ASCII del digito actual

	#-- Imprimir el digito en el buffer
	mv a0, s0 #-- buffer
	mv a1, t0 #-- caracter ASCII del digito
	jal sputs_char
	mv s0, a0 #-- Actualizar el puntero del buffer

	#-- Si ndig es 0, hemos terminado
	beq s5, zero, sputs_number_base_end

	#-- ndig = ndig - 1
	addi s5, s5, -1

	#-- Repetir
	j sputs_number_base_loop


 sputs_number_base_end:

	STACK32_POP6(s0, s1, s2, s3, s4, s5)
	UNSTACK32

#--------------------------------------------------------------------


#--------------- uint_buffer_init ---------------------------
	.data

	#-- Buffer para implementar el algoritmo Doubble Dabble
 uint_buffer: 
	.word 0 #-- Parte baja del buffer (Contiene el numero inicial)
	.word 0 #-- Parte media (Contiene los digitos BCD 7-0)
	.word 0 #-- Parte alta (Contiene los digitos BCD 9-8)

	.text
uint_buffer_init:
 #-------------------------------------------------------------
 #-- uint_buffer_init(): 
 #--
 #--  Inicializar el buffer del algoritmo Doubble Dabble
 #--  
 #--     Alta    Media    Baja
 #--  |   0    |    0   |  n  |
 #--
 #-- ENTRADA:
 #--   - a0 (n): Numero a imprimir
 #-------------------------------------------------------------
	la t0, uint_buffer
	sw a0, 0(t0) #-- Parte baja
	sw zero, 4(t0) #-- Parte media
	sw zero, 8(t0) #-- Parte alta
	ret
#---------------------------------------------------------------


#--------------- uint_buffer_shift_left ---------------------------
uint_buffer_shift3_left:
 #-------------------------------------------------------------
 #-- uint_buffer_shift_left(shift)
 #--   Desplazar el uint_buffer 3 bits a la izquierda
 #--
 #-------------------------------------------------------------
 	.global uint_buffer_shift3_left

	#-- Obtener el uint_buffer
	#-- t2, t1, t0: Parte alta, media y baja
	la t3, uint_buffer
	lw t0, 0(t3)
	lw t1, 4(t3)
	lw t2, 8(t3)

	#-------- t2 <-- t1 <-- t0

	#-- t2 << 3
    slli t2, t2, 3

	#-- Leer 3 bits de mayor peso de t1
	lui a0, 0xE0000
	and a1, t1, a0

	#-- Moverlos a la parte baja
	srli a1, a1, 29

	#-- Poner esos bits en t2
	or t2, t2, a1

	#-- t1 << 3
	slli t1, t1, 3

	#-- Leer 3 bits de mayor peso de t0
	and a0, t0, a0

	#-- Moverlos a la parte baja
	srli a0, a0, 29

	#-- Poner esos bits en t1
	or t1, t1, a0

	#-- t0 << 3
	slli t0, t0, 3

	#-- Actualizar el uint_buffer
	sw t0, 0(t3)
	sw t1, 4(t3)
	sw t2, 8(t3)

	ret
#----------------------------------------------

#----------------- uint_buffer_update()
uint_buffer_update:
 #-----------------------------------------------------------------
 #-- uint_buffer_update()
 #--
 #--   Actualizar todos los digitos BCD del registro uint_buffer
 #-----------------------------------------------------------------
	.global uint_buffer_update

	STACK16

	#-- Obtener los digitos BCD del uint_buffer
	#-- t2, t1: Parte alta y media
	la t3, uint_buffer
	lw t1, 4(t3)
	lw t2, 8(t3)

	#-- t4: ndig = 7
	li t4, 7

	#-- Obtener digito bcd actual
	mv a0, t2  #-- value
	mv a1, t4  #-- ndig
	li a2, 4   #-- dig_size
	jal BCD_get_digit

	#-- a0 = digito BCD
	#-- Si a0 > 4, a0 = a0 + 3
	li t5, 4
	ble a0, t5, uint_buffer_update_cont

	#-- Sumar 3
	addi a0, a0, 3

 uint_buffer_update_cont:

	#-- Actualizar el digito bcd
	#-- TODO

	#-- Actualizar el uint_buffer
	sw t1, 4(t3)
	sw t2, 8(t3)

	UNSTACK16
#----------------------------------------------

#------------- sputs_uint(buffer, num, num_size) --------------------
sputs_uint:
 #--------------------------------------------------------------
 #-- sputs_uint(buffer, num, num_size):
 #--   Imprimir un numero sin signo en un buffer. 
 #--   El numero tiene el tamaño num_size
 #--
 #-- ENTRADA:
 #--   - a0 (buffer): Puntero al buffer donde escribir el numero
 #--   - a1 (num): Numero a imprimir
 #--   - a2 (num_size): Tamaño del numero en bits (8, 16, 32)
 #-- SALIDA:
 #--   - a0: Puntero al siguiente byte del buffer
 #--------------------------------------------------------------
 #-- Algoritmo Doubble Dabble
 #-- https://en.wikipedia.org/wiki/Double_dabble
 #--------------------------------------------------------------
 #-- Registro de calculo para hacer los desplazamientos:
 #
 #  -Parte alta
 #    31                                              8 | 7    4 | 3       0
 #  +------------------------------------------------------------------------+
 #  |                                                   |   Dig9 |   Dig8    |
 #  |                                                   | 0 0 0 0|  0 0 0 0  |
 #  +------------------------------------------------------------------------+
 #
 #  -Parte media:
 #   31   28| 27   24|23    20| 19  16 | 15   12 | 11    8| 7      4| 3     0
 #  +------------------------------------------------------------------------+
 #  |  Dig7 |  Dig6  |  Dig5  | Dig 4  |  Dig3   | Dig2   |  Dig1   |  Dig0  |
 #  |0 0 0 0| 0 0 0 0| 0 0 0 0| 0 0 0 0| 0 0 0 0 | 0 0 0 0| 0 0 0 0 | 0 0 0 0|
 #  +------------------------------------------------------------------------+
 #
 #  -Parte baja:
 #   31                                                                     0
 #  +------------------------------------------------------------------------+
 #  |      n                                                                 |
 #  |  d31 - d0                                                              |
 #  +------------------------------------------------------------------------+
	.global sputs_uint

	STACK16

	#-- Inicializar registro uint_buffer
	jal uint_buffer_init

	#-- Desplazar el uint_buffer 3 bits a la izquierda
	jal uint_buffer_shift3_left

	#-- Bucle principal del algoritmo
	#-- Hay que hacer un total de 32 desplazamiento
	#-- Como ya se han hecho 3, quedan 29
	
	#-- TODO: Inicializar contador a 29

 sputs_uint_loop:
	
	#-- Actualizar registro uint_buffer
	#-- Hay que sumar 3 a cada digito BCD, si es > 4
	jal uint_buffer_update

	#-- Desplazar 1 bit a la izquierda registro uint_buffer
	#-- uint_buffer << 1

	#-- Queda un paso menos por hacer del algoritmo
	#-- Decrementar contador

	#-- Repetir si contador mayor a 0

	#-- La parte alta y media del registro uint_buffer contiene los digitos
	#-- BCD del numero en decimal


	UNSTACK16
#---------------------------------------------------------------------




#------------ BCD_get_mask(size) ------------------------------------
BCD_get_mask:
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
#----------------------------------------- 



#-------- gets(cad) ------------------ 
gets:
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
	
