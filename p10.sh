#!/bin/bash
DIR=$(zenity --file-selection --filename=$HOME --directory --title="Selecciona un repositori" --width 1000)
FILE_NAME=$(zenity --entry --text="Escriu el nom de fitxer:" --title="Introducció del nom del repositori" --width 100)
FILE_EXT=$(zenity  --list --radiolist --column="Opc." --column "Extensions" 'FALSE' php 'FALSE' sh 'FALSE' conf --width 300 --height 200)
file=$DIR/$FILE_NAME.$FILE_EXT
zenity --text-info --title="Escriu el paquet que vulguis" --editable > $file --width=400
if [[ $FILE_EXT == "gz" ]]
then
	zenity --question --text="Vols instalar el paquet $file"
	if [[ $? == 0 ]]
	then 
		aptitude install $file
	fi
fi
exit 0
