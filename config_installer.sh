#!/bin/sh

# Configurator
# Rafael P. Andrade

# Limits:
#	-It is not very smart about subfolders in general
#	-Sorry about that $(ls)... instead of *, but it is easier to deal
#	 with files if they do not have the whole path
#	-It will just append configs. One day, it will also strip previous
#	 customizations, but that day is not today


# Folder where the edits to configs are stored
CONFIG_FOLDER="./dot_files/"

# Path where pre-installed configs are
CONFIG_PATH="$HOME/"


# Folder where entirely new files (scripts) are stored
SCRIPTS_FOLDER="./tmux_stuff/"

# Destination for scripts
SCRIPTS_PATH="$HOME/"


for l in $(ls -A "$CONFIG_FOLDER") ; do
	echo "Setting up $l"
	cat "$CONFIG_FOLDER$l" >> "$CONFIG_PATH"".$l"
done


if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "Moving $SCRIPTS_ARCHIVE to $HOME"
	for f in $(ls -A "$SCRIPTS_FOLDER"); do
		echo "\tCopying $f"
		cp -i "$SCRIPTS_FOLDER$f" "$SCRIPTS_PATH"
	done
fi

echo "Done!"
