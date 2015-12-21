# Linux_Scripts
#####Scripts I use in everyday linux live to aid me.

##CLUI.sh-Simple menu for tty environment
Clui features sudoless shutdown/reboot/suspend/hibernate, a simple menu, a lot of utilities. Try it out!

Disclaimer:only tested in Lubuntu

Notes:
  * Some directories are hardcoded. Change them as you need.
  * In CLUI.sh, you will need these packages:
      * fortune (and alter the k file path to match your own)
      * cowsay
      * bsdgames
      * greed
      * nano
      * mplayer
      * elinks

##Script.sh
Simple script for automating updates and cleaning up uneeded packages. Needs an administrative root password, as it has
> sudo apt-get
