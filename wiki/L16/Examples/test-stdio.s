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

	#-- Terminar
	EXIT
	
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

	