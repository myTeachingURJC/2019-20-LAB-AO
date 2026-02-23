#-----------------------------------------------------------------------
#--- MACROS
#-----------------------------------------------------------------------

#---------------------------------------
#-- Imprimir el titulo de testo
#---------------------------------------
.macro TEST_TITTLE(%test_tittle)
	.data
 tittle: .string %test_tittle

	.text
	la a0, tittle
	jal puts
.end_macro

#----------------------------------------
#-- Imprimir el mensaje del test actual 
#-- "TEST %test_num...."
#----------------------------------------
.macro TEST_NAME(%test_num)
   .data
 test_name: .ascii "> TEST "
            .ascii %test_num
			.string "...."
   .text
       la a0, test_name
	   jal puts 
.end_macro
