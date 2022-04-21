#!/bin/bash
# xdotool and wmctrl needed

# generate desktop number for the rightward monitor
DESKTOPRIGHTWARD="$(($(xdotool getactivewindow get_desktop_for_window)+1))"
DESKTOPSTART=0

# count open windows to know the end of the workspaces
OPENWINDOWS=$(wmctrl -l | cut -d ' ' -f3 | grep $(wmctrl -d | grep '*' | cut -d ' ' -f1) | wc -l)

# change desktop to the right
if [[ $OPENWINDOWS -eq 1 ]]
then
    xdotool getactivewindow set_desktop_for_window $DESKTOPSTART && xdotool set_desktop $DESKTOPSTART
else
    xdotool getactivewindow set_desktop_for_window $DESKTOPRIGHTWARD && xdotool set_desktop $DESKTOPRIGHTWARD
fi