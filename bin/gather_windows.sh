#! /bin/bash

#dump the list of windows to a file
wmctrl -l > /tmp/window_list.txt
x=40; y=40

#read the window information from the file
while read id sticky host win_title; do

    #move any non-sticky windows except the desktop
    if [ "$sticky" == "0" -a "$win_title" != "x-nautilus-desktop" ]
      then
        wmctrl -i -r $id -e 0,$x,$y,-1,-1
        x=$(($x + 40))
        y=$(($y + 40))
    fi

done < /tmp/window_list.txt

#delete the temporary file
rm /tmp/window_list.txt

exit 0