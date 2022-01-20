#!/bin/bash
# date 22-07-2021, ver.5
#
clear
# Upload external functions
checkfile=./instfunc.sh
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload parameters
checkfile=./apps.conf
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
#
clear
# Mirrorlist update
echo -e "${Green}Update mirrorlist.${White}" && read -t 2
sudo reflector -f 10 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
#sudo reflector -c $country -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo -e "${Green}Mirrorlist updated${White}" && read -t 2
#
# XORG install 
clear
./xinstall.sh
#
clear
# AUR helper install
case $aurhelper in
	"yay" )		echo -e "${Green}Installing AUR-helper.${White}" && read -t 2
				git clone https://aur.archlinux.org/yay.git
				cd yay
				makepkg -sir --needed --noconfirm --skippgpcheck
				cd ..
				sudo rm -r yay
				yay -Y --gendb
				yay -Syu --devel
				yay -Y --devel --save ;;
	"paru" )	echo -e "${Green}Installing AUR-helper.${White}" && read -t 2
				git clone https://aur.archlinux.org/paru.git
				cd paru
				makepkg -sir --needed --noconfirm --skippgpcheck
				cd ..
				sudo rm -r paru ;;
esac
clear
echo -e "${Green}AUR-helper installed!${White}" && read -t 2
# Virtual box install
case $virtualbox_inst in
	"yes" )	case $typeinstall in
				"normal" )	sudo pacman -S --noconfirm virtualbox virtualbox-host-modules-arch
							yay -S --noconfirm virtualbox-ext-oracle
							sudo touch /etc/modules-load.d/virtualbox-host-modules-arch.conf ;;
				"virtual" ) sudo pacman -S virtualbox-guest-utils --noconfirm ;;
			esac	
			clear
			echo -e "${Green}Virtualbox Installation completed.${White}" && read -t 2 ;;
	"no" )	echo -e "${Green}Virtualbox Installation rejected.${White}" && read -t 2 ;;
esac
#
# DE / WM install
clear
echo -e "${Green}Installing '$shellinstall'.${White}" && read -t 2
#
case $shellinstall in
	"lxde" ) ./lxde/lxdeinstall.sh ;;
	"openbox" ) ./openbox/obinstall.sh ;;
#	"flashback" ) ./flashback/flashbackinstall.sh ;;
#	"xfce" ) ./xfce/xfceinstall.sh ;;
#	"cinnamon" ) ./cinnamon/cinnamoninstall.sh ;;
#	"kde" ) ./kde/kdeinstall.sh ;;
#	"mate" ) ./mate/mateinstall.sh ;;
esac
#
# Universal apps set install
./universal_apps.sh
#
# Autogenerate xdg-menu
xdg_menu --format openbox3 --root-menu /etc/xdg/menus/arch-applications.menu > $HOME/.config/openbox/xdg-menu.xml
#
clear
echo -e "${Green}Installation completed.${White}" && read -t 2
#
exit
