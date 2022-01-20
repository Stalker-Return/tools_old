#!/bin/bash
clear
# Upload external functions
checkfile=./instfunc.sh
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload parameters
checkfile=./apps.conf
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload apps list
checkfile=./universal-pacman.apps
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || pacmanapps=$checkfile;
# Upload AUR apps list
checkfile=./universal-aur.apps
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || aurapps=$checkfile;
# Pacman apps install
sudopacmaninstall
# AUR apps install
aurinstall
# Disable the startup Libreoffice logo screen
[[ -e /etc/libreoffice/sofficerc ]] && sudo sed -i 's+Logo=1+Logo=0+g' /etc/libreoffice/sofficerc
# Dropbox install
clear
echo -e "\e[1;31mInstalling Dropbox\e[0m"
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
clear
echo -e "\e[1;31mApplication set installed. \e[0m" && read -t 2
#
exit
