#-- Valores conocidos para asignar a los registros
	.eqv T_t0, 0xFFFF
	.eqv T_t1, -1
	.eqv T_t2, -2
	.eqv T_t3, -3
	.eqv T_t4, -4
	.eqv T_t5, -5
	.eqv T_t6, -6
	.eqv T_a0, 0xAAAA
	.eqv T_a1, 0x1111
	.eqv T_a2, 0x2222
	.eqv T_a3, 0x3333
	.eqv T_a4, 0x4444
	.eqv T_a5, 0x5555
	.eqv T_a6, 0x6666
	.eqv T_a7, 0x7777
	
	.eqv T_s0, 0xFFFFF
	.eqv T_s1, 0x11111
	.eqv T_s2, 0x22222
	.eqv T_s3, 0x33333
	.eqv T_s4, 0x44444
	.eqv T_s5, 0x55555
	.eqv T_s6, 0x66666
	.eqv T_s7, 0x77777
	.eqv T_s8, 0x88888
	.eqv T_s9, 0x99999
	.eqv T_s10, 0xAAAAA
	.eqv T_s11, 0xBBBBB


#-- Inicializar todos los registros menos a0
.macro init_temp_regs_noa0
  li t0, T_t0
  li t1, T_t1
  li t2, T_t2
  li t3, T_t3
  li t4, T_t4
  li t5, T_t5
  li t6, T_t6
  li a1, T_a1
  li a2, T_a2
  li a3, T_a3
  li a4, T_a4
  li a5, T_a5
  li a6, T_a6
  li a7, T_a7
.end_macro

# -- Inicializar todos los registros menos a0 y a1
.macro init_temp_regs_noa0a1
  li t0, T_t0
  li t1, T_t1
  li t2, T_t2
  li t3, T_t3
  li t4, T_t4
  li t5, T_t5
  li t6, T_t6
  li a2, T_a2
  li a3, T_a3
  li a4, T_a4
  li a5, T_a5
  li a6, T_a6
  li a7, T_a7
.end_macro

# -- Inicializar todos los registros menos a0
.macro init_temp_regs_noa0
  
  #-- Inicializar todos menos a0 y a1
  init_temp_regs_noa0a1
  
  #-- Inicializar a1
  li a1, T_a1
 
.end_macro

.macro init_temp_regs

  #-- Inicializar todos menos a0
  init_temp_regs_noa0  
  
  #-- Inicializar a0 
  li a0, T_a0
  
.end_macro



.macro init_static_regs
  li s0, T_s0
  li s1, T_s1
  li s2, T_s2
  li s3, T_s3
  li s4, T_s4
  li s5, T_s5
  li s6, T_s6
  li s7, T_s7
  li s8, T_s8
  li s9, T_s9
  li s10, T_s10
  li s11, T_s11
.end_macro

# -- Comprobar que los registros estaticos tienen todos
# -- sus valores iniciales (y que no han cambiado)
.macro check_static_regs
  li t0, T_s0
  bne s0, t0, abort
  li t0, T_s1
  bne s1, t0, abort
  li t0, T_s2
  bne s2, t0, abort
  li t0, T_s3
  bne s3, t0, abort
  li t0, T_s4
  bne s4, t0, abort
  li t0, T_s5
  bne s5, t0, abort
  li t0, T_s6
  bne s6, t0, abort
  li t0, T_s7
  bne s7, t0, abort
  li t0, T_s8
  bne s8, t0, abort
  li t0, T_s9
  bne s9, t0, abort
  li t0, T_s10
  bne s10, t0, abort
  li t0, T_s11
  bne s11, t0, abort

  #-- Comprobar sp
  li t0, 0x7FFFEFFC
  bne sp,t0, abort
  b cont
        
abort:   
  #-- Abortar: Violacion del convenio
  print_str("**** VIOLACION DEL CONVENIO!\n")
  #exit(-1)
  b cont2
  
cont:
  print_str("Convenio OK!!\n")
  
cont2:
.end_macro


.macro assert(%reg, %val)
  li t0, %val
  bne %reg, t0, error
  b cont_ok
error:
  print_str("*** ERROR: VALOR INVALIDO\n")
  #exit(-1)
  b cont_fail

cont_ok:
  print_str("OK!!\n")
cont_fail:
.end_macro
