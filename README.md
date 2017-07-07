# Linux_Scripts

### Scripts I use in my Linux environment

Just run ./config_installer.sh from anywhere, and it will append the
files under dot_files/ to the hidden files of the same name in 
$HOME. Also, it will unzip the contents of tmux_stuff directly in
$HOME, interactively (if there are files with the same name, it
will ask what should it do).

The names of the zip file and the folder can be changed, as well as
the destination folder; however, their names must also be changed 
in config_installer.sh.

This script is intended to be cross platform (sh script, no bashisms);
if any problem arises in any Posix compliant OS, please fill a bug 
report. This script assumes that a version of "unzip" is present.
