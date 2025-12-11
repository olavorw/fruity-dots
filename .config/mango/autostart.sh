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

# Night light
# wlsunset -T 3501 -t 3500 -S 05:30 -s 19:00

# Idle management (hypridle)
hypridle &

# VPN (minimized start)
protonvpn-app --start-minimized &

# Clipboard history (text and images)
# Option 1:
# wl-paste --type text --watch cliphist store &
# wl-paste --type image --watch cliphist store &
# Option 2:
# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# clipboard content manager
wl-paste --type text --watch cliphist store &

# For screenshare to work
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
# The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
/usr/lib/xdg-desktop-portal-wlr &

# Scaling
# echo "Xft.dpi: 140" | xrdb -merge
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.5
#
# # start xwayland
# /usr/sbin/xwayland-satellite :11 &
# # scale 1.4 for xwayland
# sleep 0.5s && echo "Xft.dpi: 150" | xrdb -merge

# Execs are also a thing BUT,
# https://github.com/DreamMaoMao/mangowc/wiki#exec-setting

# exec will run every time after a config reload exec-once will only exec once after mango startup
# exec=waybar (reloads every config reload of mango)
# exec-once=waybar (only execs when mango is started for the first time)

# But we might as well use ./autostart.sh, right? YES, we are.
