#!/bin/sh
# Make Java AWT render correctly under Sway/Xwayland.
export _JAVA_AWT_WM_NONREPARENTING=1
exec /usr/bin/astah-uml "$@"
