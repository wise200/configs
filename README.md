# configs
Justin Wise's Ubuntu Configuration Files

### Instructions
On a fresh Ubuntu system, you should
* Connect all devices, wifi, etc. This will be easier in the default wm.
* The vim and i3 configs use some programs that are not installed by default. Use `sudo apt install curl feh scrot imagemagick fzf exuberant-ctags pulseaudio-utils` to install them.
* Install vim with `sudo apt install vim`.
* Install i3 with the instuctions [here](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/).
* Download a wallpaper and put it at `~/Downloads/wallpaper.jpg`. (TODO: change this)
* To let the i3status bar read volume from the correct device, follow the instuctions [here](https://i3wm.org/docs/i3status.html#_volume).
* For laptops, you may need to install a package so i3 can change the screen brightness. Depending on your device, `xbacklight` or `brightnessctl` might work. Install one of these packages, and the i3config will find it and use it.
