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

	if [ "$1" ]  && [ -f "$1" ] ; then
		printf "\\tSetting up %s\\n" "$1"
		A=$(dirname "$1")
		if [ "." != "$A" ] ; then
			mkdir --parents "$CONFIG_PATH.$A"
		fi
		printf "%s" "$CUSTOM_BAR" >> "$CONFIG_PATH.$1"
		cat  "$1" >> "$CONFIG_PATH.$1"
	else
		printf "\\tArgument invalid: %s\\n" "$1"
	fi

}


copy_scripts() {
	if [ "$1" ] && [ -f "$1" ] ; then
		printf "\\tCopying %s and changing permissions...\\n" "$1"
		cp --interactive --parents "$1" "$SCRIPTS_PATH"
		chmod -v =700 "$SCRIPTS_PATH$1"
	else
		printf "\\tArgument invalid: %s\\n" "$1"
	fi

}

## Program Start ##


### Append configs ###

if [ -d "$CONFIG_FOLDER" ] ; then
	printf "Appending configs from %s to %s\\n" "$CONFIG_FOLDER" "$HOME"

	func () {
		append_config "$1"
	}

	previous=$(pwd)
	cd "$CONFIG_FOLDER" || exit 2

	func_to_files -- *

	cd "$previous" || exit 2

fi

### Copy scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	printf "Moving %s to %s\\n" "$SCRIPTS_FOLDER" "$HOME"

	func () {
		copy_scripts "$1"
	}

	previous=$(pwd)
	cd "$SCRIPTS_FOLDER" || exit 2

	func_to_files -- *

	cd "$previous" || exit 2

fi

echo "Done!"
