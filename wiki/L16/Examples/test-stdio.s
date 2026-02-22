#----------------------------------------------
#-- Pruebas unitarias de la biblioteca STDIO 
#----------------------------------------------
	.include "so.h"
	.include "stdio.h"
	.include "unittest.h"
	.include "stack.h"
	.include "test-stdio.h"

	#-- Longitud maxima del buffer de pruebas
	.eqv MAX 256

	.data
	#-- Buffer de prueba para imprimir
buffer: .space MAX

	.text
	
	#-----------------------------
	#-- TESTS UNITARIOS
	#-----------------------------
	jal unittest_sputs_char
	jal unittest_sputs
	jal unittest_BCD_get_digit_size
	jal unittest_BCD_get_number_of_digits
	jal unittest_BCD_get_digit_pos
	jal unittest_BCD_get_digit
	jal unittest_BCD_to_ascii
	jal unittest_sputs_number_base

	jal unittest_BCD_get_mask



	#-- Terminar
	EXIT


#----------------------
unittest_sputs_char:
  #-------------------------------------------
  #-- Pruebas unitarias de sputs_char()
  #-------------------------------------------

	STACK16

	TEST_TITTLE("----- sputs_char()--------\n")

	#------- Impresion de un caracter
	TEST_NAME("1")
	SPUTS_CHARI(buffer, 'A')
	ASSERT_STR_EQUAL(buffer, "A")

	#--------- Impresion de dos caracteres
	TEST_NAME("2")
	SPUTS_CHARI(buffer, 'X')
	SPUTS_CHARI('Y')
	ASSERT_STR_EQUAL(buffer, "XY")

	#---- Impresion de tres caracteres
	TEST_NAME("3")
	SPUTS_CHARI(buffer, '1')
	SPUTS_CHARI('2')
	SPUTS_CHARI('3')
	ASSERT_STR_EQUAL(buffer, "123")

	UNSTACK16
	ret
#----------------------

#----------------------
unittest_sputs:
	#-------------------------------------------
	#-- Pruebas unitarias de sputs()
	#-------------------------------------------
	STACK16

	TEST_TITTLE("----- sputs()--------\n")

	#-- Imprimir una cadena vacia
	TEST_NAME("1")
	SPUTSI(buffer, "")
	ASSERT_STR_EQUAL(buffer, "")

	#-- Imprimir una cadena de un caracter
	TEST_NAME("2")
	SPUTSI(buffer, "A")
	ASSERT_STR_EQUAL(buffer, "A")

	#-- Imprimir una cadena de varios caracteres
	TEST_NAME("3")
	SPUTSI(buffer, "Hola Mundo!")
	ASSERT_STR_EQUAL(buffer, "Hola Mundo!")

	#-- Concatenar dos cadenas
	TEST_NAME("4")
	SPUTSI(buffer, "A")
	SPUTSI("B")
	ASSERT_STR_EQUAL(buffer, "AB")

	#-- Concatenar dos cadenas
	TEST_NAME("5")
	SPUTSI(buffer, "Test1-")
	SPUTSI("Test2")
	ASSERT_STR_EQUAL(buffer, "Test1-Test2")

	#-- Concatenar caracter + cadena
	TEST_NAME("6")
	SPUTS_CHARI(buffer, '*')
	SPUTSI("HOLA")
	ASSERT_STR_EQUAL(buffer, "*HOLA")

	#-- Concatenar cadena + caracter
	TEST_NAME("7")
	SPUTSI(buffer, "HOLA")
	SPUTS_CHARI('*')
	ASSERT_STR_EQUAL(buffer, "HOLA*")

	UNSTACK16
	ret
#----------------------

#-----------------------------
unittest_BCD_get_digit_size:
	STACK16

	TEST_TITTLE("----- BCD_get_digit_size()--------\n")

  	#-- BCD_get_digit_size(2) = 1
	TEST_NAME("1")
	li a0, 2
	jal BCD_get_digit_size
	ASSERT_EQUAL(a0, 1)

  	#-- BCD_get_digit_size(4) = 2
	TEST_NAME("2")
	li a0, 4
	jal BCD_get_digit_size
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_digit_size(8) = 3
	TEST_NAME("3")
	li a0, 8
	jal BCD_get_digit_size
	ASSERT_EQUAL(a0, 3)

  	#-- BCD_get_digit_size(16) = 4
	TEST_NAME("4")
	li a0, 16
	jal BCD_get_digit_size
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_digit_size(20) = 0
	TEST_NAME("5")
	li a0, 20
	jal BCD_get_digit_size
	ASSERT_EQUAL(a0, 0)

	UNSTACK16
	ret
#-----------------------------

#-----------------------------
unittest_BCD_get_number_of_digits:
	STACK16

	TEST_TITTLE("----- BCD_get_number_of_digits()--------\n")

  	#-- BCD_get_number_of_digits(4, 1) = 4
	TEST_NAME("1")
	li a0, 4
	li a1, 1
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(4, 2) = 2
	TEST_NAME("2")
	li a0, 4
	li a1, 2
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(4, 3) = 2
	TEST_NAME("3")
	li a0, 4
	li a1, 3
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(4, 4) = 1
	TEST_NAME("4")
	li a0, 4
	li a1, 4
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 1)

  	#-- BCD_get_number_of_digits(8, 1) = 8
	TEST_NAME("5")
	li a0, 8
	li a1, 1
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 8)

  	#-- BCD_get_number_of_digits(8, 2) = 4
	TEST_NAME("6")
	li a0, 8
	li a1, 2
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(8, 3) = 3
	TEST_NAME("7")
	li a0, 8
	li a1, 3
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 3)

  	#-- BCD_get_number_of_digits(8, 4) = 2
	TEST_NAME("8")
	li a0, 8
	li a1, 4
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(16, 1) = 16
	TEST_NAME("9")
	li a0, 16
	li a1, 1
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 16)

  	#-- BCD_get_number_of_digits(16, 2) = 8
	TEST_NAME("10")
	li a0, 16
	li a1, 2
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 8)

  	#-- BCD_get_number_of_digits(16, 3) = 6
	TEST_NAME("11")
	li a0, 16
	li a1, 3
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 6)

  	#-- BCD_get_number_of_digits(16, 4) = 4
	TEST_NAME("12")
	li a0, 16
	li a1, 4
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(32, 1) = 32
	TEST_NAME("13")
	li a0, 32
	li a1, 1
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 32)

  	#-- BCD_get_number_of_digits(32, 2) = 16
	TEST_NAME("14")
	li a0, 32
	li a1, 2
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 16)

  	#-- BCD_get_number_of_digits(32, 3) = 11
	TEST_NAME("15")
	li a0, 32
	li a1, 3
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 11)

  	#-- BCD_get_number_of_digits(32, 4) = 8
	TEST_NAME("16")
	li a0, 32
	li a1, 4
	jal BCD_get_number_of_digits
	ASSERT_EQUAL(a0, 8)

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_to_ascii:
	STACK16

	TEST_TITTLE("----- BCD_to_ASCII()--------\n")

	#-- BCD_to_ASCII(0) = '0'
	TEST_NAME("1")
	li a0, 0
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, '0')

	#-- BCD_to_ASCII(1) = '1'
	TEST_NAME("2")
	li a0, 1
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, '1')

	#-- BCD_to_ASCII(9) = '9'
	TEST_NAME("3")
	li a0, 9
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, '9')

	#-- BCD_to_ASCII(10) = 'A'
	TEST_NAME("4")
	li a0, 10
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, 'A')

	#-- BCD_to_ASCII(11) = 'B'
	TEST_NAME("5")
	li a0, 11
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, 'B')	

	#-- BCD_to_ASCII(15) = 'F'
	TEST_NAME("6")
	li a0, 15
	jal BCD_to_ascii
	ASSERT_EQUAL(a0, 'F')

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_get_digit_pos:
	STACK16

	TEST_TITTLE("----- BCD_get_digit_pos()--------\n")

	# -- BCD_get_digit_pos(0, 1) = 0
	TEST_NAME("1")
	li a0, 0
	li a1, 1
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(0, 3) = 0
	TEST_NAME("2")
	li a0, 0
	li a1, 3
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(0, 4) = 0
	TEST_NAME("3")
	li a0, 0
	li a1, 4
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(1, 1) = 1
	TEST_NAME("4")
	li a0, 1
	li a1, 1
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 1)

	# -- BCD_get_digit_pos(1, 3) = 3
	TEST_NAME("5")
	li a0, 1
	li a1, 3
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 3)

	# -- BCD_get_digit_pos(1, 4) = 4
	TEST_NAME("6")
	li a0, 1
	li a1, 4
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 4)

	# -- BCD_get_digit_pos(2, 1) = 2
	TEST_NAME("7")
	li a0, 2
	li a1, 1
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 2)

	# -- BCD_get_digit_pos(2, 3) = 6
	TEST_NAME("8")
	li a0, 2
	li a1, 3
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 6)
	
	# -- BCD_get_digit_pos(2, 4) = 8
	TEST_NAME("9")
	li a0, 2
	li a1, 4
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 8)

	# -- BCD_get_digit_pos(31, 1) = 31
	TEST_NAME("10")
	li a0, 31
	li a1, 1
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 31)

	# -- BCD_get_digit_pos(10, 3) = 30
	TEST_NAME("11")
	li a0, 10
	li a1, 3
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 30)

	# -- BCD_get_digit_pos(7, 4) = 28
	TEST_NAME("12")
	li a0, 7
	li a1, 4
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 28)

	# -- BCD_get_digit_pos(3, 3) = 9
	TEST_NAME("13")
	li a0, 3
	li a1, 3
	jal BCD_get_digit_pos
	ASSERT_EQUAL(a0, 9)

	UNSTACK16
	ret
#-----------------------------

#-----------------------------
unittest_BCD_get_digit:
	STACK16

	TEST_TITTLE("----- BCD_get_digit()--------\n")

	#-- BCD_get_digit(0xCAFEBACA, 7, 4) = 0xC
	TEST_NAME("1")
	li a0, 0xCAFEBACA
	li a1, 7
	li a2, 4
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0xC)

	#-- BCD_get_digit(0xCAFEBACA, 6, 4) = 0xA
	TEST_NAME("2")
	li a0, 0xCAFEBACA
	li a1, 6
	li a2, 4
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0xA)

	#-- BCD_get_digit(0xCAFEBACA, 3, 4) = 0xB
	TEST_NAME("3")
	li a0, 0xCAFEBACA
	li a1, 3
	li a2, 4
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0xB)

	#-- BCD_get_digit(0xCAFEBACA, 0, 4) = 0xA
	TEST_NAME("4")
	li a0, 0xCAFEBACA
	li a1, 0
	li a2, 4
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0xA)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0o31277535312, 10, 3) = 0o3
	TEST_NAME("5")
	li a0, 0xCAFEBACA
	li a1, 10
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x3)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 9, 3) = 0o1	
	TEST_NAME("6")
	li a0, 0xCAFEBACA
	li a1, 9
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 7, 3) = 0o7
	TEST_NAME("7")
	li a0, 0xCAFEBACA
	li a1, 7
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x7)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 5, 3) = 0o5
	TEST_NAME("8")
	li a0, 0xCAFEBACA
	li a1, 5
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x5)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 3, 3) = 0o5
	TEST_NAME("9")
	li a0, 0xCAFEBACA
	li a1, 3
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x5)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 1, 3) = 0o1
	TEST_NAME("10")
	li a0, 0xCAFEBACA
	li a1, 1
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 0, 3) = 0o2
	TEST_NAME("11")
	li a0, 0xCAFEBACA
	li a1, 0
	li a2, 3
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x2)

	#-- BCD_get_digit(0xDEADBEEF, 31, 1) = 1
	TEST_NAME("12")
	li a0, 0xDEADBEEF
	li a1, 31
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 29, 1) = 0
	TEST_NAME("13")
	li a0, 0xDEADBEEF
	li a1, 29
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x0)

	#-- BCD_get_digit(0xDEADBEEF, 16, 1) = 1
	TEST_NAME("14")
	li a0, 0xDEADBEEF
	li a1, 16
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 15, 1) = 1
	TEST_NAME("15")
	li a0, 0xDEADBEEF
	li a1, 15
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 4, 1) = 0
	TEST_NAME("16")
	li a0, 0xDEADBEEF
	li a1, 4
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x0)

	#-- BCD_get_digit(0xDEADBEEF, 1, 1) = 1
	TEST_NAME("17")
	li a0, 0xDEADBEEF
	li a1, 1
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEE, 0, 1) = 0
	TEST_NAME("18")
	li a0, 0xDEADBEEE
	li a1, 0
	li a2, 1
	jal BCD_get_digit
	ASSERT_EQUAL(a0, 0x0)

	UNSTACK16

#-----------------------------


#-----------------------------
unittest_sputs_number_base:
	STACK16

	TEST_TITTLE("----- sputs_number_base()--------\n")

	#--  sputs_number_base(buffer, 0x0, 4, 2) --> "0000"
	TEST_NAME("1")
	la a0, buffer
	li a1, 0x0
	li a2, 4
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000")

	#--  sputs_number_base(buffer, 0x1, 4, 2) --> "0001"
	TEST_NAME("2")
	la a0, buffer
	li a1, 0x1
	li a2, 4
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0001")

	#--  sputs_number_base(buffer, 0xA, 4, 2) --> "1010"
	TEST_NAME("3")
	la a0, buffer
	li a1, 0xA
	li a2, 4
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1010")

	#--  sputs_number_base(buffer, 0xF, 4, 2) --> "1111"
	TEST_NAME("4")
	la a0, buffer
	li a1, 0xF
	li a2, 4
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1111")

	#--  sputs_number_base(buffer, 0x00, 8, 2) --> "00000000"
	TEST_NAME("5")
	la a0, buffer
	li a1, 0x00
	li a2, 8
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00000000")

	#--  sputs_number_base(buffer, 0x55, 8, 2) --> "01010101"
	TEST_NAME("6")
	la a0, buffer
	li a1, 0x55
	li a2, 8
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "01010101")

	#--  sputs_number_base(buffer, 0xAA, 8, 2) --> "10101010"
	TEST_NAME("7")
	la a0, buffer
	li a1, 0xAA
	li a2, 8
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "10101010")

	#--  sputs_number_base(buffer, 0xFF, 8, 2) --> "11111111"
	TEST_NAME("8")
	la a0, buffer
	li a1, 0xFF
	li a2, 8
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "11111111")

	#--  sputs_number_base(buffer, 0x000, 12, 2) --> "000000000000"
	TEST_NAME("9")
	la a0, buffer
	li a1, 0x000
	li a2, 12
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "000000000000")

	#--  sputs_number_base(buffer, 0xAAA, 12, 2) --> "101010101010"
	TEST_NAME("10")
	la a0, buffer
	li a1, 0xAAA
	li a2, 12
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "101010101010")

	#--  sputs_number_base(buffer, 0xFFF, 12, 2) --> "111111111111"
	TEST_NAME("11")
	la a0, buffer
	li a1, 0xFFF
	li a2, 12
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "111111111111")

	#--  sputs_number_base(buffer, 0x0000, 16, 2) --> "0000000000000000"
	TEST_NAME("12")
	la a0, buffer
	li a1, 0x0000
	li a2, 16
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000000000000000")

	#--  sputs_number_base(buffer, 0x5555, 16, 2) --> "0101010101010101"
	TEST_NAME("13")
	la a0, buffer
	li a1, 0x5555
	li a2, 16
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0101010101010101")

	#--  sputs_number_base(buffer, 0xAAAA, 16, 2) --> "1010101010101010"
	TEST_NAME("14")
	la a0, buffer
	li a1, 0xAAAA
	li a2, 16
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1010101010101010")

	#--  sputs_number_base(buffer, 0xFFFF, 16, 2) --> "1111111111111111"
	TEST_NAME("15")
	la a0, buffer
	li a1, 0xFFFF
	li a2, 16
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1111111111111111")

	#--  sputs_number_base(buffer, 0x00000000, 32, 2) --> "00000000000000000000000000000000"
	TEST_NAME("16")
	la a0, buffer
	li a1, 0x00000000
	li a2, 32
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00000000000000000000000000000000")

	#--  sputs_number_base(buffer, 0x55555555, 32, 2) --> "01010101010101010101010101010101"
	TEST_NAME("17")
	la a0, buffer
	li a1, 0x55555555
	li a2, 32
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "01010101010101010101010101010101")

	#--  sputs_number_base(buffer, 0xAAAAAAAA, 32, 2) --> "10101010101010101010101010101010"
	TEST_NAME("18")
	la a0, buffer
	li a1, 0xAAAAAAAA
	li a2, 32
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "10101010101010101010101010101010")

	#--  sputs_number_base(buffer, 0xFFFFFFFF, 32, 2) --> "1111111111111111111111111111111"
	TEST_NAME("19")
	la a0, buffer
	li a1, 0xFFFFFFFF
	li a2, 32
	li a3, 2
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "11111111111111111111111111111111")

	# 🚧 TODO 🚧

	UNSTACK16
#-----------------------------


#---------------------------------------
#-- Pruebas unitarias de BCD_get_mask()
#---------------------------------------
unittest_BCD_get_mask:
	STACK16

	TEST_TITTLE("----- BCD_get_mask()--------\n")

	#----------  TEST BCD_get_mask(0) = 0
	TEST_NAME("1")
	li a0, 0
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0)
	
	#---------- TEST BCD_get_mask(1) = 1
	TEST_NAME("2")
	li a0, 1
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 1)
	
	#---------- TEST BCD_get_mask(2) = 0x3
	TEST_NAME("3")	
	li a0, 2
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0x3)
	
	#---------- TEST BCD_get_mask(3) = 0x7
	TEST_NAME("4")
	li a0, 3
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0x7)
	
	#---------- TEST BCD_get_mask(4) = 0xF
	TEST_NAME("5")
	li a0, 4
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)
	
	#---------- TEST BCD_get_mask(5) = 0xF
	TEST_NAME("6")
	li a0, 5
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)
	
	#---------- TEST BCD_get_mask(255) = 0xF
	TEST_NAME("7")
	li a0, 255
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)

	UNSTACK16
	ret

	