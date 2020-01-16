#!/usr/bin/python3

import os
import sys
import subprocess

DIR = "Correcciones/asa2.11122019"
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
  os.chdir(pc);
  dir = os.listdir('.')
  os.chdir(dir[0])
  print(">PC: {}".format(pc))

  #-- El fichero debe ser el login
  login = os.listdir('.')[0]
  print(">Usuario: {}".format(login))
  os.chdir(login)

  print(">Ficheros entregados: ")
  subprocess.run(["ls"])

  subprocess.run(["head", "-n 4","main.s"])

  #-- Ejecutar test-1
  print("TEST-1:")
  subprocess.run(["java", "-jar", "../../../../../rars1_4.jar", "1000", "../../../../../TEST-len.s", "len.s", "../../../../../servicios.asm"])

  print("""--- SOLUCION:
Calculado:4 / Esperado:4 --->OK
Calculado:4 / Esperado:4 --->OK
Calculado:28 / Esperado:28 --->OK
Calculado:4 / Esperado:4 --->OK

Program terminated by calling exit

""")

  #-- Ejecutar test-2
  print("TEST-2:")
  subprocess.run(["java", "-jar", "../../../../../rars1_4.jar", "1000", "../../../../../TEST-reverse.s", "reverse.s", "../../../../../servicios.asm"])

  print("""--- SOLUCION: 
aloH
9876543210
rotor rotor rotor rotor
a
Program terminated by calling exit
""");

  #-- Ejecutar test-3
  print("TEST-3:")
  subprocess.run(["java", "-jar", "../../../../../rars1_4.jar", "1000", "../../../../../TEST-procesar.s", "../../../../../reverse.s", "../../../../../len.s", "../../../../../servicios.asm", "procesar.s"])

  print("""--- SOLUCION:
Longitud cadena: 4
Cadena invertida: aloH

Longitud cadena: 10
Cadena invertida: 9876543210

Longitud cadena: 18
Cadena invertida: anedac anu se atsE

Longitud cadena: 1
Cadena invertida: a

Program terminated by calling exit
""")

  #-- Ejecutar test-4
  print("TEST-4:")
  input = """hola
adios
Probando rotor

""".encode('utf-8')
  
  subprocess.run(["java", "-jar", "../../../../../rars1_4.jar", "1000", "main.s", "../../../../../reverse.s", "../../../../../len.s", "../../../../../servicios.asm", "../../../../../procesar.s"], input=input)

  print("""---SOLUCION:
Introduce cadena: 
Longitud cadena: 4
Cadena invertida: aloh

Introduce cadena: 
Longitud cadena: 5
Cadena invertida: soida

Introduce cadena: 
Longitud cadena: 14
Cadena invertida: rotor odnaborP

Introduce cadena: 
Program terminated by calling exit
""")

  #-- Ejecutar su programa
  print("TEST-5: Ejecucion completa de su proyecto:")
  subprocess.run(["java", "-jar", "../../../../../rars1_4.jar", "1000", "main.s", "reverse.s", "len.s", "procesar.s"], input=input)
  print()


