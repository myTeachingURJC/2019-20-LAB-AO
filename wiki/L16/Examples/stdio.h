#----------------------------------
#-- MACROS Y DEFINICIONES PARA 
#-- LA BIBLIOTECA STDIO
#----------------------------------

#------------------------ PUTS ---------------------------
#------------------------------------------------
#-- Imprimir cadena cuya direccion esta indicada
#-- en el registro proporcionado
#------------------------------------------------
.macro PUTSR(%reg)
  mv a0, %reg
  jal puts
.end_macro

#----------------------------------------
#-- Se pasa como parametro la etiqueta
#----------------------------------------
.macro PUTSL(%label)
  la a0, %label
  jal puts
.end_macro

#-----------------------------------------------
#-- Se pasa como parametro una cadena LITERAL  
#-----------------------------------------------
.macro PUTSI(%str)
	 .data
msg: .string %str

	.text
	la a0, msg
	jal puts
.end_macro


#---------------------- SPUTS_CHAR ----------------------
.macro SPUTS_CHARI(%buffer, %char)
  la a0, %buffer
  li a1, %char
  jal sputs_char
.end_macro

.macro SPUTS_CHARI(%char)
  li a1, %char
  jal sputs_char
.end_macro


#---------------------- SPUTS ----------------------
.macro SPUTSI(%buffer, %str)
  .data
msg: .string %str
  .text
  la a0, %buffer
  la a1, msg
  jal sputs
.end_macro

.macro SPUTSI(%str)
  .data
msg: .string %str
  .text
  la a1, msg
  jal sputs
.end_macro


#------------------------ BCD_GET_DIGIT_SIZE ------------
.macro BCD_GET_DIGIT_SIZE(%size)
  li a0, %size
	jal BCD_get_digit_size
.end_macro

#------------------------ BCD_GET_NUMBER_OF_DIGITIS ------------
.macro BCD_GET_NUMBER_OF_DIGITS(%num_size, %dig_size) 
  li a0, %num_size
  li a1, %dig_size
  jal BCD_get_number_of_digits
.end_macro  

#------------------------ BCD_to_ASCII(dig) ------------
.macro BCD_TO_ASCII(%dig)
  li a0, %dig
  jal BCD_to_ascii
.end_macro

#------------ BCD_GET_DIGIT_POS(ndig, size) -------------------
.macro BCD_GET_DIGIT_POS(%ndig, %size)
  li a0, %ndig
  li a1, %size
  jal BCD_get_digit_pos
.end_macro

#------------ BCD_GET_DIGIT(value, ndig, dig_size) ------------
.macro BCD_GET_DIGIT(%value, %ndig, %dig_size)
  li a0, %value
  li a1, %ndig
  li a2, %dig_size
  jal BCD_get_digit
.end_macro

#------------ SPUTS_NUMBER_BASE(buffer, num, num_size, base) ------------
.macro SPUTS_NUMBER_BASE(%buffer, %num, %num_size, %base)
  la a0, %buffer
  li a1, %num
  li a2, %num_size
  li a3, %base
  jal sputs_number_base
.end_macro

