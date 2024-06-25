#!/usr/bin/env python3

import os
import sys
import re
import subprocess
import requests

#───────────────────────────────────────
# Definiciones ANSI para los colores
#───────────────────────────────────────

#── Colores normales
GREY = "\x1B[30m"
RED = "\x1B[31m"  
GREEN = "\x1B[32m" 
YELLOW = "\x1B[33m"
BLUE = "\x1B[34m"
MAGENTA = "\x1B[35m"
CYAN = "\x1B[36m"
WHITE = "\x1B[37m"

#── Colores brillantes
LGRAY = "\x1B[90m"
LRED = "\x1B[91m"
LGREEN = "\x1B[92m"
LYELLOW = "\x1B[93m"
LBLUE = "\x1B[94m"
LMAGENTA = "\x1B[95m"
LCYAN = "\x1B[96m"
LWHITE = "\x1B[97m"

#──── Otros caracteres especiales
#── Volver al color por defecto
DEFAULT = "\x1B[0m"


def line(color:str, width: int):
    """ Draw a text line:
    color: ANSI string for the color
    width: Line width
    """
    print(color + "─" * width)


#-- Check if Rars exists in the current folder
#-- Download if it does not
def download_rars(rars_name : str, rars_url: str) -> bool:
    """
      Check if Rars exists in the current folder
      Download if it does not
      * rars_name: Name of the Rars file
      * rars_url: Full URL for downloading RARs
    """
    #-- Comprobar si existe el RARs en el directorio actual
    if not os.path.exists(RARS_NAME):
        print("> ❌️ RARS no existe")

        #-- Descargar el ejecutable del RARs
        print("  > Descargando RARS desde la URL: " + RARS_URL)
        response = requests.get(RARS_URL)

        #-- Comprobar si ha ocurrido un error en la descarga
        if response.status_code != 200:
            line(LRED, 20)
            print(LRED + "ERROR" + DEFAULT)
            line(LRED, 20)
            print("No se ha podido realizar la descarga")
            print(f"Respuesta: {response.status_code} ({response.text})")
            print(DEFAULT)
            sys.exit(1)

        #-- Descarga realizada
        contenido = response.content
        
        # Escribir el contenido del archivo en un fichero
        with open(RARS_NAME, 'wb') as archivo:
            archivo.write(contenido)
                
        print("  > " + LGREEN + "OK!" + DEFAULT)
        print()

    ...

#───────────────────────────────────────
# MAIN
#───────────────────────────────────────
#────── Constantes 
#── RARs
RARS_NAME = "rars1_5.jar"
RARS_URL = "https://github.com/TheThirdOne/rars/releases/download/v1.5/" + RARS_NAME

#-- Programa fuente a evaluar
PROG_ASM="rect_TB.s"

#-- Funcion a probar
FUNC_ASM="../rect.s"

#-- Dependencias
DEP_ASM="linea.s"

#-- Numero maximo de ciclos a probar
MAX_STEPS = 10000

#-- Fichero donde volcar el segmento de datos
DATA="data.hex"

#-- Fichero donde volcar el segmento de código
TEXT="text.hex"

hay_errores=False

WIDTH = 40

#── Imprimir encabezado
line(YELLOW, WIDTH)
print(YELLOW + "ARQUI-BOT" + DEFAULT)
line(YELLOW, WIDTH)

#── Volver a color normal
print(DEFAULT, end="")

#-- Make sure RARs is available
download_rars(RARS_NAME, RARS_NAME)
print("> ✅️ RARS EXISTE")


#-- Borrar los archivos temporales generados
#-- en ejecuciones anteriores
if os.path.exists(DATA):
    os.remove(DATA)
    print(f"🧹️Eliminado {DATA} antiguo")

if os.path.exists(TEXT):
    os.remove(TEXT)
    print(f"🧹️Eliminado {TEXT} antiguo")


### Comprobar si el fichero existe
if os.path.exists(PROG_ASM):
  print(f"> ✅️ {PROG_ASM} existe")
else:  
  print(f"> ❌️ ERROR: {PROG_ASM} no encontrado (🔥️ERROR DE ESPECIFICACIONES)")
  print()
  sys.exit()

### Comprobar si la funcion a probar existe
if os.path.exists(FUNC_ASM):
  print(f"> ✅️ {FUNC_ASM} existe")
else:  
  print(f"> ❌️ ERROR: {FUNC_ASM} no encontrado (🔥️ERROR DE ESPECIFICACIONES)")
  print()
  sys.exit()

### Comprobar si las dependencias existen
if os.path.exists(DEP_ASM):
  print(f"> ✅️ {DEP_ASM} existe")
else:  
  print(f"> ❌️ ERROR: {DEP_ASM} no encontrado (🔥️ERROR DE ESPECIFICACIONES)")
  print()
  sys.exit()

#-- Probando fichero fuente
print(f"> Probando: {PROG_ASM}")

#-- Comando a ejecutar
#-- Volcar seg datos: f"dump 0x10010000-0x10010010 HexText {DATA} "\
cmd_str=f"java -jar {RARS_NAME} nc me ic {MAX_STEPS} "\
        f"dump .text HexText {TEXT} {PROG_ASM} {FUNC_ASM} {DEP_ASM}" 

#-- Convertirlo a lista, colocando cada argumento en un item
#-- Necesario para ejecutar el comando con subprocess.run()
cmd = cmd_str.split(" ")

#-- Mostrar el comando que se ejecuta
print("> Ejecutando: ", end="")
print(CYAN + cmd_str + DEFAULT)

#-- Ejecutar el comando!
resultado = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

#-- Guardar la salidas estandar y de error
#--  Salida: mensajes emitidos por el programa ensamblador
#--  error: Mensajes emitidos por el RARs (informativos o de error)
salida_prog = resultado.stdout.decode()
salida_rars = resultado.stderr.decode()

#-- Comprobar si hay runtime error
patron = r"Error in .*/([^/]+)\sline\s(\d+): Runtime exception at (0x[0-9a-fA-F]+): (.+)"
resultado = re.search(patron, salida_rars)
if resultado:
    print("> ❌️ ERROR en tiempo de ejecución. Ha PETADO 😱️😱️")
    archivo = resultado.group(1)
    linea = resultado.group(2)
    address = resultado.group(3)
    msg = resultado.group(4)
    print(f"🔹️Fichero: {archivo}")
    print(f"🔹️Línea: {linea}")
    print(f"🔹️Dirección: {address}")
    print(f"🔹️Error: {msg}")
    print()
    error_output_list = salida_rars.split("\n")
    print(RED + f"{error_output_list[0]}\n" + DEFAULT)
    print(f"{WHITE}Pulsa ENTER...")
    input()
    sys.exit(1)

#-- Comprobar si es un error de ensamblado
patron = r"Error in .*/[^/]+\sline\s(\d+).+: (.+)"
resultado = re.search(patron, salida_rars)
if resultado:
    print("> ❌️ ERROR: El programa NO ensambla 😱️😱️")
    linea = resultado.group(1)
    msg = resultado.group(2)
    print(f"🔹️Línea: {linea}")
    print(f"🔹️Error: {msg}")
    print()
    error_output_list = salida_rars.split("\n")
    print(RED + f"{error_output_list[0]}\n" + DEFAULT)
    print(f"{WHITE}Pulsa ENTER...")
    input()
    sys.exit(1)


#-------------------------------------------------
#-- Leer la salida del programa ASM
#-------------------------------------------------
salida_prog = salida_prog.strip().split("\n")

#-------------------------------------------------
#-- Leer la salida del RARs
#-------------------------------------------------
salida_rars = salida_rars.strip().split("\n")

#-- Ciclos
ciclos = salida_rars[2]

#-- Variables de estado
bucle_infinito = False

#-- Comprobar si hay bucle infinito
if ciclos=="10000":
    print("> ❌️ BUCLE INFINITO!!")
    bucle_infinito = True
else:
  #-- Comprobar el convenio de registros
  convenio_ok = salida_prog[5] == "Convenio OK!!"
  if convenio_ok:
      print("> ✅️ Convenio OK!")
  else:
      print("> ❌️ Violación del convenio")

#--- Comprobar que la salida es correcta
if len(salida_prog) >= 5:
  rect = salida_prog[:5]
  if rect == ['********************',
              '********************',
              '********************',
              '********************',
              '********************']:
    print(f"> ✅️ HAY RECTANGULO")
  else:
    print(f"> ❌️ ERROR: Rectangulo incorrecto")
else:
  print(f"> ❌️ ERROR: No hay rectangulo")

##-- Comprobar si el programa no termina de forma controlada
if "dropping off" in salida_rars:
    print(f"> ❌️ ERROR: El programa no termina llamando al sistema operativo")
    hay_errores = True

##-- Comprobar si el programa termina con normalidad, llamando a EXIT
if "calling exit" in salida_rars:
    print(f"> ✅️ El programa termina llamando a EXIT")

####-- Leer el fichero del codigo
with open(TEXT, "r") as code_file:
    contenido = code_file.read()
    code = contenido.strip().split("\n")
    instrucciones = len(code)
    print(f"> Instrucciones totales: {instrucciones}")

##-- Leer los ciclos
print(f"> Ciclos de ejecución: {ciclos}")

line(YELLOW, WIDTH)

print()
if bucle_infinito:
  if len(salida_prog) > 12:
    for i in range(12):
          print(salida_prog[i])
else:
  if salida_prog:
      text = "\n".join(salida_prog)
      print(f"SALIDA programa:\n{text} \n")

print(f"{WHITE}Pulsa ENTER...")
input()
