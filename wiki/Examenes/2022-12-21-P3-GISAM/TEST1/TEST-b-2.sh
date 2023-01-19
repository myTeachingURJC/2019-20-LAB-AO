#!/bin/bash
clear
echo "-----Ejecutando TEST-b-2"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del fichero con la funcion a probar
ITEM="doble.s"

##-- Nombre del programa principal de prueba (Estudiante)
MAIN="main.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero con el volcado del segmento de codigo
CODEFILE="code.hex"

##-- Fichero donde almacenar la salida del RARS
OUTPUT_ERR="output_err.txt"

##-- Fichero con el numero a calcular el doble
MSG="msg.txt"

##-- Fichero donde almacenar la salida de la consola del programa
CONSOLE="console.txt"

##-- Salidas correctas por la consola:
linea1_OK="Introduzca un numero entero: El doble de 8 es 16"

##-- Borrar los ficheros temporales generados en una
##-- ejecucion previa
rm -f $OUTPUT_ERR
rm -f $CODEFILE
rm -f $CONSOLE

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

if [ -f "../$MAIN" ]
then
  echo "> ✅️ $MAIN existe"
else
  echo ""
  echo ">> ❌️ ERROR: $ITEM no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

### Comprobar si el fichero a probar existe

if [ -f "../$ITEM" ]
then
  echo "> ✅️ $ITEM existe"
else
  echo ""
  echo ">> ❌️ ERROR: $ITEM no encontrado (🔥️ERROR DE ESPECIFICACIONES)"
  read -p "------FIN-------"
  exit 1
fi

echo ""
echo "> ➡️  PROBANDO: "$MAIN


##--------------------------
##-- Comando a ejecutar
#---------------------------
##-- Parametros pasados al RARS:
##-- nc: No mostrar el mensaje de copyright inicial
##-- me: Mostrar los mensajes del RARs en la salida de error
##-- ic: Imprimir al final el numero de instrucciones basicas ejecutadas
##-- 
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPS \
     dump .text HexText $CODEFILE ../$MAIN ../$ITEM" 

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd >$CONSOLE 2>$OUTPUT_ERR < $MSG
echo ""

##-- Comprobar si ha habido errores de ensamblado o en tiempo de ejecucion
if grep -q "Runtime exception" $OUTPUT_ERR;
then
  echo "> ❌️ ERROR en tiempo de ejecución. Ha PETADO 😱️😱️"
else
  #-- Si no es de runtime comprobamos si es de ensamblado
  if grep -q "Error in" $OUTPUT_ERR; then
    echo "> ❌️ ERROR: El programa NO ensambla 😱️😱️"
    echo ""
    cat $OUTPUT_ERR
    read -p "------FIN-------"
    exit 1
  fi
fi

##-- Comprobar si el programa no termina de forma controlada
if grep -q "dropping off" $OUTPUT_ERR; then
  echo "> ❌️ ERROR: El programa no termina llamando al sistema operativo"
fi

##-- Leer el numero total de instrucciones
ninst=`cat $CODEFILE | wc -l`

##-- Leer los ciclos
ciclos=`tail -n1 $OUTPUT_ERR`

if [ "$ciclos" = $MAX_STEPS ]
then
  echo "> ❌️ ERROR: Bucle infinito. El programa NO termina"
fi

#-- Leer las dos lineas de salida en consola
linea1=`head -n1 $CONSOLE`
linea2=`head -n2 $CONSOLE | tail -1`

#-- Comprobar la salida por consola
if [ "$linea1" = "$linea1_OK" ]
then
  echo "> ✅️ Linea 1: OK!"
else
  echo 
  echo "> ❌️ Linea 1: La salida de la consola NO es exacta"
fi



echo ""
echo "> Instrucciones totales: $ninst"
echo "> Ciclos de ejecución: $ciclos"


##-- Comprobar si termina con normalidad, llamando a exit
if grep -q "calling exit" $OUTPUT_ERR; then
  echo "> ✅️ El programa termina llamando a EXIT"
fi

echo "> Salida en consola: "
cat $CONSOLE

echo ""
read -p "------FIN-------"



