#!/bin/bash
clear
echo "-----Ejecutando TEST-01-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del elemento a probar
ITEM="calc.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero con el volcado de memoria de datos
MEMFILE="mem.hex"

##-- Fichero con el volcado del segmento de codigo
CODEFILE="code.hex"

##-- Fichero donde almacenar la salida del RARS
OUTPUT="output.txt"

##-- Valores esperados para las variables de memoria
VAR_A_OK="00000001"
VAR_B_OK="00000002"
VAR_C_OK="00000003"
VAR_F_OK="0000001e"

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
var_a=`head -n1 $MEMFILE | tail -n1`

##-- Comprobar valor de la variable a
if [ "$var_a" = $VAR_A_OK ]
then
  echo "> ✅️ Variable a: $var_a"
else
  echo "> ❌️ Variable a: $var_a. Debería ser: $VAR_A_OK"
fi

##-- Comprobar la variable b
var_b=`head -n2 $MEMFILE | tail -n1`

##-- Comprobar valor de la variable a
if [ "$var_b" = $VAR_B_OK ]
then
  echo "> ✅️ Variable b: $var_b"
else
  echo "> ❌️ Variable b: $var_b. Debería ser: $VAR_B_OK"
fi

##-- Comprobar la variable c
var_c=`head -n3 $MEMFILE | tail -n1`

if [ "$var_c" = $VAR_C_OK ]
then
  echo "> ✅️ Variable c: $var_c"
else
  echo "> ❌️ Variable c: $var_c. Debería ser: $VAR_C_OK"
fi


##-- Comprobar la variable f
var_f=`head -n4 $MEMFILE | tail -n1`
if [ "$var_f" = $VAR_F_OK ]
then
  echo "> ✅️ Variable f: $var_f"
else
  echo "> ❌️ Variable f: $var_f. Debería ser: $VAR_F_OK"
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

if [ "$ninst" -lt 12 ]
then
  echo "> ✅️🎖️  BONUS!!!. Menos de 12 instrucciones"
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




