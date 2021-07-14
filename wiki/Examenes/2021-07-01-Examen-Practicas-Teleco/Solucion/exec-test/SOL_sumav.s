# ------------------------------------------------
# - Funcion sumav(u_x, u_y, v_x, v_y)
# -   w = u + v
# -   Suma de los vectores u y v. Cada vector
# -   tiene dos componentes: x, y 
# -
# - ENTRADAS:
# -  a0: Comp. x del primer vector
# -  a1: Comp. y del primer vector
# -  a2: Comp. x del segundo vector
# -  a3: Comp. y del segundo vector
# - SALIDA:
# -  a0: Comp. x del vector resultado
# -  a1: Comp. y del vector resultado
# -----------------------------------------------

	.globl sumav

	.text
			
sumav:

  # -- Obtener la componente x del vector resultante
  add a0, a0, a2
  
  # -- Obtener la componente y del vector resultante
  add a1, a1, a3
  
  # -- Terminar
  ret

