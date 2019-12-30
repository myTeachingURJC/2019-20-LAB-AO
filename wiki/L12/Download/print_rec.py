def print_list(l):
   #-- Es una lista vacia?
   if len(l) == 0:  
     #-- Si: terminar
     return

   #-- No es una lista vaica
   else:
     #-- Imprimir el valor
     print(l[0])

     #-- Imprimir la sublista
     print_list(l[1:])
     return


