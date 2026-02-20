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


