#!/bin/bash
if [ "$1" = "home" ]; then
    xrandr --output DP1 --auto --output eDP1 --off 
    polybar bar5 & disown
elif [ "$1" = "work" ]; then
    xrandr --output DP1 --primary --auto --auto --output eDP1 --off 
    polybar bar4 & disown
elif [ "$1" = "omnio" ]; then
    xrandr --output DP1 --auto --output eDP1 --off 
elif [ "$1" = "laptop" ]; then
    polybar bar3 & disown    
else
    echo "Wrong argument. expecting: home, work or laptop"
fi

