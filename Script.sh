#!/bin/bash

#echo
#echo "Hi, $USER"
#echo

#Add the AltGr and menu key to the Super right key and NumLock enter, respectively
#xmodmap -e "keycode 134 = Menu"
#xmodmap -e "keycode 104 = ISO_Level3_Shift" #
#xmodmap -e "keycode 169 = Delete" #getting problems here

#Updates & upgrades to installed packages, as well as remove the not needed ones
ANSWER_YES="y"

echo "Do you want to check for updates/upgrades?(y/n)"
read -n 1 ANSWER
echo
if [ "$ANSWER" = "$ANSWER_YES" ] ; then
	sudo apt-get update
	sudo apt-get dist-upgrade
	sudo apt-get autoremove

else
	echo "Not updated"
fi


#The tradicional echo example, indicates if everything is OKs
echo
echo "Bom dia"
echo "Pode agora continuar"
echo
