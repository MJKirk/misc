#!/bin/bash

HELP="\
For some reason, on the first run of superplot_gui the graphics don't show up properly.
Run it, exit the file selector, then run it again to make everything work fine."
echo "$HELP"
docker run --env=DISPLAY=$DISPLAY --hostname=$HOSTNAME --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=$HOME/.Xauthority:/home/docker/.Xauthority --rm -it superplot:latest
