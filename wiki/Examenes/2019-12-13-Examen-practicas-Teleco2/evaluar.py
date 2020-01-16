def atoi(cad):
  if ord(cad[0]) < ord('0') or ord(cad[0]) > ord('9'):
    return -1
  else:
    return ord(cad[0]) - ord('0')

def evaluar(cad):
  #-- Si el primer carácter es ‘\n’ se devuelve error
  if cad[0]=="\n":
    return -1

  #-- Convertir el primer digito a numero (op1)
  op1 = atoi(cad[0])

  #-- Si la conversion falla, se devuelve error
  if op1 == -1:
    return -1

  #-- Si el siguiente carácter es “\n”, la expresion 
  #-- tiene solo un digito: devolvermos su valor
  if cad[1]=="\n":
    return op1;

  #-- Si el segundo carácter NO es '+', se devuelve error
  if cad[1]!='+':
    return -1  #-- Error

  #-- Evaluar la expresion contenida en la subcadena desde el 
  #-- tercer carácter hasta el final, llamando a evaluar(recursivo)
  op2 = evaluar(cad[2:])
    
  #-- si op2 es -1 ha habido un error
  if op2 == -1:
    return -1

  #-- Evaluar la suma del primer digito más el valor de la subcadena
  return op1 + op2 


