# Move Windows Wraparound in dynamically associated Workspaces

## Dependencies
```
sudo apt install xdotool wmctrl
```

## Move Window to the Leftward Workspace
```
win_to_workspace_left.sh
```

```
#!/bin/bash
# xdotool needed

# generate desktop number for the leftward monitor
DESKTOPLEFTWARD="$(($(xdotool getactivewindow get_desktop_for_window)-1))"
DESKTOPEND="$(($(xdotool get_num_desktops)-1))"

# change desktop to the left
if [[ $DESKTOPLEFTWARD -eq -1 ]]
then
    xdotool getactivewindow set_desktop_for_window $DESKTOPEND && xdotool set_desktop $DESKTOPEND
else
    xdotool getactivewindow set_desktop_for_window $DESKTOPLEFTWARD && xdotool set_desktop $DESKTOPLEFTWARD
fi
```

