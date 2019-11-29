def es_prefijo(a,b):
  if a == "":
    return True
  else:
    if a[0] == b[0] and es_prefijo(a[1:], b[1:]):
      return True
    else:
      return False


