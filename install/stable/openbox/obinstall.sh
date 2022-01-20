#!/bin/bash
clear
# Upload external functions
checkfile=./instfunc.sh
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload parameters
checkfile=./apps.conf
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload apps list
checkfile=./openbox/openbox-pacman.apps
[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || pacmanapps=$checkfile;
# Upload AUR apps list
checkfile=./openbox/openbox-aur.apps
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || aurapps=$checkfile;
# Pacman apps install
sudopacmaninstall
#
# AUR apps install
aurinstall
# enable Display Manager Service
case $dminstall in
	"lightdm" )	sudo systemctl enable lightdm.service
				clear
				echo -e "${Green}Openbox installed! Look at lightdm.service. Press ENTER to continue ...${White}"
				read
				sudo nano /etc/lightdm/lightdm.conf
				;;
	"lxdm" )	sudo systemctl enable lxdm.service
				echo -e "${Green}Openbox installed! Look at lxdm.service. Press ENTER to continue ...${White}"
				read
				sudo nano /etc/lxdm/lxdm.conf
				;;
esac
#
exit
