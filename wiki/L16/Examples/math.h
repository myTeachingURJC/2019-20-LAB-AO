#--------------------------------------------------
#-- MACROS
#--------------------------------------------------

.macro MUL_BASIC (%a, %b)
    li a0, %a
    li a1, %b
    jal mul_basic
.end_macro

.macro _MUL (%a, %b)
    li a0, %a
    li a1, %b
    jal _mul
.end_macro

.macro DIV_BASIC(%a, %b)
    li a0, %a
    li a1, %b
    jal div_basic
.end_macro

.macro _DIV(%a, %b)
    li a0, %a
    li a1, %b
    jal _div
.end_macro

.macro SHIFT_LEFT1_64(%val1, %val0, %bit)
    li a0, %val0
    li a1, %val1
    li a2, %bit
    jal shift_left1_64
.end_macro
