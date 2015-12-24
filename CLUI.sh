#!/bin/bash
#

#CLUI
#for more info contact thyuser
SCRIPT="y"
CUR_DIR=$("pwd")
CUR_BAT=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//)

echo "Hack Mode(y/n)?"
read -n 1 HACK
if [ "$HACK" = "y" ] ; then
	setterm -background black -foreground green -store
else
	setterm -background black -foreground white -store
fi

echo
echo "Hi, $USER"
echo "CLUI v1.52"
date +"%A %d-%m-%y%t%T"
echo
upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ empty|percentage"
sleep 0.3s
fortune ~/bin/k | cowsay
sleep 1.5s

while [ "$SCRIPT" = y  ] ; do
MORE="y"

echo
echo "Menu:             "
echo "1-Internet browser"
echo "2-Startx/desktop  "
echo "3-Music           "
echo "4-Soft. Update    "
echo "5-More tools...   "
echo "6-More wisdom...  "
echo "7-About..."
echo "8-Power off"
echo "9-exit CLUI"
read -n 1 CHOICE
echo

if [ "$CHOICE" = 1 ] ; then
	elinks
elif [ "$CHOICE" = 2 ] ; then
	nice startx
elif [ "$CHOICE" = 3 ] ; then
	echo "Queen[1],QdB[2],Electro Swing[3],todos[4] ou criar playlist[5]?"
	read -n 1 ESCOLHA
	echo
	if [ $ESCOLHA -eq 1 ] ; then
		cd ~/Music/"Queen"
		find -type f -iname \*.mp3 > playlist.txt
		find -type f -iname \*.wma >> playlist.txt
		mplayer -shuffle -gapless-audio -noautosub -novideo -playlist playlist.txt
		rm playlist.txt

	elif [ $ESCOLHA -eq 2 ] ; then
		cd ~/Music/"Quinta Do Bill"/
		find -type f -iname \*.wma > playlist.txt
		find -type f -iname \*.wav >> playlist.txt
		mplayer -shuffle -gapless-audio -noautosub -novideo -playlist playlist.txt
		rm playlist.txt

	elif [ $ESCOLHA -eq 3 ] ; then
		cd ~/Music/"Electro Swing"/
		find -type f -iname \*.mp3 > playlist.txt
		mplayer -shuffle -gapless-audio -noautosub -novideo -playlist playlist.txt
		rm playlist.txt


	elif [ $ESCOLHA -eq 5 ] ; then
		cd ~/Music/
		find -type f -iname \*.mp3 > playlist.txt
		find -type f -iname \*.wma >> playlist.txt
		find -type f -iname \*.wav >> playlist.txt
		nano playlist.txt
		mplayer -shuffle -gapless-audio -noautosub -novideo -playlist playlist.txt
		rm playlist.txt

	else
		cd ~/Music/
		find -type f -iname \*.mp3 > playlist.txt
		find -type f -iname \*.wma >> playlist.txt
		find -type f -iname \*.wav >> playlist.txt
		mplayer -shuffle -gapless-audio -noautosub -novideo -playlist playlist.txt
		rm playlist.txt
	fi
elif [ "$CHOICE" = 4 ] ; then
	Script.sh

elif [ "$CHOICE" = 5 ] ; then
	echo "   Ctrl-C to kill these"
	echo "		1-Morse translator   "
	echo "		2-Moon phases        "
	echo "		3-Tetris             "
	echo "		4-Hangman            "
	echo "		5-Greed              "
	echo "		6-Calendar           "
	echo "		7-Battery checker    "
	echo "		8-Screensaver        "
	echo "		9-Back"
	read -s -n 1 JOGO
	if [ "$JOGO" = 1 ] ; then
		morse
	elif [ "$JOGO" = 2 ] ; then
		pom
	elif [ "$JOGO" = 3 ] ; then
		tetris-bsd
	elif [ "$JOGO" = 4 ] ; then
		hangman
	elif [ "$JOGO" = 5 ] ; then
		greed
	elif [ "$JOGO" = 6 ] ; then
		cal -y
		sleep 3s
	elif [ "$JOGO" = 7 ] ; then
		echo "[n] to stop"
		while [ "$MORE" != n ] ; do
			if [ $CUR_BAT -eq 100 ] ; then
				echo "Fully Charged!"
				MORE="n"
			else
				upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//
				read -n 1 -t 3 MORE
			fi
		done

	elif [ "$JOGO" = 8 ] ; then
		echo "Rain is coming" && sleep 1s
		rain -d 30

	else
		true
	fi

elif [ "$CHOICE" = 6 ] ; then
	while [ "$MORE" = y  ] ; do
		fortune ~/bin/k | cowsay -y
		sleep 3s
		echo "More(y/n)?"
		read -n 1 MORE
	done

elif [ "$CHOICE" = 7 ] ; then
	cd ~/bin
	less ZCLUI.txt

elif [ "$CHOICE" = 8 ] ; then
	echo "Shutdown[1], Reboot[2], Suspend[3] or Hibernate[4]?"
	read -n 1 POWER
	echo
		if [ $POWER -eq 2 ] ; then
			dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
			SCRIPT="n"
		elif [ $POWER -eq 1 ] ; then
			dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
			SCRIPT="n"
		elif [ $POWER -eq 4 ] ; then
			dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Hibernate

		elif [ $POWER -eq 3 ] ; then
			dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend

		fi


elif [ "$CHOICE" = 9 ] ; then
	SCRIPT="n"


else
	echo "Choose between 1-9"

fi

done

cd "$CUR_DIR"
echo
