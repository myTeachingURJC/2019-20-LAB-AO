#----------------------------------------------
#-- Pruebas unitarias de la biblioteca STDIO 
#----------------------------------------------
	.include "so.h"
	.include "stdio.h"
	.include "unittest.h"

	.text
	
	#------- Pruebas de la funcion BCD_get_mask()
	#-- BCD_get_mask(0) = 0
	li a0, 0
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0)
	
	#-- BCD_get_mask(1) = 1
	li a0, 1
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 1)
	
	#-- BCD_get_mask(2) = 0x3
	li a0, 2
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0x3)
	
	#-- BCD_get_mask(3) = 0x7
	li a0, 3
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0x7)
	
	#-- BCD_get_mask(4) = 0xF
	li a0, 4
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)
	
	#-- BCD_get_mask(5) = 0xF
	li a0, 5
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)
	
	#-- BCD_get_mask(255) = 0xF
	li a0, 255
	jal BCD_get_mask
	ASSERT_EQUAL(a0, 0xF)
	
	

	#-- Terminar
	EXIT