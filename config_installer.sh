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

## Program Start ##

### Append configs ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nAppending configs from $CONFIG_FOLDER to $HOME"

	for l in $(ls -A "$CONFIG_FOLDER") ; do
		echo "\n\tSetting up $l"
		echo "$CUSTOM_BAR" >> "$CONFIG_PATH.$l"
		cat "$CONFIG_FOLDER$l" >> "$CONFIG_PATH.$l"
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
