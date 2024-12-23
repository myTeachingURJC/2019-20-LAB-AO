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


def check_variable(varname : str, data : dict, data_ok : dict):
    """Check that the given variable has the
       expeted value
    """

    global hay_errores

    #-- Comprobar la variable 1
    if data[varname] == data_ok[varname]:
        print(f"> ✅️ {varname}: {hex(data[varname])}")
    else:
        print(f"> ❌️ {varname}: {hex(data[varname])}."\
            f"Debería ser: {hex(data_ok[varname])}")
        hay_errores = True


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
PROG_ASM="../memory.s"

#-- Numero maximo de ciclos a probar
MAX_STEPS = 10000

#-- Fichero donde volcar el segmento de datos
DATA="data.hex"

#-- Fichero donde volcar el segmento de código
TEXT="text.hex"

hay_errores = False

#-- Valores esperados para las variables
data_ok = {
    "x": 1,
    "y": 1,
    "z": 1,
    "f": 0x07
}

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

#-- Probando fichero fuente
print(f"> Probando: {PROG_ASM}")

#-- Comando a ejecutar
cmd_str=f"java -jar {RARS_NAME} x10 nc me ic {MAX_STEPS} "\
        f"dump 0x10010000-0x10010010 HexText {DATA} "\
        f"dump .text HexText {TEXT} {PROG_ASM}" 

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
    sys.exit(1)

##-- Comprobar si se ha generado el fichero con el volcado de memoria
##-- si no se ha generado es porque no se ha declaro el segmento de datos
if os.path.exists(DATA):
    print(f"> ✅️ {DATA} generado")
else:
    print(f"> ❌️ ERROR: No hay datos en el segmento de datos (🔥️ERROR DE ESPECIFICACIONES)")
    hay_errores = True

#-- Crear el diccionario con las variables
data = {
    "x": 0,
    "y": 0,
    "z": 0,
    "f": 0
}

####-- Leer las variables del segmento de datos
####-- Leer el fichero del segmento de datos
try:
    with open(DATA, "r") as data_file:
        contenido = data_file.read()
        variables = contenido.split("\n")

        #-- Almacenar las variables en el diccionario
        data["x"] = int(variables[0], 16)
        data["y"] = int(variables[1], 16)
        data["z"] = int(variables[2], 16)
        data["f"] = int(variables[3], 16)

        #-- Comprobar las variables
        check_variable("x", data, data_ok)
        check_variable("y", data, data_ok)
        check_variable("z", data, data_ok)
        check_variable("f", data, data_ok)
        
except FileNotFoundError:
    print("> ❌️ ERROR: Fichero data.hex NO generado")
   




#-- Si hay errores se actualiza la variable global hay_errores

#-------------------------------------------------
#-- Leer el fichero de salida
#-------------------------------------------------
contenido = salida_rars.strip().split("\n")

#-- Ciclos
ciclos = contenido[2]

#-- Lectura de registros, si fuese necesario (Registro X10)
#x10_str = contenido[3].split("\t")[1]
#x10 = int(x10_str, 16)

####-- Leer el fichero del codigo
try:
    with open(TEXT, "r") as code_file:
        contenido = code_file.read()
        code = contenido.strip().split("\n")
        instrucciones = len(code)
        print(f"> Instrucciones totales: {instrucciones}")

except FileNotFoundError as error:
    # -- No hay codigo!
    # -- Tipicamente porque no ha puesto .text
    print(f"> ❌️ ERROR: Segmento de codigo vacio!!")

##-- Comprobar si el programa no termina de forma controlada
if "dropping off" in salida_rars:
    print(f"> ❌️ ERROR: El programa no termina llamando al sistema operativo")
    hay_errores = True

##-- Comprobar si el programa termina con normalidad, llamando a EXIT
if "calling exit" in salida_rars:
    print(f"> ✅️ El programa termina llamando a EXIT")

##-- Leer los ciclos
print(f"> Ciclos de ejecución: {ciclos}")

#-- Comprobar BONUS
#-- Solo si no hay errores previos
if not hay_errores:
    print ("> Comprobando BONUS...")
    ok_varf = False;
    ok_inst = False;

    #-- Comprobar instrucciones
    if instrucciones < 17:
        print(f"  > ✅️ Menos de 17 instrucciones")
        ok_inst = True
    else:
        print(f"  > ❌️ Más de 17 instrucciones...")

    #-- Comprobacion final de Bonus
    if ok_inst:
        print(f"  > 🎖️  {YELLOW}BONUS CONSEGUIDO!!!{DEFAULT}")
    else:
        print(f"  > No conseguidos...")


line(YELLOW, WIDTH)

print()
if salida_prog:
    print("SALIDA programa:\n", salida_prog)

print(f"{WHITE}Pulsa ENTER...")
input()
