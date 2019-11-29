def insertLast(cad, car):
  if cad[0] == '\0':
    cad[0] = car
    cad[1] = '\0'
    print(car);
    return
  else:
    print(cad[0])
    insertLast(cad[1:], car)


