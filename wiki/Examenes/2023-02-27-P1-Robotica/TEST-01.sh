#!/bin/bash
clear
echo "-----Ejecutando TEST-01-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del elemento a probar
ITEM="display.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero con el volcado de memoria de datos
MEMFILE="mem.hex"

##-- Fichero con el volcado del segmento de codigo
CODEFILE="code.hex"

##-- Fichero donde almacenar la salida del RARS
OUTPUT="output.txt"

##-- Valores esperados para las variables de memoria
VAR_DIGITO_OK="00000066"

##-- Borrar los ficheros temporales generados en una
##-- ejecucion previa
rm -f $MEMFILE
rm -f $OUTPUT
rm -f $CODEFILE

### Comprobar que el RARS está en directorio

if [ -f "$RARS" ]
then
  echo "> ✅️ $RARS existe"
else
  echo ">> ❌️ ERROR: $RARS no está en el directorio"
  read -p "------FIN-------"
  exit 1
fi

### Comprobar si el fichero existe

if [ -f "$ITEM" ]
then
  echo "> ✅️ $ITEM existe"
else
  echo ""
  echo ">> ❌️ ERROR: $ITEM no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

echo ""
echo "> ➡️  PROBANDO: "$ITEM


##--------------------------
##-- Comando a ejecutar
#---------------------------
##-- Parametros pasados al RARS:
##-- nc: No mostrar el mensaje de copyright inicial
##-- me: Mostrar los mensajes del RARs en la salida de error
##-- ic: Imprimir al final el numero de instrucciones basicas ejecutadas
##-- dump 0x10010000-0x10010010 HexText $MEMFILE: Volcar las 4 primers
##     variables a un fichero de texto, en formato texto hexadecimal
##-- 
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPs dump 0x10010000-0x10010010 HexText $MEMFILE $MAX_STEPS dump .text HexText $CODEFILE $ITEM" 

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd 2> $OUTPUT
echo ""

##-- Comprobar si ha habido errores de ensamblado o en tiempo de ejecucion
if grep -q "Runtime exception" $OUTPUT;
then
  echo "> ❌️ ERROR en tiempo de ejecución. Ha PETADO 😱️😱️"
else
  #-- Si no es de runtime comprobamos si es de ensamblado
  if grep -q "Error in" $OUTPUT; then
    echo "> ❌️ ERROR: El programa NO ensambla 😱️😱️"
    echo ""
    cat output.txt
    read -p "------FIN-------"
    exit 1
  fi
fi


##-- Comprobar si se ha generado el fichero con el volcado de memoria
##-- si no se ha generado es porque no se ha declaro el segmento de datos
if [ -f "$MEMFILE" ]
then
  echo "> ✅️ $MEMFILE generado"
else
  echo "> ❌️ ERROR: No hay datos en el segmento de datos (🔥️ERROR DE ESPECIFICACIONES)"
fi

####-- Leer las variables
var_digito=`head -n1 $MEMFILE | tail -n1`

##-- Comprobar valor de la variable digito
if [ "$var_digito" = $VAR_DIGITO_OK ]
then
  echo "> ✅️ Variable Digito: $var_digito"
else
  echo "> ❌️ Variable Digito: $var_digito. Debería ser: $VAR_DIGITO_OK"
fi


##-- Comprobar si el programa no termina de forma controlada
if grep -q "dropping off" $OUTPUT; then
  echo "> ❌️ ERROR: El programa no termina llamando al sistema operativo"
fi

##-- Comprobar si termina con normalidad, llamando a exit
if grep -q "calling exit" $OUTPUT; then
  echo "> ✅️ El programa termina llamando a EXIT"
fi

##-- Leer el numero total de instrucciones
ninst=`cat $CODEFILE | wc -l`

if [ "$ninst" -lt 17 ]
then
  echo "> ✅️🎖️  BONUS!!!. Menos de 17 instrucciones"
fi

echo "> Instrucciones totales: $ninst"

##-- Leer los ciclos
ciclos=`tail -n1 $OUTPUT`

if [ "$ciclos" = $MAX_STEPS ]
then
  echo "> ❌️ ERROR: Bucle infinito. El programa NO termina"
fi

echo "> Ciclos de ejecución: $ciclos"

echo ""
#cat output.txt
read -p "------FIN-------"




