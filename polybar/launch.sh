#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars for all monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload gr8bar 2>/tmp/polybar.log  &
done
#polybar gr8bar >>/tmp/polybar1.log 2>&1 &
