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

