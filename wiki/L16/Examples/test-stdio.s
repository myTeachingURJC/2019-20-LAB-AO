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

	# -- BCD_get_digit_pos(0, 3) = 0
	# -- BCD_get_digit_pos(0, 4) = 0
	# -- BCD_get_digit_pos(1, 1) = 1
	# -- BCD_get_digit_pos(1, 3) = 3
	# -- BCD_get_digit_pos(1, 4) = 4
	# -- BCD_get_digit_pos(2, 1) = 2
	# -- BCD_get_digit_pos(2, 3) = 6
	# -- BCD_get_digit_pos(2, 4) = 8
	# -- BCD_get_digit_pos(31, 1) = 31
	# -- BCD_get_digit_pos(10, 3) = 30
	# -- BCD_get_digit_pos(7, 4) = 28

	#-- Terminar
	EXIT
	

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

	