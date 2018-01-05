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
	echo "\n\tChecking $1"

	if [ -f "$CONFIG_PATH.$1" -a -w "$CONFIG_PATH.$1" ] ; then
		echo "\t\tResetting $1 (file found and is writeable)"

		A=$(grep -E "$CUSTOM_BAR" -m 1 -n \
		    "$CONFIG_PATH.$1" | cut --delimiter=: --field=1)

		if [ -n "$A" ] ; then
			echo "\t\tSeparator found! Deleting below line $A"
			head "$CONFIG_PATH.$1" -n "$A"| head -n -1 >| "$TEMP_FILE"
			mv "$TEMP_FILE" "$CONFIG_PATH.$1"
		else
			echo "\t\tSeparator not found. Leaving .$1 unchanged"
		fi

	else
		echo "\t\t$CONFIG_PATH.$1 does not exist or is not writeable"
	fi
}



delete_scripts() {
	echo "\n\tChecking $1"

	if [ -w "$SCRIPTS_PATH$1" ] ; then
		cmp -s "$1" "$SCRIPTS_PATH$1"

		if [ "$?" -eq 0 ] ; then
			echo "\t\tDeleting $1 from $SCRIPTS_PATH (no differences found)"
			rm -i "$SCRIPTS_PATH$1"
		else
			echo "\t\tNot deleting $1, differences found"
		fi

	else
		echo "\t\t$SCRIPTS_PATH$1 does not exist or is not writeable"
	fi
}

### Config reset ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nResetting configs in $CONFIG_PATH"

	func () {
		config_reset "$1"
	}

	previous=$(pwd)
	cd "$CONFIG_FOLDER"

	func_to_files *

	cd "$previous"
fi


### Delete scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "\nScanning $SCRIPTS_PATH for scripts..."

	func () {
		delete_scripts "$1"
	}

	previous=$(pwd)
	cd "$SCRIPTS_FOLDER"

	func_to_files *

	cd "$previous"
fi


echo "Done!"
