#!/bin/bash

#-- URL para descargar el RARS 
RARS_URL="https://github.com/TheThirdOne/rars/releases/download/v1.5/rars1_5.jar"

#-- Descargar RARs y almacenarlo siempre en el mismo fichero (si ya existe se sobreescribe)
wget -O rars1_5.jar $RARS_URL
