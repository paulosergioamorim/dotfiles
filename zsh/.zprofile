if [[ "$(tty)" == /dev/tty1 && -z $WAYLAND_DISPLAY && -z $DISPLAY ]]; then
  exec sway
fi
