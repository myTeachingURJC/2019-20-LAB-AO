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
.macro ASSERT_EQUAL(%reg, %val)
	mv a0, %reg
	li a1, %val
	jal assert_equal
.end_macro

#-----------------------------------------------------
#-- Comparar que dos valores de 64 bits son iguales
#--  Valores izquierdos: son los generados por la funcion
#--  Valores derechos: Son los resultados esperados
#------------------------------------------------------
.macro ASSERT_EQUAL_64(%reg1, %reg0, %w1, %w0)
	mv a0, %reg0
	mv a1, %reg1
	li a2, %w0
	li a3, %w1
	jal assert_equal_64
.end_macro

