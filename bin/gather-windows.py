#!/usr/bin/env python3
import subprocess
import sys
import time

# just a helper function, to reduce the amount of code
get = lambda cmd: subprocess.check_output(cmd).decode("utf-8")

# get the data on all currently connected screens, their x-resolution
screendata = [l.split() for l in get(["xrandr"]).splitlines() if " connected" in l]
#print(screendata)
# screendata = [l for l in screendata if " primary" in screendata]
# print(screendata)
posdata = sum([[(w[0], s.split("+")[-2]) for s in w if s.count("+") == 2] for w in screendata], [])
#print(posdata)
primary = [s[0] for s in screendata if 'primary' in s][0]
#print(primary)
#for s in posdata: 
#    print(s[1])
primarypos =  [s[1] for s in posdata if s[0] == primary][0]
print(primarypos)
def get_class(classname):
    # function to get all windows that belong to a specific window class (application)
    w_list = [l.split()[0] for l in get(["wmctrl", "-l"]).splitlines()]
    return [w for w in w_list if classname in get(["xprop", "-id", w])]

def get_windows():
    w_list = [l.split()[0] for l in get(["wmctrl", "-l"]).splitlines()]
    print(w_list)
    return w_list


x=0
y=0
for w in get_windows():
    # first move and resize the window, to make sure it fits completely inside the targeted screen
    # else the next command will fail...
    print(w)

    subprocess.Popen(["wmctrl", "-i", "-r", w, "-b", "remove,maximized_vert,maximized_horz"])
    time.sleep(0.1)
    subprocess.Popen(["wmctrl", "-i", "-r", w, "-e", "1,"+str(int(primarypos)+100+x)+","+str(int(100+y))+",300,300"])
    time.sleep(0.1)
    # maximize the window on its new screen
    #subprocess.Popen(["xdotool", "windowsize", "-sync", w, "100%", "100%"])
    x+=40
    y+=40
        