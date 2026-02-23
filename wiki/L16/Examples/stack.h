#--------------------------------------------------
#-- Constantes y macros para el uso de la PILA  
#--------------------------------------------------

#-------------------------------------------------------
#-- Crear una pila de 16 bytes
#-- Espacio para 4 registros (offsets 0 - 8)
#-- La direccion de retorno se guarda en el offset 12
#-------------------------------------------------------
.macro STACK16
  addi sp, sp, -16
  sw ra, 12(sp)
.end_macro

#----------------------------------------
#-- Liberar la pila de 16 bytes
#-- Recuperar la direccion de retorno
#-- RETORNAR DE LA FUNCION!
#----------------------------------------
.macro UNSTACK16
  lw ra, 12(sp)
  addi sp, sp, 16
  ret
.end_macro

#-------------------------------------------------------
#-- Crear una pila de 32 bytes
#-- Espacio para 8 registros (offsets 0 - 24)
#-- La direccion de retorno se guarda en el offset 28
#-------------------------------------------------------
.macro STACK32
  addi sp, sp, -32
  sw ra, 28(sp)
.end_macro

#----------------------------------------
#-- Liberar la pila de 32 bytes
#-- Recuperar la direccion de retorno
#-- RETORNAR DE LA FUNCION!
#----------------------------------------
.macro UNSTACK32
  lw ra, 28(sp)
  addi sp, sp, 32
  ret
.end_macro

#-----------------------------------
#-- Meter en la pila SOLO 1 registro
#--   Se gudarda en offset 0
#-----------------------------------
.macro PUSH1(%reg)
  sw %reg, 0(sp)
.end_macro

#------------------------------------------
#-- Recuperar de la pila SOLO 1 registro
#--   Se recupera del offset 0
#------------------------------------------
.macro POP1(%reg)
  lw %reg, 0(sp)
.end_macro

#----------------------------------------
#-- Meter en la pila 2 registros
#--   Offsets 0 y 4
#----------------------------------------
.macro PUSH2(%reg0, %reg1)
  sw %reg0, 0(sp)
  sw %reg1, 4(sp)
.end_macro

#-----------------------------------------
#-- Sacar de la pila 2 registros
#-- Offsets 0 y 4
#-----------------------------------------
.macro POP2(%reg0, %reg1)
  lw %reg0, 0(sp)
  lw %reg1, 4(sp)
.end_macro

#----------------------------------------
#-- Meter en la pila 3 registros
#--   Offsets 0, 4 y 8
#----------------------------------------
.macro PUSH3(%reg0, %reg1, %reg2)
  sw %reg0, 0(sp)
  sw %reg1, 4(sp)
  sw %reg2, 8(sp)
.end_macro

#-----------------------------------------
#-- Sacar de la pila 3 registros
#-- Offsets 0, 4 y 8
#-----------------------------------------
.macro POP3(%reg0, %reg1, %reg2)
  lw %reg0, 0(sp)
  lw %reg1, 4(sp)
  lw %reg2, 8(sp)
.end_macro

#----------------------------------------
#-- Meter en la pila 4 registros
#--   Offsets 0, 4, 8 y 12
#-- WARNING: Solo es compatible STACK32!
#----------------------------------------
.macro STACK32_PUSH4(%reg0, %reg1, %reg2, %reg3)
  sw %reg0, 0(sp)
  sw %reg1, 4(sp)
  sw %reg2, 8(sp)
  sw %reg3, 12(sp)
.end_macro

#-----------------------------------------
#-- Sacar de la pila 4 registros
#-- Offsets 0, 4, 8 y 12
#-- WARNING: Solo es compatible con STACK32!
#-----------------------------------------
.macro STACK32_POP4(%reg0, %reg1, %reg2, %reg3)
  lw %reg0, 0(sp)
  lw %reg1, 4(sp)
  lw %reg2, 8(sp)
  lw %reg3, 12(sp)
.end_macro

#----------------------------------------
#-- Meter en la pila 5 registros
#--   Offsets 0, 4, 8, 12, 16
#-- WARNING: Solo es compatible STACK32!
#----------------------------------------
.macro STACK32_PUSH5(%reg0, %reg1, %reg2, %reg3, %reg4)
  sw %reg0, 0(sp)
  sw %reg1, 4(sp)
  sw %reg2, 8(sp)
  sw %reg3, 12(sp)
  sw %reg4, 16(sp)
.end_macro

#-----------------------------------------
#-- Sacar de la pila 5 registros
#-- Offsets 0, 4, 8, 12, 16
#-- WARNING: Solo es compatible con STACK32!
#-----------------------------------------
.macro STACK32_POP5(%reg0, %reg1, %reg2, %reg3, %reg4)
  lw %reg0, 0(sp)
  lw %reg1, 4(sp)
  lw %reg2, 8(sp)
  lw %reg3, 12(sp)
  lw %reg4, 16(sp)
.end_macro

#----------------------------------------
#-- Meter en la pila 6 registros
#--   Offsets 0, 4, 8, 12, 16, 20
#-- WARNING: Solo es compatible STACK32!
#----------------------------------------
.macro STACK32_PUSH6(%reg0, %reg1, %reg2, %reg3, %reg4, %reg5)
  sw %reg0, 0(sp)
  sw %reg1, 4(sp)
  sw %reg2, 8(sp)
  sw %reg3, 12(sp)
  sw %reg4, 16(sp)
  sw %reg5, 20(sp)
.end_macro

#-----------------------------------------
#-- Sacar de la pila 6 registros
#-- Offsets 0, 4, 8, 12, 16, 20
#-- WARNING: Solo es compatible con STACK32!
#-----------------------------------------
.macro STACK32_POP6(%reg0, %reg1, %reg2, %reg3, %reg4, %reg5)
  lw %reg0, 0(sp)
  lw %reg1, 4(sp)
  lw %reg2, 8(sp)
  lw %reg3, 12(sp)
  lw %reg4, 16(sp)
  lw %reg5, 20(sp)
.end_macro