# Linux_Scripts #

### Scripts I use in my Linux environment ###


## Programs customized ##

 - bash
 - git
 - nano
 - tmux


## Instructions ##

Just run ./config_installer.sh from anywhere, and it will append the
files under dot_files/ to the hidden files of the same name in
$HOME. Also, it will copy the contents of tmux_stuff directly in
$HOME, interactively (if there are files with the same name, it
will ask what should it do).

Note that this repo is one of the possible configurations.
The names of the folders can be changed, as well as the destination
folder; however, their names must also be changed in
config_installer.sh.

This script is intended to be cross platform (sh script, no bashisms);
if any problem arises in any Posix compliant OS, please fill a bug
report.


## TODO ##

 - [ ] Cleanup script - separate script, to "un-append" the
       customizations made (?+ delete scripts?)

 - [ ] Add support to subdirectories


## Credits ##

Max Irwin is the author of https://max.io/bash.html, repo
[here](https://github.com/binarymax); I used his work to generate a
script, tmux_stuff/script.sh.

And a big thank you for all the open source/free software community;
for I truly stand in the shoulders of giants.
