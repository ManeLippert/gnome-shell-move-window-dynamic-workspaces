# Move Windows Wraparound in dynamically associated Workspaces

![SwitchWorkspace](workspaceswitch_numbers.gif)

Good to use with **Gnome 40+** in combination with keyboard shortcuts.
## Dependencies
```
sudo apt install xdotool wmctrl
```

## Installation
make bash script executable
```
chmod u+x win_to_workspace_left.sh
```
```
chmod u+x win_to_workspace_right.sh
```

## Move Window
### To the Leftward Workspace
```
./win_to_workspace_left.sh
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

### To the Rightward Workspace
```
./win_to_workspace_right.sh
```

```
#!/bin/bash
# xdotool and wmctl needed

# generate desktop number for the rightward monitor
DESKTOPRIGHTWARD="$(($(xdotool getactivewindow get_desktop_for_window)+1))"
DESKTOPEND="$(($(xdotool get_num_desktops)-1))"
DESKTOPSTART=0

# count open windows to know the end of the workspaces
LASTWORKSPACE="$(($(xdotool get_num_desktops)-2))"
CURRENTWORKSPACE=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
OPENWINDOWS=$(wmctrl -l | cut -d ' ' -f3 | grep $CURRENTWORKSPACE | wc -l)

# change desktop to the right
if [[ $OPENWINDOWS -eq 1 ]] && [[ $CURRENTWORKSPACE -eq $LASTWORKSPACE ]]
then
    xdotool getactivewindow set_desktop_for_window $DESKTOPSTART && xdotool set_desktop $DESKTOPSTART
else
    xdotool getactivewindow set_desktop_for_window $DESKTOPRIGHTWARD && xdotool set_desktop $DESKTOPRIGHTWARD
fi
```

## Switch Workspace

### To the Leftward Workspace
```
xdotool set_desktop --relative -- -1
```

### To the Rightward Workspace
```
xdotool set_desktop --relative 1
```

## In the Video
* [Pop!_OS](https://pop.system76.com/)
* [Pop-Shell](https://github.com/pop-os/shell)
* [neofetch](https://github.com/dylanaraps/neofetch)
* [Fildem Global Menu](https://github.com/gonzaarcr/Fildem)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Numbers in Terminal](https://github.com/ManeLippert/terminal-numbers)
