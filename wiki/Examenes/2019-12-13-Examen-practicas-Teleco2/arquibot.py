#!/usr/bin/python3

import os
import sys
import subprocess

DIR = "Correcciones/examen_ac.13122019"
WORK = os.getcwd()

if __name__ == '__main__':

  #-- Ejecutar reset en la consola
  subprocess.run("reset")

  print("Arquibot!")
  print("Directorio actual: ",WORK)
  print("Entrando en directorio:", DIR)

  #-- Cambiar al directorio donde estan las practicas
  try:
    os.chdir(DIR)
  except OSError:
    print("--> No se puede entrar!!!")
    sys.exit()

  #-- Leer todos las carpetas que hay
  pc_names = os.listdir('.')
  
  print()
  print(">Hay: {} practicas pendientes".format(len(pc_names)))
  #for f in pc_names:
  #  print(f)

  #--- Entrando en la primera
  pc = pc_names[0]
  print(">PC: {}".format(pc))
  os.chdir(pc);  

  #-- El fichero debe ser el login
  dir = os.listdir('.')
  login = os.listdir('.')[0]
  print(">Usuario: {}".format(login))
  os.chdir(login)

  print(">Ficheros entregados: ")
  subprocess.run(["ls"])

  subprocess.run(["head", "-n 4","main.s"])

  #-- Ejecutar test-1
  print("")
  print("TEST-1:")
  subprocess.run(["java", "-jar", "../../../../rars1_4.jar", "1000", "../../../../TEST-atoi1.s", "atoi1.s", "../../../../servicios.asm"])


  print("""
----- SOLUCION:
* atoi1(0) = 0 --> OK
* atoi1(5) = 5 --> OK
* atoi1(9) = 9 --> OK
* atoi1(A) = -1 --> OK
* atoi1(/) = -1 --> OK
* atoi1(:) = -1 --> OK
""")

  input("Pulsa ENTER para continuar....")

  #-- Ejecutar test-2
  print()
  print("TEST-2:")
  subprocess.run(["java", "-jar", "../../../../rars1_4.jar", "1000", "../../../../TEST-evaluar.s", "evaluar.s", "../../../../servicios.asm", "../../../../atoi1.s"])

  print("""--- SOLUCION: 
1+1
--> Resultado: 2 --> OK

1+2+3+4+5+6+7+8+9+0+0+0+0+0+0+0
--> Resultado: 45 --> OK

3
--> Resultado: 3 --> OK

hola
--> Resultado: -1 --> OK

1+
--> Resultado: -1 --> OK

1 2+4
--> Resultado: -1 --> OK


Program terminated by calling exit
""")

  input("Pulsa ENTER para continuar....")


  #-- Ejecutar test-3
  print("")
  print("TEST-3:")

  input_data = """1+2
0+0+0
+5
 a

""".encode('utf-8')

  subprocess.run(["java", "-jar", "../../../../rars1_4.jar", "1000", "../../../../TEST-procesar.s", "../../../../evaluar.s", "../../../../atoi1.s", "../../../../servicios.asm", "procesar.s"], input=input_data)


  print("""--SOLUCION
Introduce expresion a calcular: Resultado: 3 --> OK



Introduce expresion a calcular: Resultado: 0 --> OK



Introduce expresion a calcular: Error!
 --> OK



Introduce expresion a calcular: Error!
 --> OK



Introduce expresion a calcular:  --> OK

""")
  

  input("Pulsa ENTER para continuar....")

  #-- Ejecutar test-4
  print()
  print("TEST-4:")
  input_data = """1+9
5+5
incorrect1
incorrect2
3+1

""".encode('utf-8')
  
  subprocess.run(["java", "-jar", "../../../../rars1_4.jar", "1000", "main.s", "../../../../procesar.s", "../../../../atoi1.s", "../../../../servicios.asm", "../../../../evaluar.s"], input=input_data)

  print("""---SOLUCION:
Cadenas de prueba:
* 5+5
* incoorect1
* incorrect2
* 3+1


EVALUACION DE EXPRESIONES


Introduce expresion a calcular: Resultado: 10

Introduce expresion a calcular: Resultado: 10

Introduce expresion a calcular: Error!


Introduce expresion a calcular: Error!


Introduce expresion a calcular: Resultado: 4

Introduce expresion a calcular: 
Evaluaciones ok: 3
""")

  input("Pulsa ENTER para continuar....")

  #-- Ejecutar su programa
  print("TEST-5: Ejecucion completa de su proyecto:")
  subprocess.run(["java", "-jar", "../../../../rars1_4.jar", "1000", "main.s", "atoi1.s", "procesar.s", "evaluar.s"])
  print()


