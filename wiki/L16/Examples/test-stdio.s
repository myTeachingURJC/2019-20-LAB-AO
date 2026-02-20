#----------------------------------------------
#-- Pruebas unitarias de la biblioteca STDIO 
#----------------------------------------------
	.include "so.h"
	.include "stdio.h"
	.include "unittest.h"
	.include "stack.h"
	.include "test-stdio.h"

	.text
	
	#-----------------------------
	#-- TESTS UNITARIOS
	#-----------------------------
	jal unittest_BCD_get_mask
	jal unittest_BCD_get_digit_pos
	jal unittest_BCD_get_digit



	#-- Terminar
	EXIT
	

#-------------------------------------------
#-- Pruebas unitarias de BCD_get_digit()
#-------------------------------------------
unittest_BCD_get_digit:

	.text
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
	ret

#----------------------------------------------
#-- Pruebas unitarias de BCD_get_digit_pos()
#----------------------------------------------
unittest_BCD_get_digit_pos:

	.text
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

#---------------------------------------
#-- Pruebas unitarias de BCD_get_mask()
#---------------------------------------
unittest_BCD_get_mask:

	.text
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

	