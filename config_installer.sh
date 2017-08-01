#!/bin/sh

# Configurator
# Rafael P. Andrade

# Limits:
#	-It is not very smart about subfolders in general


CONF_FILE="./config.conf"

## Loading settings ##

. "$CONF_FILE"


### Functions ###

append_config() {

	if [ "$1" -a -f "$1" ] ; then
		echo "\n\tSetting up $1"
		echo "$CUSTOM_BAR" >> "$CONFIG_PATH.$1"
		cat  "$1" >> "$CONFIG_PATH.$1"
	else
		echo "\n\tArgument invalid: $1"
	fi

}


copy_scripts() {
	if [ "$1" -a -f "$1" ] ; then
		echo "\n\tCopying $1 and changing permissions..."
		cp -i "$1" "$SCRIPTS_PATH"
		chmod -v =700 "$SCRIPTS_PATH$1"
	else
		echo "\n\tArgument invalid: $1"
	fi

}

## Program Start ##


### Append configs ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nAppending configs from $CONFIG_FOLDER to $HOME"

	func () {
		append_config "$1"
	}

	previous=$(pwd)
	cd "$CONFIG_FOLDER"

	func_to_files *

	cd "$previous"

fi

### Copy scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "\nMoving $SCRIPTS_FOLDER to $HOME"

	func () {
		copy_scripts "$1"
	}

	previous=$(pwd)
	cd "$SCRIPTS_FOLDER"

	func_to_files *

	cd "$previous"

fi

echo "Done!"
