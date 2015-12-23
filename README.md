# Linux_Scripts
#####Scripts I use in everyday linux live to aid me.

##CLUI.sh-Simple menu for cli/tty environment
CLUI features sudoless shutdown/reboot/suspend/hibernate, a simple menu, a lot of utilities. Try it out!

Disclaimer:only tested in Lubuntu(32 and 64 bits), but should work in any Ubuntu-based distro, and most other distros.

CLUI needs all the contents in this repository to work without changing code

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


#Tutorials for the lazy

##Using a custom file for fortune(in this repo, k)

(Source)[http://ubuntuforums.org/showthread.php?t=1343692&p=8456253#post8456253]

#####1. Create a text file(like k in this repo), make sure you separate each sentence by a empty line containing only one %
#####2. Run the following command. If you're in ~/bin and have the "k" file there:
>strfile -c % k k.dat
#####The output will be k.dat

#####3. Now, to use your custom file in fortune, you only need to execute
>fortune /path/to/file/yourfile.dat (in my case, fortune ~/bin/k.dat)


##In the future- fix hibernation in lxde

