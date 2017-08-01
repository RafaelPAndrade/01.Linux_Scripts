# Linux_Scripts #

### Auto config scripts ###

## Instructions ##

*	### Scripts ###

	+	config_installer.sh

		When run, this script:

		-	Appends all the files in the folder $CONFIG_FOLDER to their
			hidden equivalent in $CONFIG_PATH. This is, the file bashrc
			(and $CUSTOM_BAR) will be appended to ~/.bashrc.

		-	Copies (interactively) all the scripts in the folder 
			$SCRIPTS_FOLDER to $SCRIPTS_PATH, and changes the permissions
			to 700 (only the file owner can read, write and execute the
			script).

		To run:

				./config_installer.sh


	+	config_uninstaller.sh

		When run, this script:

		-	Strips the configs from all the lines that are below
			the $CUSTOM_BAR.

		-	Compares all the scripts in $SCRIPTS_FOLDER to their
			equivalent in $SCRIPTS_PATH. If no difference is found,
			there will be a prompt for deletion.

		To run:

				./config_uninstaller.sh


*	### Configuring/Settings ###

	+	config.conf

		This file is not run, but sourced by the other scripts. It
		basically contains the settings, like what is the $CUSTOM_BAR
		or where is $CONFIG_PATH.

		If you wish to change the defaults, feel free to fork, and
		then change those variables to others that suit your needs
		better.


## Assumptions/Dependencies ##

This repo/project is intended to be cross platform (sh script, no bashisms);
if any problem arises in any Posix compliant OS, please fill a bug
report.

Dependencies (tested):

+	sh/dash
+	GNU coreutils (8.25)
	-	test / [
	-	echo
	-	cat
	-	cp
	-	chmod
	-	cut
	-	head
	-	rm
	-	mv
	-	pwd
	-	mkdir
	-	mktemp
+	GNU grep (2.25)
+	cmp (diffutils 3.3)



## TODO ##

-	[X] Cleanup script - separate script, to "un-append" the
	customizations made + delete scripts

-	[X] Add support to subdirectories

-	[ ] Make config_installer.sh and config_uninstaller location
	    independent


## Programs customized/tested ##

-	bash
-	git
-	nano
-	tmux


## Credits ##

Max Irwin is the author of https://max.io/bash.html, repo
[here](https://github.com/binarymax); I used his work to generate a
script, tmux_stuff/Script.sh.

And a big thank you for all the open source/free software community;
for I truly stand in the shoulders of giants.
