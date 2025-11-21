# Fruity Dots

*Olav "Olavorw" Sharma*

My dotfiles using [mango window manager](https://github.com/DreamMaoMao/mangowc).

This was forked from my [mat3rialized-dots]("https://github.com/olavorw/mat3rialized-dots") project on November 17th, 2025 with many changes.

## Installation

1. Install required dependencies

    `paru -S mangowc-git rofi matugen spicetify kvantum swaync waybar wlogout kitty hypridle fastfetch`

2. Copy over files you want from configs in this repository.

## Resources

### Proprietary Install Scripts for Dependencies, and more

I've made it extremely simple to install these dotfiles modularly. That being said, my installation scripts are really おまかせ and have dependencies that the actual configs may not use and are just purely tailored to me. This goes for many of the configs too, may of them are built directly for my workflow as I use them.

Therefore, I recommend that if you want to install my dotfiles, first you can install them, but then customize them for **your own needs** so that I just don't shove random stuff you won't ever use into your arch installation. More on this being that this is kind of my backup for if I want to build a system to my tailored needs, therefore it literally sets up syncthing, tailscale, and more.

All in all, this is the more drastic method, but if you really want to go ahead with it, you can find my full setup script in [`./utils/first-install.sh`](./utils/first-install.sh) Or use only the scripts in the utils folder that you need to use so you don't shove a bunch of random stuff onto your system.
