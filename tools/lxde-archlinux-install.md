## LXDE full package installation
pacman -Syyu<br/>
pacman -Sy lxde<br/>
systemctl enable lxdm.service<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_Essentials:_** libreoffice hyphen virtualbox pacman-contrib doublecmd-qt5 pragha okular geany git rclone keepassxc<br/>
**_Internet & Messengers:_** firefox chromium opera signal-desktop telegram-desktop<br/>
**_Utils:_** obconf wget galculator transmission-cli htop neofetch grub-customizer udisks2 gvfs ntfs-3g dmidecode qpdf<br/>
**_Archivers:_** p7zip unrar unzip<br/>
**_Audio & Video & Graphics:_** vlc gimp ffmpeg pulseaudio pavucontrol xscreensaver gnome-screenshot rhythmbox<br/>
**_Themes & Fonts:_** arc-gtk-theme papirus-icon-theme ttf-freefont ttf-dejavu<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Optional** 4k video downloader kazam gparted teamviewer thunderbird cozy leafpad emacs<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_GIT Packages (yay):_** masterpdfeditor-free megasync dropbox-cli pcloud-drive anydesk-bin skypeforlinux-stable-bin virtualbox-ext-oracle viber grive-git ttf-ms-fonts qogir-gtk-theme dirsyncpro<br/>
If dropbox-cli is not installed through yay, try to follow the instruction [here](https://www.dropbox.com/install?os=lnx)<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**Default apps:**
sudo nano /home/ed/.config/mimeapps.list<br/>
**Hot keys setup:**
/home/ed/.config/openbox/lxde-rc.xml<br/>
**Virtualbox extentions:**
sudo usermod -aG vboxusers ed & sudo gpasswd -a ed vboxusers<br/>
**LXDM autologin:**
sudo nano /etc/lxdm/lxdm.conf<br/>
