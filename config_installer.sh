#!/bin/sh

# Configurator
# Rafael P. Andrade

# Limits:
#	-It is not very smart about subfolders in general
#	-Sorry about that $(ls)... instead of *, but it is easier to deal
#	 with files if they do not have the whole path


CONF_FILE="./config.conf"

## Loading settings ##

. "$CONF_FILE"


### Functions ###

append_config() {

	if [ "$1" -a -f "$CONFIG_FOLDER$1" ] ; then
		echo "\n\tSetting up $1"
		echo "$CUSTOM_BAR" >> "$CONFIG_PATH.$1"
		cat  "$CONFIG_FOLDER$1" >> "$CONFIG_PATH.$1"
	else
		echo "\n\tArgument invalid: $1"
	fi

}


copy_scripts() {
	if [ "$1" -a -f "$SCRIPTS_FOLDER$1" ] ; then
		echo "\n\tCopying $1 and changing permissions..."
		cp -i "$SCRIPTS_FOLDER$1" "$SCRIPTS_PATH"
		chmod -v =700 "$SCRIPTS_PATH$1"
	else
		echo "\n\tArgument invalid: $1"
	fi

}

## Program Start ##


### Append configs ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nAppending configs from $CONFIG_FOLDER to $HOME"

	for l in $(ls -A "$CONFIG_FOLDER")
		do append_config "$l"
	done
fi

### Copy scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "\nMoving $SCRIPTS_FOLDER to $HOME"

	for f in $(ls -A "$SCRIPTS_FOLDER")
		do copy_scripts "$f"
	done

fi

echo "Done!"
