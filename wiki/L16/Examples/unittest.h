#-----------------------------------------------------------------------
#--- MACROS
#-----------------------------------------------------------------------

#---------------------------------------
#-- Imprimir el titulo de test
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


#-----------------------------------------
#-- Comparar que dos cadenas son iguales
#-- La cadena izquierda es una etiqueta
#-- La cadena derecha es un literal
#-----------------------------------------
.macro ASSERT_STR_EQUAL(%buffer, %str)
	.data
 result: .string %str

	.text
	la a0, %buffer
	la a1, result
	jal assert_str_equal
.end_macro

#----------------------------------------------------
#-- Compara que dos valores sean iguales
#-- El valor izquierdo es el devuelto por la funcion
#--   ES UN REGISTRO
#-- El valor derecho es el valor esperado. Es una
#--   constante
#----------------------------------------------------
.macro ASSERT_EQUAL(%val1, %val2)
	mv a0, %val1
	li a1, %val2
	jal assert_equal
.end_macro

