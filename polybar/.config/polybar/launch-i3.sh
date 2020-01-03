#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar for openbox
polybar left -c ~/.config/polybar/polybar-i3-config -r &
polybar right -c ~/.config/polybar/polybar-i3-config -r &
