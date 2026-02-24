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

