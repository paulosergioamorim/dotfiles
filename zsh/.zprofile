[ "$(tty)" = "/dev/tty1" ] && start-hyprland
[ "$(tty)" = "/dev/tty2" ] && /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
