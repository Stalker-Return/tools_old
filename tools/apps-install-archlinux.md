## Apps installation (13/05)
**Minimal packages set**<br/>
pacman -Syyu<br/>
pacman -S feh lxterminal xterm alacritty pcmanfm pacman-contrib geany git man firefox lxtask lightdm lightdm-gtk-greeter openssh udisks2 gvfs ntfs-3g<br/>
**(!!!)** systemctl enable lightdm.service<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_System & settings packages:_** file-roller gucharmap lxappearance lxappearance-obconf xautolock lm_sensors pulseaudio pavucontrol dmidecode neofetch rofi gmrun blueman xdotool wavemon conky exa archlinux-xdg-menu dunst rsync zenity gsimplecal gsimplecal<br/>
**_Essentials:_** libreoffice hyphen virtualbox virtualbox-host-modules-arch doublecmd-qt5 rclone keepassxc linux-headers<br/>
**_Archivers:_** p7zip unrar zip unzip tar xz<br/>
**_Themes:_** arc-gtk-theme papirus-icon-theme ttf-freefont ttf-dejavu<br/>
**_Audio & Video & Graphics:_** vlc gimp ffmpeg scrot deadbeef youtube-dl audacity obs-studio<br/>
**_Internet & Messengers:_** thunderbird signal-desktop telegram-desktop<br/>
**_Utils:_** wget galculator transmission-cli htop grub-customizer qpdf<br/>
**_Tint2 & components:_** tint2 arandr pasystray <br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_Install from git_**<br/>
git clone https://aur.archlinux.org/paru.git<br/>
cd paru<br/>
makepkg -sir --needed --noconfirm --skippgpcheck<br/>
<br/>
**GIT Packages (paru):**<br/>
**_Essentials:_** masterpdfeditor-free virtualbox-ext-oracle freefilesync-bin <br/>
**_System & settings packages:_** obmenu networkmanager-dmenu-git stacer i3lock-color rof-git fbxkb ttf-ms-fonts qogir-gtk-theme flat-remix powerkit<br/>
**_Internet & Messengers:_** zoom google-chrome megasync dropbox-cli pcloud-drive anydesk-bin whatsapp-nativefier skypeforlinux-stable-bin viber grive-git tor-browser <br/>
**(!!!)** If dropbox-cli is not installed through yay, try to follow the instruction [here](https://www.dropbox.com/install?os=lnx)<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
mkdir /home/ed/.config/openbox<br/>
Make file [autostart](https://github.com/Stalker-Return/.openbox/blob/master/.config/openbox/autostart)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Virtualbox extentions:**<br/>
**Install:** virtualbox virtualbox-ext-oracle virtualbox-host-modules-arch<br/>
sudo usermod -aG vboxusers ed & sudo gpasswd -a ed vboxusers<br/>
To prevent VirtualBox modules to be automatically loaded at boot time, create an empty file:<br/>
sudo nano /etc/modules-load.d/virtualbox-host-modules-arch.conf <br/>
**To load the module manually, run:** modprobe vboxdrv<br/>
<br/>
**Xorg config**<br/>
nvidia-utils
nvidia-390xx-dkms
sudo ln -sf /home/ed/.config/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d<br/>
sudo ln -sf /home/ed/.config/xorg.conf.d/10-monitor.conf /etc/X11/xorg.conf.d<br/>
<br/>
**NVIDIA**<br/>
journalctl -xf<br/>
MODULES=( i915 nvidia nvidia_drm nvidia_modeset nvidia_uvm )<br/>
<br/>
**Touchpad**<br/>
(!!!) xf86-input-synaptics  is no longer actively updated, so unistall it, use [libinput](https://wiki.archlinux.org/index.php/Libinput#Installation) instead <br/>
sudo cp -i /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d<br/>
<br/>
**Set timers:**<br/>
cronie<br/>
sudo systemctl enable cronie.service<br/>
crontab -e & make [timers](https://github.com/Stalker-Return/tools/blob/master/cronie_timers.txt) or run: **crontab ~/Clouds/Dropbox/BackUps/Linux/tools/cronie_timers.txt** <br/>
check status: systemctl status cronie<br/>
<br/>
**Uncomment:**<br/>
sudo nano /etc/pacman.conf<br/>
[multilib]<br/>
Include = /etc/pacman.d/mirrorlist<br/>
<br/>
**Hot keys setup:**<br/>
$HOME/.config/openbox/[rc.xml](https://github.com/Stalker-Return/.dotfiles/blob/master/.config/openbox/rc.xml)<br/>
<br/>
**Configure root-menu**<br/>
$HOME/.config/openbox/[menu.xml](https://github.com/Stalker-Return/.dotfiles/blob/master/.config/openbox/menu.xml)<br/>
<br/>
[Lightdm autologin](https://www.maketecheasier.com/enable-autologin-lightdm/)<br/>
make autologin group<br/>
<br/>
**Configure libreoffice**<br/>
sudo nano /etc/libreoffice/sofficerc<br/>
Logo=0<br/>
<br/>
**Configure GRUB**<br/>
sudo nano /etc/default/grub<br/>
sudo grub-mkconfig -o /boot/grub/grub.cfg<br/>
<br/>
**Autologin tty1**<br/>
sudo nano /etc/systemd/system/getty.target.wants/getty\@tty1.service<br/>
Add to the end:<br/>
[Service]<br/>
ExecStart=<br/>
ExecStart=-/usr/bin/agetty --autologin USERNAME --noclear %I $TERM<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Optional :** <br/>
leafpad okular nitrogen bpytop ibus menumaker plank oblogout jgmenu psuinfo plank-theme-arc xscreensaver emacs t2ec pragha samba pdfstudio-bin gnome-screenshot orage dirsyncpro cbatticon <br/>
teamviewer opera cozy ppp ulauncher psuinfo imagemagick compton picom 4kvideodownloader rhythmbox gparted hplip mirage kazam dmenu<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Important check points:**<br/>
mount usb: udisks2 + gvfs + ntfs-3g<br/>
hotkeys: sudo nano **~/.config/openbox/rc.xml**<br/>
default apps: sudo nano **~/.config/mimeapps.list**<br/>
key layout hotkey & indicator: setxkbmap + fbxkb >> autpstart<br/>
system tray applet for pulseAudio: pasystray >> autostart<br/>
network indicator: nm-applet >> autostart<br/>
system tray for battery: **powerkit &** >> autostart, or altirnatively: cbatticon >> autostart<br/>
lockscreen: i3lock + xautolock<br/>
wallpapers: feh --bg-scale /home/ed/.local/share/wallpapers/fehbg/screen.jpg >> autostart<br/>
network manager: networkmanager-dmenu-git + dmenu<br/>
system notifier: dunst (look at [dunstrc](https://addy-dclxvi.github.io/post/dunst/))<br/>
grub settings: grub-customizer grub-theme-vimix<br/>
image viwer: feh.desktop: Exec=/usr/bin/feh -B white -g 800x600 -d -. %f<br/>
(!!!) to generate xdg-menu, run: **xdg_menu --format openbox3 --root-menu /etc/xdg/menus/arch-applications.menu > xdg-menu.xml**<br/>
bluetoth: blueman<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
