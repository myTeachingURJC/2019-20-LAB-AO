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
	jal unittest_sputs_number_base_bin
	jal unittest_sputs_number_base_cuat
	jal unittest_sputs_number_base_oct
	jal unittest_sputs_number_base_hex

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
	BCD_GET_DIGIT_SIZE(2)
	ASSERT_EQUAL(a0, 1)

  	#-- BCD_get_digit_size(4) = 2
	TEST_NAME("2")
	BCD_GET_DIGIT_SIZE(4)
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_digit_size(8) = 3
	TEST_NAME("3")
	BCD_GET_DIGIT_SIZE(8)
	ASSERT_EQUAL(a0, 3)

  	#-- BCD_get_digit_size(16) = 4
	TEST_NAME("4")
	BCD_GET_DIGIT_SIZE(16)
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_digit_size(20) = 0
	TEST_NAME("5")
	BCD_GET_DIGIT_SIZE(20)
	ASSERT_EQUAL(a0, 0)

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_get_number_of_digits:
	STACK16

	TEST_TITTLE("----- BCD_get_number_of_digits()--------\n")

  	#-- BCD_get_number_of_digits(4, 1) = 4
	TEST_NAME("1")
	BCD_GET_NUMBER_OF_DIGITS(4, 1)
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(4, 2) = 2
	TEST_NAME("2")
	BCD_GET_NUMBER_OF_DIGITS(4, 2)
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(4, 3) = 2
	TEST_NAME("3")
	BCD_GET_NUMBER_OF_DIGITS(4, 3)
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(4, 4) = 1
	TEST_NAME("4")
	BCD_GET_NUMBER_OF_DIGITS(4, 4)
	ASSERT_EQUAL(a0, 1)

  	#-- BCD_get_number_of_digits(8, 1) = 8
	TEST_NAME("5")
	BCD_GET_NUMBER_OF_DIGITS(8, 1)
	ASSERT_EQUAL(a0, 8)

  	#-- BCD_get_number_of_digits(8, 2) = 4
	TEST_NAME("6")
	BCD_GET_NUMBER_OF_DIGITS(8, 2)
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(8, 3) = 3
	TEST_NAME("7")
	BCD_GET_NUMBER_OF_DIGITS(8, 3)
	ASSERT_EQUAL(a0, 3)

  	#-- BCD_get_number_of_digits(8, 4) = 2
	TEST_NAME("8")
	BCD_GET_NUMBER_OF_DIGITS(8, 4)
	ASSERT_EQUAL(a0, 2)

  	#-- BCD_get_number_of_digits(16, 1) = 16
	TEST_NAME("9")
	BCD_GET_NUMBER_OF_DIGITS(16, 1)
	ASSERT_EQUAL(a0, 16)

  	#-- BCD_get_number_of_digits(16, 2) = 8
	TEST_NAME("10")
	BCD_GET_NUMBER_OF_DIGITS(16, 2)
	ASSERT_EQUAL(a0, 8)

  	#-- BCD_get_number_of_digits(16, 3) = 6
	TEST_NAME("11")
	BCD_GET_NUMBER_OF_DIGITS(16, 3)
	ASSERT_EQUAL(a0, 6)

  	#-- BCD_get_number_of_digits(16, 4) = 4
	TEST_NAME("12")
	BCD_GET_NUMBER_OF_DIGITS(16, 4)
	ASSERT_EQUAL(a0, 4)

  	#-- BCD_get_number_of_digits(32, 1) = 32
	TEST_NAME("13")
	BCD_GET_NUMBER_OF_DIGITS(32, 1)
	ASSERT_EQUAL(a0, 32)

  	#-- BCD_get_number_of_digits(32, 2) = 16
	TEST_NAME("14")
	BCD_GET_NUMBER_OF_DIGITS(32, 2)
	ASSERT_EQUAL(a0, 16)

  	#-- BCD_get_number_of_digits(32, 3) = 11
	TEST_NAME("15")
	BCD_GET_NUMBER_OF_DIGITS(32, 3)
	ASSERT_EQUAL(a0, 11)

  	#-- BCD_get_number_of_digits(32, 4) = 8
	TEST_NAME("16")
	BCD_GET_NUMBER_OF_DIGITS(32, 4)
	ASSERT_EQUAL(a0, 8)

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_to_ascii:
	STACK16

	TEST_TITTLE("----- BCD_to_ASCII()--------\n")

	#-- BCD_to_ASCII(0) = '0'
	TEST_NAME("1")
	BCD_TO_ASCII(0)
	ASSERT_EQUAL(a0, '0')

	#-- BCD_to_ASCII(1) = '1'
	TEST_NAME("2")
	BCD_TO_ASCII(1)
	ASSERT_EQUAL(a0, '1')

	#-- BCD_to_ASCII(9) = '9'
	TEST_NAME("3")
	BCD_TO_ASCII(9)
	ASSERT_EQUAL(a0, '9')

	#-- BCD_to_ASCII(10) = 'A'
	TEST_NAME("4")
	BCD_TO_ASCII(10)
	ASSERT_EQUAL(a0, 'A')

	#-- BCD_to_ASCII(11) = 'B'
	TEST_NAME("5")
	BCD_TO_ASCII(11)
	ASSERT_EQUAL(a0, 'B')	

	#-- BCD_to_ASCII(15) = 'F'
	TEST_NAME("6")
	BCD_TO_ASCII(15)
	ASSERT_EQUAL(a0, 'F')

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_get_digit_pos:
	STACK16

	TEST_TITTLE("----- BCD_get_digit_pos()--------\n")

	# -- BCD_get_digit_pos(0, 1) = 0
	TEST_NAME("1")
	BCD_GET_DIGIT_POS(0, 1)
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(0, 3) = 0
	TEST_NAME("2")
	BCD_GET_DIGIT_POS(0, 3)
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(0, 4) = 0
	TEST_NAME("3")
	BCD_GET_DIGIT_POS(0, 4)
	ASSERT_EQUAL(a0, 0)

	# -- BCD_get_digit_pos(1, 1) = 1
	TEST_NAME("4")
	BCD_GET_DIGIT_POS(1, 1)
	ASSERT_EQUAL(a0, 1)

	# -- BCD_get_digit_pos(1, 3) = 3
	TEST_NAME("5")
	BCD_GET_DIGIT_POS(1, 3)
	ASSERT_EQUAL(a0, 3)

	# -- BCD_get_digit_pos(1, 4) = 4
	TEST_NAME("6")
	BCD_GET_DIGIT_POS(1, 4)
	ASSERT_EQUAL(a0, 4)

	# -- BCD_get_digit_pos(2, 1) = 2
	TEST_NAME("7")
	BCD_GET_DIGIT_POS(2, 1)
	ASSERT_EQUAL(a0, 2)

	# -- BCD_get_digit_pos(2, 3) = 6
	TEST_NAME("8")
	BCD_GET_DIGIT_POS(2, 3)
	ASSERT_EQUAL(a0, 6)
	
	# -- BCD_get_digit_pos(2, 4) = 8
	TEST_NAME("9")
	BCD_GET_DIGIT_POS(2, 4)
	ASSERT_EQUAL(a0, 8)

	# -- BCD_get_digit_pos(31, 1) = 31
	TEST_NAME("10")
	BCD_GET_DIGIT_POS(31, 1)
	ASSERT_EQUAL(a0, 31)

	# -- BCD_get_digit_pos(10, 3) = 30
	TEST_NAME("11")
	BCD_GET_DIGIT_POS(10, 3)
	ASSERT_EQUAL(a0, 30)

	# -- BCD_get_digit_pos(7, 4) = 28
	TEST_NAME("12")
	BCD_GET_DIGIT_POS(7, 4)
	ASSERT_EQUAL(a0, 28)

	# -- BCD_get_digit_pos(3, 3) = 9
	TEST_NAME("13")
	BCD_GET_DIGIT_POS(3, 3)
	ASSERT_EQUAL(a0, 9)

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_BCD_get_digit:
	STACK16

	TEST_TITTLE("----- BCD_get_digit()--------\n")

	#-- BCD_get_digit(0xCAFEBACA, 7, 4) = 0xC
	TEST_NAME("1")
	BCD_GET_DIGIT(0xCAFEBACA, 7, 4)
	ASSERT_EQUAL(a0, 0xC)

	#-- BCD_get_digit(0xCAFEBACA, 6, 4) = 0xA
	TEST_NAME("2")
	BCD_GET_DIGIT(0xCAFEBACA, 6, 4)
	ASSERT_EQUAL(a0, 0xA)

	#-- BCD_get_digit(0xCAFEBACA, 3, 4) = 0xB
	TEST_NAME("3")
	BCD_GET_DIGIT(0xCAFEBACA, 3, 4)
	ASSERT_EQUAL(a0, 0xB)

	#-- BCD_get_digit(0xCAFEBACA, 0, 4) = 0xA
	TEST_NAME("4")
	BCD_GET_DIGIT(0xCAFEBACA, 0, 4)
	ASSERT_EQUAL(a0, 0xA)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0o31277535312, 10, 3) = 0o3
	TEST_NAME("5")
	BCD_GET_DIGIT(0xCAFEBACA, 10, 3)
	ASSERT_EQUAL(a0, 0x3)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 9, 3) = 0o1	
	TEST_NAME("6")
	BCD_GET_DIGIT(0xCAFEBACA, 9, 3)
	ASSERT_EQUAL(a0, 0x1)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 7, 3) = 0o7
	TEST_NAME("7")
	BCD_GET_DIGIT(0xCAFEBACA, 7, 3)
	ASSERT_EQUAL(a0, 0x7)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 5, 3) = 0o5
	TEST_NAME("8")
	BCD_GET_DIGIT(0xCAFEBACA, 5, 3)
	ASSERT_EQUAL(a0, 0x5)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 3, 3) = 0o5
	TEST_NAME("9")
	BCD_GET_DIGIT(0xCAFEBACA, 3, 3)
	ASSERT_EQUAL(a0, 0x5)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 1, 3) = 0o1
	TEST_NAME("10")
	BCD_GET_DIGIT(0xCAFEBACA, 1, 3)
	ASSERT_EQUAL(a0, 0x1)

	#-- 0xCAFEBACA = 0o31277535312
	#-- BCD_get_digit(0xCAFEBACA, 0, 3) = 0o2
	TEST_NAME("11")
	BCD_GET_DIGIT(0xCAFEBACA, 0, 3)
	ASSERT_EQUAL(a0, 0x2)

	#-- BCD_get_digit(0xDEADBEEF, 31, 1) = 1
	TEST_NAME("12")
	BCD_GET_DIGIT(0xDEADBEEF, 31, 1)
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 29, 1) = 0
	TEST_NAME("13")
	BCD_GET_DIGIT(0xDEADBEEF, 29, 1)
	ASSERT_EQUAL(a0, 0x0)

	#-- BCD_get_digit(0xDEADBEEF, 16, 1) = 1
	TEST_NAME("14")
	BCD_GET_DIGIT(0xDEADBEEF, 16, 1)
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 15, 1) = 1
	TEST_NAME("15")
	BCD_GET_DIGIT(0xDEADBEEF, 15, 1)
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEF, 4, 1) = 0
	TEST_NAME("16")
	BCD_GET_DIGIT(0xDEADBEEF, 4, 1)
	ASSERT_EQUAL(a0, 0x0)

	#-- BCD_get_digit(0xDEADBEEF, 1, 1) = 1
	TEST_NAME("17")
	BCD_GET_DIGIT(0xDEADBEEF, 1, 1)
	ASSERT_EQUAL(a0, 0x1)

	#-- BCD_get_digit(0xDEADBEEE, 0, 1) = 0
	TEST_NAME("18")
	BCD_GET_DIGIT(0xDEADBEEE, 0, 1)
	ASSERT_EQUAL(a0, 0x0)

	UNSTACK16

#-----------------------------

#-----------------------------
unittest_sputs_number_base_bin:
	STACK16

	TEST_TITTLE("----- sputs_number_base()--[BIN]----\n")

	#--  sputs_number_base(buffer, 0x0, 4, 2) --> "0000"
	TEST_NAME("1")
	SPUTS_NUMBER_BASE(buffer, 0x0, 4, 2)
	ASSERT_STR_EQUAL(buffer, "0000")

	#--  sputs_number_base(buffer, 0x1, 4, 2) --> "0001"
	TEST_NAME("2")
	SPUTS_NUMBER_BASE(buffer, 0x1, 4, 2)
	ASSERT_STR_EQUAL(buffer, "0001")

	#--  sputs_number_base(buffer, 0xA, 4, 2) --> "1010"
	TEST_NAME("3")
	SPUTS_NUMBER_BASE(buffer, 0xA, 4, 2)
	ASSERT_STR_EQUAL(buffer, "1010")

	#--  sputs_number_base(buffer, 0xF, 4, 2) --> "1111"
	TEST_NAME("4")
	SPUTS_NUMBER_BASE(buffer, 0xF, 4, 2)
	ASSERT_STR_EQUAL(buffer, "1111")

	#--  sputs_number_base(buffer, 0x00, 8, 2) --> "00000000"
	TEST_NAME("5")
	SPUTS_NUMBER_BASE(buffer, 0x00, 8, 2)
	ASSERT_STR_EQUAL(buffer, "00000000")

	#--  sputs_number_base(buffer, 0x55, 8, 2) --> "01010101"
	TEST_NAME("6")
	SPUTS_NUMBER_BASE(buffer, 0x55, 8, 2)
	ASSERT_STR_EQUAL(buffer, "01010101")

	#--  sputs_number_base(buffer, 0xAA, 8, 2) --> "10101010"
	TEST_NAME("7")
	SPUTS_NUMBER_BASE(buffer, 0xAA, 8, 2)
	ASSERT_STR_EQUAL(buffer, "10101010")

	#--  sputs_number_base(buffer, 0xFF, 8, 2) --> "11111111"
	TEST_NAME("8")
	SPUTS_NUMBER_BASE(buffer, 0xFF, 8, 2)
	ASSERT_STR_EQUAL(buffer, "11111111")

	#--  sputs_number_base(buffer, 0x000, 12, 2) --> "000000000000"
	TEST_NAME("9")
	SPUTS_NUMBER_BASE(buffer, 0x000, 12, 2)
	ASSERT_STR_EQUAL(buffer, "000000000000")

	#--  sputs_number_base(buffer, 0xAAA, 12, 2) --> "101010101010"
	TEST_NAME("10")
	SPUTS_NUMBER_BASE(buffer, 0xAAA, 12, 2)
	ASSERT_STR_EQUAL(buffer, "101010101010")

	#--  sputs_number_base(buffer, 0xFFF, 12, 2) --> "111111111111"
	TEST_NAME("11")
	SPUTS_NUMBER_BASE(buffer, 0xFFF, 12, 2)
	ASSERT_STR_EQUAL(buffer, "111111111111")

	#--  sputs_number_base(buffer, 0x0000, 16, 2) --> "0000000000000000"
	TEST_NAME("12")
	SPUTS_NUMBER_BASE(buffer, 0x0000, 16, 2)
	ASSERT_STR_EQUAL(buffer, "0000000000000000")

	#--  sputs_number_base(buffer, 0x5555, 16, 2) --> "0101010101010101"
	TEST_NAME("13")
	SPUTS_NUMBER_BASE(buffer, 0x5555, 16, 2)
	ASSERT_STR_EQUAL(buffer, "0101010101010101")

	#--  sputs_number_base(buffer, 0xAAAA, 16, 2) --> "1010101010101010"
	TEST_NAME("14")
	SPUTS_NUMBER_BASE(buffer, 0xAAAA, 16, 2)
	ASSERT_STR_EQUAL(buffer, "1010101010101010")

	#--  sputs_number_base(buffer, 0xFFFF, 16, 2) --> "1111111111111111"
	TEST_NAME("15")
	SPUTS_NUMBER_BASE(buffer, 0xFFFF, 16, 2)
	ASSERT_STR_EQUAL(buffer, "1111111111111111")

	#--  sputs_number_base(buffer, 0x00000000, 32, 2) --> "00000000000000000000000000000000"
	TEST_NAME("16")
	SPUTS_NUMBER_BASE(buffer, 0x00000000, 32, 2)
	ASSERT_STR_EQUAL(buffer, "00000000000000000000000000000000")

	#--  sputs_number_base(buffer, 0x55555555, 32, 2) --> "01010101010101010101010101010101"
	TEST_NAME("17")
	SPUTS_NUMBER_BASE(buffer, 0x55555555, 32, 2)
	ASSERT_STR_EQUAL(buffer, "01010101010101010101010101010101")

	#--  sputs_number_base(buffer, 0xAAAAAAAA, 32, 2) --> "10101010101010101010101010101010"
	TEST_NAME("18")
	SPUTS_NUMBER_BASE(buffer, 0xAAAAAAAA, 32, 2)
	ASSERT_STR_EQUAL(buffer, "10101010101010101010101010101010")

	#--  sputs_number_base(buffer, 0xFFFFFFFF, 32, 2) --> "1111111111111111111111111111111"
	TEST_NAME("19")
	SPUTS_NUMBER_BASE(buffer, 0xFFFFFFFF, 32, 2)
	ASSERT_STR_EQUAL(buffer, "11111111111111111111111111111111")

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_sputs_number_base_cuat:
	STACK16

	TEST_TITTLE("----- sputs_number_base()--[CUAT]----\n")

	#--  sputs_number_base(buffer, 0x0, 4, 4) --> "00"
	TEST_NAME("1")
	la a0, buffer
	li a1, 0x0
	li a2, 4
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00")

	#--  sputs_number_base(buffer, 0x1, 4, 4) --> "01"
	TEST_NAME("2")
	la a0, buffer
	li a1, 0x1
	li a2, 4
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "01")

	#--  sputs_number_base(buffer, 0xA, 4, 4) --> "22"
	TEST_NAME("3")
	la a0, buffer
	li a1, 0xA
	li a2, 4
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "22")

	#--  sputs_number_base(buffer, 0xF, 4, 4) --> "33"
	TEST_NAME("4")
	la a0, buffer
	li a1, 0xF
	li a2, 4
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "33")

	#--  sputs_number_base(buffer, 0x00, 8, 4) --> "0000"
	TEST_NAME("5")
	la a0, buffer
	li a1, 0x00
	li a2, 8
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000")

	#--  sputs_number_base(buffer, 0x55, 8, 4) --> "1111"
	TEST_NAME("6")
	la a0, buffer
	li a1, 0x55
	li a2, 8
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1111")

	#--  sputs_number_base(buffer, 0xAA, 8, 4) --> "2222"
	TEST_NAME("7")
	la a0, buffer
	li a1, 0xAA
	li a2, 8
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "2222")

	#--  sputs_number_base(buffer, 0xFF, 8, 4) --> "3333"
	TEST_NAME("8")
	la a0, buffer
	li a1, 0xFF
	li a2, 8
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "3333")

	#--  sputs_number_base(buffer, 0x000, 12, 4) --> "000000"
	TEST_NAME("9")
	la a0, buffer
	li a1, 0x000
	li a2, 12
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "000000")

	#--  sputs_number_base(buffer, 0xAAA, 12, 4) --> "222222"
	TEST_NAME("10")
	la a0, buffer
	li a1, 0xAAA
	li a2, 12
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "222222")

	#--  sputs_number_base(buffer, 0xFFF, 12, 4) --> "333333"
	TEST_NAME("11")
	la a0, buffer
	li a1, 0xFFF
	li a2, 12	
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "333333")

	#--  sputs_number_base(buffer, 0x0000, 16, 4) --> "00000000"
	TEST_NAME("12")
	la a0, buffer
	li a1, 0x0000
	li a2, 16
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00000000")

	#--  sputs_number_base(buffer, 0x5555, 16, 4) --> "11111111"
	TEST_NAME("13")
	la a0, buffer
	li a1, 0x5555
	li a2, 16
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "11111111")

	#--  sputs_number_base(buffer, 0xAAAA, 16, 4) --> "22222222"
	TEST_NAME("14")
	la a0, buffer
	li a1, 0xAAAA
	li a2, 16
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "22222222")

	#--  sputs_number_base(buffer, 0xFFFF, 16, 4) --> "33333333"
	TEST_NAME("15")
	la a0, buffer
	li a1, 0xFFFF
	li a2, 16
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "33333333")

	#--  sputs_number_base(buffer, 0x00000000, 32, 4) --> "0000000000000000"
	TEST_NAME("16")
	la a0, buffer
	li a1, 0x00000000
	li a2, 32
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000000000000000")

	#--  sputs_number_base(buffer, 0x55555555, 32, 4) --> "1111111111111111"
	TEST_NAME("17")
	la a0, buffer
	li a1, 0x55555555
	li a2, 32
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1111111111111111")

	#--  sputs_number_base(buffer, 0xAAAAAAAA, 32, 4) --> "2222222222222222"
	TEST_NAME("18")
	la a0, buffer
	li a1, 0xAAAAAAAA
	li a2, 32
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "2222222222222222")

	#--  sputs_number_base(buffer, 0xFFFFFFFF, 32, 4) --> "3333333333333333"
	TEST_NAME("19")
	la a0, buffer
	li a1, 0xFFFFFFFF
	li a2, 32
	li a3, 4
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "3333333333333333")

	UNSTACK16

#-----------------------------

#-----------------------------
unittest_sputs_number_base_oct:
	STACK16

	TEST_TITTLE("----- sputs_number_base()--[OCT]----\n")

	#--  sputs_number_base(buffer, 0x0, 3, 8) --> "0"
	TEST_NAME("1")
	la a0, buffer
	li a1, 0x0
	li a2, 3
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0")

	#--  sputs_number_base(buffer, 0x1, 3, 8) --> "1"
	TEST_NAME("2")
	la a0, buffer
	li a1, 0x1
	li a2, 3
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1")

	#--  sputs_number_base(buffer, 0x3, 3, 8) --> "3"
	TEST_NAME("3")
	la a0, buffer
	li a1, 0x3
	li a2, 3
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "3")

	#--  sputs_number_base(buffer, 0x7, 3, 8) --> "7"
	TEST_NAME("4")
	la a0, buffer
	li a1, 0x7
	li a2, 3
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "7")

	#--  sputs_number_base(buffer, 0x00, 6, 8) --> "00"
	TEST_NAME("5")
	la a0, buffer
	li a1, 0x00
	li a2, 6
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00")

	#--  sputs_number_base(buffer, 0x55, 6, 8) --> "25"
	TEST_NAME("6")
	la a0, buffer
	li a1, 0x55
	li a2, 6
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "25")

	#--  sputs_number_base(buffer, 0xAA, 6, 8) --> "52"
	TEST_NAME("7")
	la a0, buffer
	li a1, 0xAA
	li a2, 6
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "52")

	#--  sputs_number_base(buffer, 0xFF, 6, 8) --> "77"
	TEST_NAME("8")
	la a0, buffer
	li a1, 0xFF
	li a2, 6
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "77")

	#--  sputs_number_base(buffer, 0x000, 12, 8) --> "000"
	TEST_NAME("9")
	la a0, buffer
	li a1, 0x000
	li a2, 12
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000")

	#--  sputs_number_base(buffer, 0xAAA, 12, 8) --> "1252"
	TEST_NAME("10")
	la a0, buffer
	li a1, 0xAAA
	li a2, 12
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "5252")

	#--  sputs_number_base(buffer, 0xFFF, 12, 8) --> "1777"
	TEST_NAME("11")
	la a0, buffer
	li a1, 0xFFF
	li a2, 12
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "7777")

	#--  sputs_number_base(buffer, 0x0000, 16, 8) --> "000000"
	TEST_NAME("12")
	la a0, buffer
	li a1, 0x0000
	li a2, 16
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "000000")

	#--  sputs_number_base(buffer, 0x5555, 16, 8) --> "125252"
	TEST_NAME("13")
	la a0, buffer
	li a1, 0x5555	
	li a2, 16
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "052525")

	#--  sputs_number_base(buffer, 0xAAAA, 16, 8) --> "525252"
	TEST_NAME("14")
	la a0, buffer
	li a1, 0xAAAA
	li a2, 16
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "125252")

	#--  sputs_number_base(buffer, 0xFFFF, 16, 8) --> "775252"
	TEST_NAME("15")
	la a0, buffer
	li a1, 0xFFFF
	li a2, 16
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "177777")

	#--  sputs_number_base(buffer, 0x00000000, 32, 8) --> "00000000000"
	TEST_NAME("16")
	la a0, buffer
	li a1, 0x00000000
	li a2, 32
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00000000000")

	#--  sputs_number_base(buffer, 0x55555555, 32, 8) --> "12525252525"
	TEST_NAME("17")
	la a0, buffer
	li a1, 0x55555555
	li a2, 32
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "12525252525")

	#--  sputs_number_base(buffer, 0xAAAAAAAA, 32, 8) --> "52525252525"
	TEST_NAME("18")
	la a0, buffer
	li a1, 0xAAAAAAAA
	li a2, 32
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "25252525252")

	#--  sputs_number_base(buffer, 0xFFFFFFFF, 32, 8) --> "77777777777"
	TEST_NAME("19")
	la a0, buffer
	li a1, 0xFFFFFFFF
	li a2, 32
	li a3, 8
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "37777777777")

	UNSTACK16
#-----------------------------

#-----------------------------
unittest_sputs_number_base_hex:
	STACK16

	TEST_TITTLE("----- sputs_number_base()--[HEX]----\n")

	#--  sputs_number_base(buffer, 0x0, 4, 16) --> "0"
	TEST_NAME("1")
	la a0, buffer
	li a1, 0x0
	li a2, 4
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0")

	#--  sputs_number_base(buffer, 0x1, 4, 16) --> "1"
	TEST_NAME("2")
	la a0, buffer
	li a1, 0x1
	li a2, 4
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "1")

	#--  sputs_number_base(buffer, 0xA, 4, 16) --> "A"
	TEST_NAME("3")
	la a0, buffer
	li a1, 0xA
	li a2, 4
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "A")

	#--  sputs_number_base(buffer, 0xF, 4, 16) --> "F"
	TEST_NAME("4")
	la a0, buffer
	li a1, 0xF
	li a2, 4
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "F")

	#--  sputs_number_base(buffer, 0x00, 8, 16) --> "00"
	TEST_NAME("5")
	la a0, buffer
	li a1, 0x00
	li a2, 8
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00")

	#--  sputs_number_base(buffer, 0x55, 8, 16) --> "55"
	TEST_NAME("6")
	la a0, buffer
	li a1, 0x55
	li a2, 8
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "55")
	
	#--  sputs_number_base(buffer, 0xAA, 8, 16) --> "AA"
	TEST_NAME("7")
	la a0, buffer
	li a1, 0xAA
	li a2, 8
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "AA")

	#--  sputs_number_base(buffer, 0xFF, 8, 16) --> "FF"
	TEST_NAME("8")
	la a0, buffer
	li a1, 0xFF
	li a2, 8
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "FF")

	#--  sputs_number_base(buffer, 0x000, 12, 16) --> "000"
	TEST_NAME("9")
	la a0, buffer
	li a1, 0x000
	li a2, 12
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "000")

	#--  sputs_number_base(buffer, 0xAAA, 12, 16) --> "AAA"
	TEST_NAME("10")
	la a0, buffer
	li a1, 0xAAA
	li a2, 12
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "AAA")

	#--  sputs_number_base(buffer, 0xFFF, 12, 16) --> "FFF"
	TEST_NAME("11")
	la a0, buffer
	li a1, 0xFFF
	li a2, 12
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "FFF")

	#--  sputs_number_base(buffer, 0x0000, 16, 16) --> "0000"
	TEST_NAME("12")
	la a0, buffer
	li a1, 0x0000
	li a2, 16
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "0000")

	#--  sputs_number_base(buffer, 0x5555, 16, 16) --> "5555"
	TEST_NAME("13")
	la a0, buffer
	li a1, 0x5555
	li a2, 16
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "5555")

	#--  sputs_number_base(buffer, 0xAAAA, 16, 16) --> "AAAA"
	TEST_NAME("14")
	la a0, buffer
	li a1, 0xAAAA
	li a2, 16
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "AAAA")

	#--  sputs_number_base(buffer, 0xFFFF, 16, 16) --> "FFFF"
	TEST_NAME("15")
	la a0, buffer
	li a1, 0xFFFF
	li a2, 16
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "FFFF")

	#--  sputs_number_base(buffer, 0x00000000, 32, 16) --> "00000000"
	TEST_NAME("16")
	la a0, buffer
	li a1, 0x00000000
	li a2, 32
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "00000000")

	#--  sputs_number_base(buffer, 0x55555555, 32, 16) --> "55555555"
	TEST_NAME("17")
	la a0, buffer
	li a1, 0x55555555
	li a2, 32
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "55555555")

	#--  sputs_number_base(buffer, 0xAAAAAAAA, 32, 16) --> "AAAAAAAA"
	TEST_NAME("18")
	la a0, buffer
	li a1, 0xAAAAAAAA
	li a2, 32
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "AAAAAAAA")

	#--  sputs_number_base(buffer, 0xFFFFFFFF, 32, 16) --> "FFFFFFFF"
	TEST_NAME("19")
	la a0, buffer
	li a1, 0xFFFFFFFF
	li a2, 32
	li a3, 16
	jal sputs_number_base
	ASSERT_STR_EQUAL(buffer, "FFFFFFFF")

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

	