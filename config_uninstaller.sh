#!/bin/sh

# Unistaller
# Rafael P. Andrade

# Limits:
#	-It will delete EVERYRHING below the first separator. If you
#	 wish to add more configuration options, add them before running
#	 config_installer, or add those customizations to ./dot_files.

#	 Also, please test to see if the separator does not conflict with
#	 existing content on the original configs. Run
#		grep -n -f path/to/separator path/to/original_config
#
#	 If a match is found, please edit the separator and start again

CONF_FILE="./config.conf"

## Loading settings ##

. "$CONF_FILE"

## Program start ##

### Functions ###

config_reset() {
	printf "\\tChecking %s\\n" "$1"

	if [ -f "$CONFIG_PATH.$1" ] &&  [ -w "$CONFIG_PATH.$1" ] ; then
		printf "\\t\\tResetting %s (file found and is writeable)\\n" "$1"

		A=$(grep -E "$CUSTOM_BAR" -m 1 -n \
		    "$CONFIG_PATH.$1" | cut --delimiter=: --field=1)

		if [ -n "$A" ] ; then
			printf "\\t\\tSeparator found! Deleting below line %s\\n" "$A"
			head "$CONFIG_PATH.$1" -n "$A"| head -n -1 >| "$TEMP_FILE"
			mv "$TEMP_FILE" "$CONFIG_PATH.$1"
		else
			printf "\\t\\tSeparator not found. Leaving .%s unchanged\\n" "$1"
		fi

	else
		printf "\\t\\t%s.%s does not exist or is not writeable\\n" "$CONFIG_PATH" "$1"
	fi
}



delete_scripts() {
	printf "\\tChecking %s\\n" "$1"

	if [ -w "$SCRIPTS_PATH$1" ] ; then

		if  cmp -s "$1" "$SCRIPTS_PATH$1" ; then
			printf "\\t\\tDeleting %s from %s (no differences found)\\n" "$1" "$SCRIPTS_PATH"
			rm -i "$SCRIPTS_PATH$1"
		else
			printf "\\t\\tNot deleting %s, differences found\\n" "$1"
		fi

	else
		printf "\\t\\t%s does not exist or is not writeable\\n" "$SCRIPTS_PATH$1"
	fi
}

### Config reset ###

if [ -d "$CONFIG_FOLDER" ] ; then
	printf "Resetting configs in %s\\n" "$CONFIG_PATH"

	func () {
		config_reset "$1"
	}

	previous=$(pwd)
	cd "$CONFIG_FOLDER" || exit 2

	func_to_files -- *

	cd "$previous" || exit 2
fi


### Delete scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	printf "Scanning %s for scripts...\\n" "$SCRIPTS_FOLDER"

	func () {
		delete_scripts "$1"
	}

	previous=$(pwd)
	cd "$SCRIPTS_FOLDER" || exit 2

	func_to_files -- *

	cd "$previous" || exit 2
fi


echo "Done!"
