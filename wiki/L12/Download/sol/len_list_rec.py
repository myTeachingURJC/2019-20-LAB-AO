def len_list(l):
   if len(l) == 0:
      return 0
   else:
      return 1 + len_list(l[1:])


