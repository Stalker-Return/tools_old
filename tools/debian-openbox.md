## Notes to setup debian openbox
**look at:** [DistroTube](https://www.youtube.com/watch?v=_FZCXVgiORA&t=208s), [Debian + openbox. Настройка.](https://www.youtube.com/watch?v=igmkxjBxwLU), [Debian 10 Buster](https://www.youtube.com/watch?v=Te85Rxbqp9c)<br/>
<br/>
**install (su command | roor user):**<br/>
apt install sudo<br/>
adduser ed sudo<br/>
[if adduser command not found...](https://devconnected.com/how-to-add-and-delete-users-on-debian-10-buster/#adduser_command_not_found_on_Debian)
<br/><br/>
**install (user)**<br/>
sudo apt install:<br/>
xserver-xorg-video-intel x11-xserver-utils x11-utils xinit<br/>
openbox obconf obmenu lxterminal pcmanfm tint2 plank synaptic leafpad, obsession<br/>
lightdm chromium lxappearance lxappearance-obconf pulseaudio pavucontrol volti parcellite imagemagick<br/>
ibus gksudo  wicd gmrun htop nitrogen file-roller gucharmap galculator<br/>
<br/>
**!!!** leafpad from deb repository<br/>
**!!!** compton https://gitlab.com/dwt1/dotfiles<br/>
then: **setup: plank --preference**<br/>
**who knows:** termite, gksu, [zip](https://packages.debian.org/stretch/p7zip-full)<br/>
<br/>
**Setup monitor resolution**<br/>
xrandr -d 0:<br/>
xrandr -s 1360x768 &<br/>
<br/>
sudo cp /etc/xdg/openbox/* .config/openbox/<br/>
ls -l .config/openbox/<br/>
sudo chown ed:ed .config/openbox/*<br/>
