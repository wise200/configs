# configs
Justin Wise's Ubuntu Configuration Files

### Instructions
On a fresh Ubuntu system, you should
* Connect all devices, wifi, etc. This will be easier in the default wm.
* The vim and i3 configs use some programs that are not installed by default. Use `sudo apt install curl feh scrot imagemagick fzf exuberant-ctags pulseaudio-utils` to install them.
* If you want it, install vim with `sudo apt install vim`.
* Install neovim with
```bash
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install nvim

# language servers for nvim
npm install -g pyright
sudo apt install clangd-12
cargo install svls
R -e "install.packages('languageserver')"
```
* Install i3 with the instuctions [here](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/).
* Download a wallpaper and put it at `~/Downloads/wallpaper.jpg`. (TODO: change this)
* To let the i3status bar read volume from the correct device, follow the instuctions [here](https://i3wm.org/docs/i3status.html#_volume).
* To enable the global gitignore, run `git config --global core.excludesfile ~/.gitignore`. (Info [here](https://stackoverflow.com/questions/4824188/git-ignore-vim-temporary-files)).

#### Laptops
If your device is a laptop, you should also do the following:
* You will need to install a package so i3 can change the screen brightness. Depending on your device, `xbacklight` or `brightnessctl` might work. Install one of these packages, and the i3config will find it and use it.
* To get "natural" scrolling on your touchpad, follow the instructions [here](https://askubuntu.com/questions/1122513/how-to-add-natural-inverted-mouse-scrolling-in-i3-window-manager).
