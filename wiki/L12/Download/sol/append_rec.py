def append_list(l,n):
   #-- Si es el ultimo elemento
   if l.next == 0:
     #-- Crear nodo y enlazarlo
     #-- con la lista
     l.next = Crete(0, n)
   else:
      #-- Añadir el elemento en la sublista
      append_list(l[1:],n)


