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

### Config reset ###

if [ -d "$CONFIG_FOLDER" ] ; then
	echo "\nResetting configs in $CONFIG_PATH"

	for l in $(ls -A "$CONFIG_FOLDER") ; do
		echo "\n\tChecking $l"

		if [ -f "$CONFIG_PATH.$l" -a -w "$CONFIG_PATH.$l" ] ; then
			echo "\t\tResetting $l (file found and is writeable)"
			A=$(grep --regexp="$CUSTOM_BAR" --max-count=1 --line-number\
			    "$CONFIG_PATH.$l" | cut --delimiter=: --field=1)
			if [ -n "$A" ] ; then
				echo "\t\tSeparator found! Deleting below line $A"
				head "$CONFIG_PATH.$l" -n "$A"| head -n -1 >| "$TEMP_FILE"
				mv "$TEMP_FILE" "$CONFIG_PATH.$l"
			else
				echo "\t\tSeparator not found. Leaving .$l unchanged"
			fi
		else
			echo "\t\t$CONFIG_PATH.$l does not exist or is not writeable"
		fi

	done
fi


### Delete scripts ###

if [ -d "$SCRIPTS_FOLDER" ] ; then
	echo "\nScanning $SCRIPTS_PATH for scripts..."

	for f in $(ls -A "$SCRIPTS_FOLDER"); do
		echo "\n\tChecking $f"

			if [ -f "$SCRIPTS_PATH$f" -a -w "$SCRIPTS_PATH$f" ] ; then
				cmp --silent "$SCRIPTS_FOLDER$f" "$SCRIPTS_PATH$f"

				if [ "$?" -eq 0 ] ; then
					echo "\t\tDeleting $f from $SCRIPTS_PATH (no differences found)"
					rm -i "$SCRIPTS_PATH$f"
				else
					echo "\t\tNot deleting $f, differences found"
				fi

			else
				echo "\t\t$SCRIPTS_PATH$f does not exist or is not writeable"
			fi
	done
fi


echo "Done!"
