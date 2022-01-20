## Openbox installation
**_pacman -Syyu_**<br/>
**_pacman -S <packages>_**<br/>
**_Openbox packages:_** openbox obconf feh lxterminal xterm pcmanfm geany git firefox lxtask lightdm lightdm-gtk-greeter openssh orage udisks2 gvfs ntfs-3g<br/>
**(!!!)** systemctl enable lightdm.service<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_System & settings packages:_** file-roller gucharmap lxappearance lxappearance-obconf dunst zenity cbatticon xautolock lm_sensors pulseaudio pavucontrol dmidecode neofetch p7zip unrar unzip<br/>
**_Essentials:_** libreoffice hyphen virtualbox doublecmd-gtk2 rclone keepassxc<br/>
**_Themes:_** arc-gtk-theme papirus-icon-theme ttf-freefont ttf-dejavu<br/>
**_Audio & Video & Graphics:_** vlc gimp ffmpeg gnome-screenshot deadbeef youtube-dl<br/>
**_Internet & Messengers:_** chromium opera signal-desktop telegram-desktop<br/>
**_Utils:_** wget galculator transmission-cli htop grub-customizer qpdf<br/>
**_Tint2 & components:_** tint2 arandr pasystray<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_Install from git_**<br/>
git clone https://aur.archlinux.org/yay.git<br/>
cd yay<br/>
makepkg -sir --needed --noconfirm --skippgpcheck<br/>

**GIT Packages (yay):**
**_Essentials:_** masterpdfeditor-free mirage virtualbox-ext-oracle
**_System & settings packages:_** obmenu stacer i3lock-color rof-git dirsyncpro fbxkb
**_Internet & Messengers:_** zoom megasync dropbox-cli pcloud-drive anydesk-bin whatsapp-for-linux skypeforlinux-stable-bin viber grive-git ttf-ms-fonts qogir-gtk-theme <br/>
**(!!!)** If dropbox-cli is not installed through yay, try to follow the instruction [here](https://www.dropbox.com/install?os=lnx)<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
mkdir /home/ed/.config/openbox<br/>
Make file [autostart](https://github.com/Stalker-Return/.openbox/blob/master/.config/openbox/autostart)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Virtualbox extentions:**<br/>
Install: virtualbox virtualbox-ext-oracle virtualbox-host-modules-arch
sudo usermod -aG vboxusers ed & sudo gpasswd -a ed vboxusers<br/>
To prevent VirtualBox modules to be automatically loaded at boot time, mask the default /usr/lib/modules-load.d/virtualbox-host-modules-arch.conf<br/>
**To load the module manually, run:** modprobe vboxdrv<br/>

**Xorg config**<br/>
sudo ln -sf /home/ed/.config/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d<br/>
sudo ln -sf /home/ed/.config/xorg.conf.d/10-monitor.conf /etc/X11/xorg.conf.d<br/>

**Uncomment:**<br/>
sudo nano /etc/pacman.conf<br/>
# [multilib]<br/>
# Include = /etc/pacman.d/mirrorlist<br/>

**Hot keys setup:**<br/>
$HOME/.config/openbox/[rc.xml](https://github.com/Stalker-Return/.dotfiles/blob/master/.config/openbox/rc.xml)<br/>

**Configure root-menu**<br/>
$HOME/.config/openbox/[menu.xml](https://github.com/Stalker-Return/.dotfiles/blob/master/.config/openbox/menu.xml)<br/>

[Lightdm autologin](https://www.maketecheasier.com/enable-autologin-lightdm/)<br/>
make autologin group<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Optional** leafpad okular nitrogen ibus menumaker kazam plank oblogout pacman-contrib jgmenu psuinfo plank-theme-arc xscreensaver emacs psuinfo powerkit t2ec pragha 4kvideodownloader rhythmbox gparted teamviewer thunderbird cozy ppp psuinfo imagemagick compton picom<br/>
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Check points:**<br/>
mount usb - done (udisks2 + gvfs + ntfs-3g)<br/>
hotkeys - done (/home/ed/.config/openbox/rc.xml)<br/>
key layout hotkey & indicator - done (setxkbmap + fbxkb >> autpstart)<br/>
audacy - done (pavucontrol >> tint2)<br/>
network indicator - done (nm-applet >> autostart)<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
