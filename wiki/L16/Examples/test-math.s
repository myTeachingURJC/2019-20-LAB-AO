#-------------------------------------------------------------
#-- Pruebas unitarias de las funciones de la biblioteca math  
#-------------------------------------------------------------
    .include "so.h"
    .include "unittest.h"
    .include "math.h"
    .include "stack.h"
    

    .text

    jal unittest_mul_basic
    jal unittest_mul
    jal unittest_mul_II
    jal unittest_div_basic
    jal unittest_div
    jal unittest_shift_left1_64

    EXIT


#-----------------------------------------
unittest_mul_basic:

    STACK16

    TEST_TITTLE("----- MUL_BASIC() --------\n")

    #------- MUL_BASIC(0, 1) = 0
	TEST_NAME("1")
    MUL_BASIC(0, 1)
	ASSERT_EQUAL(a0, 0)

    #------- MUL_BASIC(1, 0) = 0
	TEST_NAME("2")
    MUL_BASIC(1, 0)
	ASSERT_EQUAL(a0, 0)

    #------- MUL_BASIC(1, 1) = 1
	TEST_NAME("3")
    MUL_BASIC(1, 1)
	ASSERT_EQUAL(a0, 1)

    #------- MUL_BASIC(3, 100) = 300
	TEST_NAME("4")
    MUL_BASIC(3, 100)
	ASSERT_EQUAL(a0, 300)

    #------- MUL_BASIC(200, 100) = 20000
	TEST_NAME("5")
    MUL_BASIC(200, 100)
	ASSERT_EQUAL(a0, 20000)

    #------- MUL_BASIC(256, 256) = 65536
	TEST_NAME("5")
    MUL_BASIC(256, 256)
	ASSERT_EQUAL(a0, 65536)

    #------- MUL_BASIC(1024, 2048) = 2097152
	TEST_NAME("6")
    MUL_BASIC(1024, 2048)
	ASSERT_EQUAL(a0, 2097152)

    #------- MUL_BASIC(0x40000000, 2) = 0x80000000
	TEST_NAME("7")
    MUL_BASIC(0x40000000, 2)
	ASSERT_EQUAL(a0, 0x80000000)

    UNSTACK16
#-----------------------------------------

#-----------------------------------------
unittest_mul:

    STACK16

    TEST_TITTLE("----- MUL() I --------\n")

	TEST_NAME("1")
    _MUL(0, 1)
	ASSERT_EQUAL(a0, 0)

	TEST_NAME("2")
    _MUL(1, 0)
	ASSERT_EQUAL(a0, 0)

	TEST_NAME("3")
    _MUL(1, 1)
	ASSERT_EQUAL(a0, 1)

	TEST_NAME("4")
    _MUL(3, 100)
	ASSERT_EQUAL(a0, 300)

	TEST_NAME("5")
    _MUL(200, 100)
	ASSERT_EQUAL(a0, 20000)

	TEST_NAME("5")
    _MUL(256, 256)
	ASSERT_EQUAL(a0, 65536)

	TEST_NAME("6")
    _MUL(1024, 2048)
	ASSERT_EQUAL(a0, 2097152)

	TEST_NAME("7")
    _MUL(0x40000000, 2)
	ASSERT_EQUAL(a0, 0x80000000)

    UNSTACK16
#-----------------------------------------


#----------------------------------------
unittest_mul_II:
    STACK16

    TEST_TITTLE("----- MUL() II--------\n")

    #------- MUL(1, 0) = 0
	TEST_NAME("1")
    _MUL(1, 0)
	ASSERT_EQUAL(a0, 0)

    #------- MUL(0, 1) = 0
	TEST_NAME("2")
    _MUL(0, 1)
	ASSERT_EQUAL(a0, 0)

    #------- MUL(1, 1) = 1
	TEST_NAME("3")
    _MUL(1, 1)
	ASSERT_EQUAL(a0, 1)

    #------- MUL(2, 1) = 2
	TEST_NAME("4")
    _MUL(2, 1)
	ASSERT_EQUAL(a0, 2)

    #------- MUL(1, 2) = 2
	TEST_NAME("5")
    _MUL(1, 2)
	ASSERT_EQUAL(a0, 2)

    #------- MUL(2, 2) = 4
	TEST_NAME("6")
    _MUL(2, 2)
	ASSERT_EQUAL(a0, 4)

    #------- MUL(3, 2) = 6
	TEST_NAME("7")
    _MUL(3, 2)
	ASSERT_EQUAL(a0, 6)

    #------- MUL(3, 3) = 9
    TEST_NAME("8")
    _MUL(3, 3)
	ASSERT_EQUAL(a0, 9)

    #------- MUL(4, 5) = 20
    TEST_NAME("9")
    _MUL(4, 5)
	ASSERT_EQUAL(a0, 20)

    #------- MUL(7, 7) = 49
    TEST_NAME("10")
    _MUL(7, 7)
	ASSERT_EQUAL(a0, 49)

    #------- MUL(15, 10) = 150
    TEST_NAME("11")
    _MUL(15, 10)
	ASSERT_EQUAL(a0, 150)

    #------- MUL(256, 200) = 51200
    TEST_NAME("12")
    _MUL(256, 200)
	ASSERT_EQUAL(a0, 51200)

    #------- MUL(0x1000, 0x2000) = 0x2000000
    TEST_NAME("13")
    _MUL(0x1000, 0x2000)
	ASSERT_EQUAL(a0, 0x2000000)

    #------- MUL(0x40000000, 0x2) = 0x80000000
    TEST_NAME("14")
    _MUL(0x40000000, 0x2)
	ASSERT_EQUAL(a0, 0x80000000)

    UNSTACK16
#----------------------------------------

#----------------------------------------
unittest_div_basic:
    STACK16

    TEST_TITTLE("----- DIV_BASIC() --------\n")

    #------- DIV(2, 1) = 2
	TEST_NAME("1")
    DIV_BASIC(2, 1)
	ASSERT_EQUAL(a0, 2)

    #------ DIV(3, 2) = 1
	TEST_NAME("2")
    DIV_BASIC(3, 2)
	ASSERT_EQUAL(a0, 1)

    #------ DIV(10, 3) = 3
	TEST_NAME("3")
    DIV_BASIC(10, 3)
	ASSERT_EQUAL(a0, 3)

    #------ DIV(100, 40) = 2
	TEST_NAME("4")
    DIV_BASIC(100, 40)
	ASSERT_EQUAL(a0, 2)

    #------ DIV(0x4000, 0x10) = 0x400
	TEST_NAME("5")
    DIV_BASIC(0x4000, 0x10)
	ASSERT_EQUAL(a0, 0x400)

    #------ DIV(12000, 600) = 20
	TEST_NAME("6")
    DIV_BASIC(12000, 600)
	ASSERT_EQUAL(a0, 20)

    UNSTACK16
#----------------------------------------

#----------------------------------------
unittest_div:
    STACK16

    TEST_TITTLE("----- _DIV() --------\n")

    #------- DIV(2, 1) = 2
	TEST_NAME("1")
    _DIV(2, 1)
	ASSERT_EQUAL(a0, 2)

    #------ DIV(3, 2) = 1
	TEST_NAME("2")
    _DIV(3, 2)
	ASSERT_EQUAL(a0, 1)

    #------ DIV(10, 3) = 3
	TEST_NAME("3")
    _DIV(10, 3)
	ASSERT_EQUAL(a0, 3)

    #------ DIV(100, 40) = 2
	TEST_NAME("4")
    _DIV(100, 40)
	ASSERT_EQUAL(a0, 2)

    #------ DIV(0x4000, 0x10) = 0x400
	TEST_NAME("5")
    _DIV(0x4000, 0x10)
	ASSERT_EQUAL(a0, 0x400)

    #------ DIV(12000, 600) = 20
	TEST_NAME("6")
    _DIV(12000, 600)
	ASSERT_EQUAL(a0, 20)

    UNSTACK16
#----------------------------------------

#----------------------------------------
unittest_shift_left1_64:
    STACK16

    TEST_TITTLE("----- SHIFT_LEFT1_64() --------\n")

    #------- SHIFT_LEFT1_64(0x00, 0x00, 1)
	TEST_NAME("1")
    SHIFT_LEFT1_64(0x00, 0x00, 1)
	ASSERT_EQUAL_64(a1, a0, 0x00, 0x01)

    #------- SHIFT_LEFT1_64(0x00, 0x01, 0)
	TEST_NAME("2")
    SHIFT_LEFT1_64(0x00, 0x01, 0)
	ASSERT_EQUAL_64(a1, a0, 0x00, 0x02)

    #------- SHIFT_LEFT1_64(0x00, 0xFFFFFFFF, 0)
	TEST_NAME("3")
    SHIFT_LEFT1_64(0x00, 0xFFFFFFFF, 0)
	ASSERT_EQUAL_64(a1, a0, 0x01, 0xFFFFFFFE)

    #------- SHIFT_LEFT1_64(0x00, 0xFFFFFFFF, 1)
	TEST_NAME("4")
    SHIFT_LEFT1_64(0x00, 0xFFFFFFFF, 1)
	ASSERT_EQUAL_64(a1, a0, 0x01, 0xFFFFFFFF)

    #------- SHIFT_LEFT1_64(0x80000000, 0x80000000, 1)
	TEST_NAME("5")
    SHIFT_LEFT1_64(0x80000000, 0x80000000, 1)
	ASSERT_EQUAL_64(a1, a0, 0x01, 0x01)

    #------- SHIFT_LEFT1_64(0x80000000, 0x80000000, 0)
	TEST_NAME("5")
    SHIFT_LEFT1_64(0x80000000, 0x80000000, 0)
	ASSERT_EQUAL_64(a1, a0, 0x01, 0x00)

    UNSTACK16
#----------------------------------------
