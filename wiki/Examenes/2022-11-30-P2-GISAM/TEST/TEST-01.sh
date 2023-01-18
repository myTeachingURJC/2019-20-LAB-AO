#!/bin/bash
clear
echo "-----Ejecutando TEST-01-----"

##-- Numero de pasos maximos
##-- Es para detectar bucles infinitos
MAX_STEPS="10000"

##-- Nombre del elemento a probar
ITEM="mayus.s"

##-- Nombre del RARs
RARS="rars1_5.jar"

##-- Fichero con el volcado de memoria de datos
MEMFILE="mem.hex"

##-- Fichero con el volcado del segmento de codigo
CODEFILE="code.hex"

##-- Fichero donde almacenar la salida del RARS
OUTPUT_ERR="output_err.txt"

##-- Fichero con el mensaje a Cifrar
MSG="msg.txt"

##-- Fichero donde almacenar la salida de la consola del programa
CONSOLE="console.txt"

##-- Valores esperados para las primeras palabras del segmento de datos
PALABRA1_OK="00000000"  #-- Palabra reservada
PALABRA2_OK="45545241"  #-- Mensaje: ARTE
PALABRA3_OK="0053494d"  #-- Mensaje: MIS\0

##-- Salida exacta por la consola:
OUTPUT_EXACT="Introduce cadena en minusculas: Cadena en Mayusculas: ARTEMIS"

##-- Borrar los ficheros temporales generados en una
##-- ejecucion previa
rm -f $MEMFILE
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
cmd="java -jar rars1_5.jar nc me ic $MAX_STEPs \
     dump 0x10010000-0x10010010 HexText $MEMFILE $MAX_STEPS dump .text \
     HexText $CODEFILE $ITEM" 

##-- Mostrar comando en consola y ejecutarlo
echo $cmd
$cmd >$CONSOLE 2>$OUTPUT_ERR  < $MSG
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


##-- Comprobar si se ha generado el fichero con el volcado de memoria
##-- si no se ha generado es porque no se ha declarado el segmento de datos
if [ -f "$MEMFILE" ]
then
  echo "> ✅️ $MEMFILE generado"
else
  echo "> ❌️ ERROR: No hay datos en el segmento de datos (🔥️ERROR DE ESPECIFICACIONES)"
fi

####-- Leer la primera palabra de la memoria
####-- Debe contener la palabra reservada: 0x00000000
palabra1=`head -n1 $MEMFILE | tail -n1`

##-- Comprobar la primera palabra
if [ "$palabra1" = $PALABRA1_OK ]
then
  echo "> ✅️ Primera palabra de memoria: $palabra1"
else
  echo "> ❌️ Primera palabra de memoria: $cifrado1. Debería ser: $PALABRA1_OK"
fi

##-- Comprobar la segunda palabra de memoria
palabra2=`head -n2 $MEMFILE | tail -n1`

##-- Comprobar valor de la variable a
if [ "$palabra2" = $PALABRA2_OK ]
then
  echo "> ✅️ Segunda palabra de memoria: $palabra2"
else
  echo "> ❌️ Segunda palabra de memoria: $palabra2. Debería ser: $PALABRA2_OK"
fi

##-- Comprobar la tercera palabra de memoria
palabra3=`head -n3 $MEMFILE | tail -n1`

##-- Comprobar valor de la variable a
if [ "$palabra3" = $PALABRA3_OK ]
then
  echo "> ✅️ Tercera palabra de memoria: $palabra3"
else
  echo "> ❌️ Tercera palabra de memoria: $palabra3. Debería ser: $PALABRA3_OK"
fi

##-- Comprobar si el programa no termina de forma controlada
if grep -q "dropping off" $OUTPUT_ERR; then
  echo "> ❌️ ERROR: El programa no termina llamando al sistema operativo"
fi

##-- Comprobar si termina con normalidad, llamando a exit
if grep -q "calling exit" $OUTPUT_ERR; then
  echo "> ✅️ El programa termina llamando a EXIT"
fi

##-- Leer el numero total de instrucciones
ninst=`cat $CODEFILE | wc -l`

echo "> Instrucciones totales: $ninst"

##-- Leer los ciclos
ciclos=`tail -n1 $OUTPUT_ERR`

if [ "$ciclos" = $MAX_STEPS ]
then
  echo "> ❌️ ERROR: Bucle infinito. El programa NO termina"
fi

echo "> Ciclos de ejecución: $ciclos"

if [ "$ciclos" -lt 73 ]
then
   echo "> ✅️🎖️  BONUS!!!. Menos de 73 ciclos"
fi


echo "> Salida en consola: "
cat $CONSOLE

#-- Leer la primera linea de la salida en consola
console=`head -n1 $CONSOLE`

#-- Comprobar la salida por consola
if [ "$console" = "$OUTPUT_EXACT" ]
then
  echo "> ✅️ Salida de consola EXACTA!"
else
  echo 
  echo "> ❌️ La salida de la consola NO es exacta:"
  echo "$OUTPUT_EXACT"
fi

echo ""
read -p "------FIN-------"




