#-------------------------------------------------------------
#-- Pruebas unitarias de las funciones de la biblioteca math  
#-------------------------------------------------------------
    .include "so.h"
    .include "unittest.h"
    .include "math.h"
    

    .text

    TEST_TITTLE("----- mulsi3() --------\n")

    #------- mulsi3(0, 1) = 0
	TEST_NAME("1")
    MULSI3(0, 1)
	ASSERT_EQUAL(a0, 0)

    #------- mulsi3(1, 0) = 0
	TEST_NAME("2")
    MULSI3(1, 0)
	ASSERT_EQUAL(a0, 0)

    #------- mulsi3(1, 1) = 1
	TEST_NAME("3")
    MULSI3(1, 1)
	ASSERT_EQUAL(a0, 1)

    #------- mulsi3(3, 100) = 300
	TEST_NAME("4")
    MULSI3(3, 100)
	ASSERT_EQUAL(a0, 300)

    #------- mulsi3(200, 100) = 20000
	TEST_NAME("5")
    MULSI3(200, 100)
	ASSERT_EQUAL(a0, 20000)

    #------- mulsi3(256, 256) = 65536
	TEST_NAME("5")
    MULSI3(256, 256)
	ASSERT_EQUAL(a0, 65536)

    #------- mulsi3(1024, 2048) = 2097152
	TEST_NAME("6")
    MULSI3(1024, 2048)
	ASSERT_EQUAL(a0, 2097152)

    #------- mulsi3(0x40000000, 2) = 0x80000000
	TEST_NAME("7")
    MULSI3(0x40000000, 2)
	ASSERT_EQUAL(a0, 0x80000000)


    EXIT

