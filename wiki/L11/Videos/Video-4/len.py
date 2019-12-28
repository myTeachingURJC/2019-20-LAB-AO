def len(cad):
  if cad=="":
    print("Cadena nula")
    return 0
  else:
    print("Subcadena: ", cad)
    return 1 + len(cad[1:])

