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