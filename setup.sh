#!/bin/bash
if [ "$1" = "home" ]; then
    xrandr --output HDMI1 --auto --output eDP1 --off --output DP2 --auto  --right-of HDMI1
elif [ "$1" = "work" ]; then
    xrandr --output DP1 --primary --auto --output DP2 --left-of DP1 --auto --output eDP1 --off 
elif [ "$1" = "omnio" ]; then
    xrandr --output DP1 --auto --output eDP1 --off 
elif [ "$1" = "laptop" ]; then
    xrandr --output HDMI1 --off --output eDP1 --auto --output DP2 --off  
else
    echo "Wrong argument. expecting: home, work or laptop"
fi

