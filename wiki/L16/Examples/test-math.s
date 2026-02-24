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

#----------------------------------------
unittest_mul:
    STACK16

    TEST_TITTLE("----- MUL() --------\n")

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
