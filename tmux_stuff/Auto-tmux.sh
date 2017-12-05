#!/bin/sh

# Usage: ./auto-tmux.sh [<dir_name>]

SESSION_NAME='local'

WINDOW0_NAME='Main'
WINDOW1_NAME='Deepwork'
WINDOW2_NAME='Cinema'

# Client size, necessary for Cinema mode
CLIENT_WIDTH=170
VERTICAL_BARS=32


# These commands are send using tmux' send-keys
# A random man page!
Main_command='man $(ls /usr/share/man/man* | shuf -n1 | cut -d. -f1); clear'
Wingman_command='~/bin/Script.sh'
Minimap_command='watch -n 1 -tc -- tree -trC; clear'
Cal_command='while :; do clear; cal; sleep 3600; done; clear'


# Test if inside a tmux session
if [ "$TERM" = "screen" -a -n "$TMUX" ]; then
	echo "Inside tmux! Not going to have tmux on tmux!"
	exit 1;
fi


# Re-attach a session / create new one

tmux has-session -t "$SESSION_NAME" 2> /dev/null
if [ "$?" -eq 0 ]; then
	tmux attach -t "$SESSION_NAME"
	exit 0;
elif [ "$#" -eq 1 -a ! -z "$1" ]; then
	tmux new -d -s "$SESSION_NAME" -c "$1"
else
	tmux new -d -s "$SESSION_NAME"
fi

tmux rename-window "$WINDOW0_NAME"

# Creating various panes on Main window
tmux select-window -t "$SESSION_NAME":0

	# Main vertical split (0)
tmux split-window -h -p 50 -c "#{pane_current_path}"
tmux send-keys "$Wingman_command" 'C-m'

	# Wingman (1)
tmux split-window -v -p 50 -c "#{pane_current_path}"
tmux send-keys "$Minimap_command" 'C-m'

	# Minimap(2) vs Cal(3)+Time(4)
tmux split-window -h -p 44 -c "#{pane_current_path}"
tmux send-keys "$Cal_command" 'C-m'
tmux split-window -v -p 50 -c "#{pane_current_path}"
tmux clock-mode -t {bottom-right}


# Create a big Deepwork
# window
tmux new-window -n "$WINDOW1_NAME" -c "#{pane_current_path}"

# Create a Cinema window(1) - 2(0 and 3) bars of 32 chars in the side
tmux new-window -n "$WINDOW2_NAME" -c "#{pane_current_path}"
tmux split-window -h -l $((CLIENT_WIDTH - VERTICAL_BARS)) -c "#{pane_current_path}"
tmux split-window -h -l $VERTICAL_BARS -c "#{pane_current_path}"


# Selects panes to format history:
# Big Cinema pane
tmux select-pane -t 1


# Minimap -> Wingman -> Main
tmux select-window -t "$SESSION_NAME":"$WINDOW0_NAME"
tmux select-pane -t 1
tmux select-pane -t 0

# Bonus: A random man page!
tmux send-keys "$Main_command" 'C-m'

# Attach the new session
tmux attach -t "$SESSION_NAME"
