# Arch Linux install
**Look at:** [Arch-Wiki Installation guide](https://wiki.archlinux.org/index.php/installation_guide); [DistroTube](https://www.youtube.com/watch?v=PQgyW10xD8s); [Check List](https://docs.google.com/document/d/1IsTwkhYvYde9y3zTD1EscqockzdtdUYcItnAglYfZdU/edit)<br/>
_In the case of **UEFI**, look at: [Arch Linux Full Install on UEFI](https://www.youtube.com/watch?v=CX67oR5GjRc);_<br/>
## Srep (1). Establish the internet connection
**(1.1) WPA authenticator settings**<br/>
ip a<br/>
iwctl + device list + station wlan0 get-networks + station wlan0 connect **NETWORK NAME**<br/>
**_or alternatively:_**<br/>
ip link set wlp3s0 (or wlan0 for the first time) up<br/>
iw dev wlp3s0 scan | grep SSID<br/>
wpa_passphrase TP-Link_BE1C 90469992 > wpa_TP-Link_BE1C.conf<br/>
wpa_supplicant -B -i wlp3s0 -c wpa_TP-Link_BE1C.conf<br/>
dhclient wlp3s0<br/>
**(1.2) Check the Internet connection:**<br/>
ping google.com<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(1.3) Update the system clock:**<br/>
timedatectl set-ntp true<br/>
timedatectl status<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## Srep (2). Partition the disks
**(2.1) Clean the disk completely**<br/>
gdisk /dev/sda<br/>
push: 'x'<br/>
push: 'z'<br/>
push: 'y'<br/>
push: 'y'<br/>
lsblk<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(2.2) Make Partitions:**<br/>
**_option 1:_**<br/>
fdisk -l or lsblk<br/>
cfdisk (chose gpt for _**UEFI**_, dos for BIOS)<br/>
Partitions are recommended for BIOS: boot 128M; root 12-20G; swap 4+ G; home, the rest space<br/>
Partitions are recommended for UEFI: boot 128M; root 12-20G; the rest space<br/>
fdisk -l<br/>
**_option 2:_**<br/>
[fdisk /dev/sda](https://github.com/Stalker-Return/tools/blob/master/create_UEFI_partition.md) <br/>
look at [here](https://www.youtube.com/watch?v=CX67oR5GjRc), starting from 4 min. 05 sec.<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## (Step 3). Mount the file systems
**(3.1) BIOS** _(skip in the csase of UEFI)_<br/>
**Format partitions:**<br/>
mkfs.ext2  /dev/sda1 -L boot<br/>
mkfs.ext4  /dev/sda2 -L root<br/>
mkswap /dev/sda3 -L swap<br/>
mkfs.ext4  /dev/sda4 -L home<br/>
**Mount partitions:**<br/>
mount /dev/sda2 /mnt<br/>
mkdir /mnt/{boot,home}<br/>
mount /dev/sda1 /mnt/boot<br/>
swapon /dev/sda3<br/>
mount /dev/sda4 /mnt/home<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(3.2) UEFI** _(skip in the csase of BIOS)_<br/>
**Format partitions:**<br/>
mkfs.fat -F32 /dev/sda1<br/>
mkfs.ext4 /dev/sda2<br/>
mkfs.ext4 /dev/sda3<br/>
**Mount partitions:**<br/>
mount /dev/sda2 /mnt<br/>
mkdir /mnt/boot<br/>
mkdir /mnt/home<br/>
mount /dev/sda1 /mnt/boot<br/>
mount /dev/sda3 /mnt/home<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(3.3) Select the mirrors** _(optional: you can edit the mirror list whenever you want)_<br/>
nano /etc/pacman.d/mirrorlist<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## (Step 4.) Install the system and packages are necessary to establish the Internet
pacstrap /mnt base linux linux-firmware base-devel vim nano<br/>
genfstab -U /mnt >> /mnt/etc/fstab<br/>
**have a look at the fstab-file :** cat /mnt/etc/fstab<br/>
arch-chroot /mnt<br/>
pacman -Sy<br/>
<br/>
**KISS**:<br/>
cd opt<br/>
git clone https://github.com/Stalker-Return/tools.git /opt/tools<br/>
cd tools/install<br/>
sh arch_install.sh<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## (Step 5.) Set up network**<br/>
**5.1 Make swap-file for UEFI** _(skip in the csase of BIOS)_ <br/>
dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress<br/>
chmod 600 /swapfile<br/>
mkswap /swapfile<br/>
swapon /swapfile<br/>
if the **'swapfile has holes'-error** occurred, look at [here](https://github.com/Stalker-Return/tools/blob/master/swapfile_has_holes.md)
<br/>
nano /etc/fstab<br/>
/swapfile none swap defaults 0 0<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**5.2 Set up the Time zone and Localization**<br/>
ln -sf /usr/share/zoneinfo/Europe/Bratislava /etc/localtime<br/>
hwclock --systohc<br/>
nano /etc/locale.gen<br/>
Uncompile whatever you want:<br/>
en_US.UTF-8 UTF-8<br/>
ru_RU.UTF-8 UTF-8<br/>
**_or alternatively:_** echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen<br/>
locale-gen<br/>
nano /etc/locale.conf<br/>
LANG=en_US.UTF-8<br/>
**_or alternatively:_** echo -e "LANG=en_US.UTF-8" >> /etc/locale.conf<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**5.3 Set up Network**<br/>
**_Set the host name_** (host name = 'root')<br/>
nano /etc/hostname<br/>
**_or alternatively:_** echo "root" > /etc/hostname<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
nano /etc/hosts<br/>
127.0.0.1 <TAB> localhost<br/>
::1 <TAB> <TAB> localhost<br/>
127.0.1.1 <TAB> root.localdomain root<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_Set the password:_**<br/>
passwd<br/>
**_Add users_** (user name = 'ed') **_and groups:_**<br/>
useradd -m ed<br/>
passwd ed<br/>
usermod -aG wheel,audio,video,optical,storage ed<br/>
groups ed<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**_Uncompile # group wheel_**<br/>
EDITOR=nano visudo<br/>
add: ed ALL=(ALL) ALL<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## (Step 6). Install GRUB
**(6.1) GRUB for BIOS** _(skip in the csase of UEFI)_<br/>
pacman -Syyy<br/>
pacman -S grub<br/>
grub-install /dev/sda<br/>
grub-mkconfig -o /boot/grub/grub.cfg<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(6.2) GRUB for UEFI** _(skip in the csase of BIOS)_<br/>
pacman -Syyy<br/>
pacman -S grub efibootmgr<br/>
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB<br/>
grub-mkconfig -o /boot/grub/grub.cfg<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(6.3) Enable services**<br/>
pacman -Syyy<br/>
pacman -S wpa_supplicant dhclient iw dialog dosfstools networkmanager network-manager-applet wireless_tools linux-headers os-prober reflector cups bluez bluez-utils<br/>
systemctl enable NetworkManager<br/>
systemctl enable bluetooth<br/>
systemctl enable --now cups.service<br/>
systemctl enable --now cups.socket<br/>
systemctl enable --now cups.path<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(6.4) Finish and Reboot**<br/>
exit (chroot)<br/>
umount -a && umount -l /nmt<br/>
shutdown now (reboot)<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
## (Step 7). Install Applications
**(7.1) Install Xorg**<br/>
**To establish the internet connection:**<br/>
repeat the [Step 1](https://github.com/Stalker-Return/tools/blob/master/archlinux-install-details.md#srep-1-establish-the-internet-connection)<br/>
or run **nmtui** and 'Activate a connection'<br/>
pacman -Syu<br/>
reflector -c Slovakia -a 6 --sort rate --save /etc/pacman.d/mirrorlist<br/>
pacman -S xorg-server xorg-twm xorg-xinit xorg-xclock xf86-video-intel sudo<br/>
nano /etc/pacman.d/mirrorlist<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(7.2) Install [recomended apps](https://github.com/Stalker-Return/tools/blob/master/apps-install-archlinux.md)**<br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
**(7.3) Install DE or WM**<br/>
**Openbox:** pacman -S openbox obconf<br/>
to [autostart X](https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login) at login, edit [~/.bashrc](https://github.com/Stalker-Return/.dotfiles/blob/master/.bashrc)<br/>
to start openbox, put 'exec openbox-session' into [~/.xinitrx](https://github.com/Stalker-Return/.dotfiles/blob/master/.xinitrc)<br/>
<br/>
**LXDE** pacman -S lxde<br/>
systemctl enable lxdm.service<br/>
<br/>
**I3** pacman -S i3-wm i3lock i3status i3blocks dmenu <br/>
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br/>
