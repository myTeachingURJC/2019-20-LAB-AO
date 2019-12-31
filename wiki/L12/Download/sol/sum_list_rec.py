def sum_list(l):
   if len(l) == 0:
      return 0
   else:
      return l[0] + sum_list(l[1:])

