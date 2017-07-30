#!/bin/sh

# Configurator
# Rafael P. Andrade

# Limits:
#	-It is not very smart about subfolders in general
#	-Sorry about that $(ls)... instead of *, but it is easier to deal
#	 with files if they do not have the whole path


# Folder where the edits to configs are stored
CONFIG_FOLDER="./dot_files/"

# Path where pre-installed configs are
CONFIG_PATH="$HOME/"


# Folder where entirely new files (scripts) are stored
SCRIPTS_FOLDER="./tmux_stuff/"

# Destination for scripts
SCRIPTS_PATH="$HOME/bin/"

# File that contains the customizations separator
CUSTOM_BAR="./separator"


## Program Start ##

### Append configs ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nAppending configs from $CONFIG_FOLDER to $HOME"

	for l in $(ls -A "$CONFIG_FOLDER") ; do
		echo "\n\tSetting up $l"
		cat "$CUSTOM_BAR" "$CONFIG_FOLDER$l" >> "$CONFIG_PATH.$l"
	done
fi

### Copy scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "\nMoving $SCRIPTS_FOLDER to $HOME"

	for f in $(ls -A "$SCRIPTS_FOLDER"); do
		echo "\n\tCopying $f and changing permissions..."
		cp -i "$SCRIPTS_FOLDER$f" "$SCRIPTS_PATH"
		chmod -v =700 "$SCRIPTS_PATH$f"
	done

fi

echo "Done!"
