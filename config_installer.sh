#!/bin/sh

# Configurator
# Rafael P. Andrade

# Limits:
#	-It is not very smart about subfolders in RELATIVE_PATH
#	-Sorry about that $(ls)...
#	-It assumes unzip exists



# Path where the edits to configs are stored
RELATIVE_PATH="./dot_files/"

# File where entirely new files (scripts) are stored
SCRIPTS_ARCHIVE="tmux_stuff.zip"


# Path where pre-installed configs are loaded.
CONFIG_PATH="$HOME/"


for l in $(ls "$RELATIVE_PATH") ; do
	echo "Setting up $l"
	cat "$RELATIVE_PATH$l" >> "$CONFIG_PATH"".$l"
done


if [ -f "$SCRIPTS_ARCHIVE" ] ; then
	echo "Unzipping $SCRIPTS_ARCHIVE to $HOME"
	unzip "$SCRIPTS_ARCHIVE" -d "$HOME"
fi

echo "Done!"
