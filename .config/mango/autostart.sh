#!/bin/bash
### AUTOSTART ###

set +e

# Audio services
systemctl --user start pipewire pipewire-pulse wireplumber

# Bluetooth
systemctl start bluetooth
blueman-applet &

# Polkit authentication agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Disk management
udiskie &

# Keyboard input methods
fcitx5 &

# Wallpaper daemon
swww-daemon &

# Notification daemon
swaync &

# Top bar
waybar &

# Idle management (hypridle)
hypridle &

# VPN (minimized start)
protonvpn-app --start-minimized &

# Clipboard history (text and images)
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Execs are also a thing BUT,
# https://github.com/DreamMaoMao/mangowc/wiki#exec-setting

# exec will run every time after a config reload exec-once will only exec once after mango startup
# exec=waybar (reloads every config reload of mango)
# exec-once=waybar (only execs when mango is started for the first time)

# But we might as well use ./autostart.sh, right? YES, we are.
