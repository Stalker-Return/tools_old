#!/bin/bash
#
### Set Colors
Red="\e[1;31m"
Green="\e[0;32m"
Yellow="\e[0;33m"
Blue="\e[1;34m"
Pink="\e[1;35m"
Cyan="\e[1;36m"
White="\e[0;37m"
Black="\e[0;30m"
BlinkOn="\033[5m"
BlinkOff="\e[0m"
RedBG="\e[1;41m"
GreenBG="\e[0;42m"
YellowBG="\e[0;43m"
BlueBG="\e[1;44m"
PinkBG="\e[1;45m"
CyanBG="\e[1;46m"
WhiteBG="\e[0;47m"
BlackBG="\e[0;40m"
#
# sudo pacman -S apps install
function sudopacmaninstall() {
	sudo pacman -Syyy
	sudo pacman -Syu
	while read line
	do	clear
		firstCharacter=${line:0:1}
		secondCharacter=${line:1:1}
		numCharacter=${#line}-1
		packagename=${line:1:$numCharacter}
		case $firstCharacter in
			"#")	case $secondCharacter in
						"#")	echo -e "\e[1;32m--- $line set ---\e[0m" ;;
						*)		echo -e "\e[1;37mSkip to install $packagename \e[0m" ;;
					esac ;;
			*)		set -- $line
					apptoinstall=$1
					echo -e "\e[1;31mInstalling $line\e[0m"
					sudo pacman -S --noconfirm --needed $apptoinstall ;;
		esac
	done < $pacmanapps
}
#
# pacman -S apps install
function pacmaninstall() {
	sudo pacman -Syyy
	sudo pacman -Syu
	while read line
	do	clear
		firstCharacter=${line:0:1}
		secondCharacter=${line:1:1}
		numCharacter=${#line}-1
		packagename=${line:1:$numCharacter}
		case $firstCharacter in
			"#")	case $secondCharacter in
						"#") echo -e "\e[1;32m--- $line set ---\e[0m" ;;
						*) echo -e "\e[1;37mSkip to install $packagename \e[0m" ;;
					esac ;;
			*)		set -- $line
					apptoinstall=$1
					echo -e "\e[1;31mInstalling $line\e[0m"
					pacman -S --noconfirm --needed $apptoinstall ;;
		esac
	done < $pacmanapps
}
#
# AUR apps install
function aurinstall() {
	sudo pacman -Syyy
	yay -Syu
	while read line
	do	clear
		firstCharacter=${line:0:1}
		secondCharacter=${line:1:1}
		numCharacter=${#line}-1
		packagename=${line:1:$numCharacter}
		case $firstCharacter in
			"#" ) case $secondCharacter in
					"#" ) echo -e "\e[1;32m--- $line set ---\e[0m" ;;
					* ) echo -e "\e[1;37mSkip to install $packagename \e[0m" ;;
				  esac ;;
			*)		set -- $line
					apptoinstall=$1
					echo -e "\e[1;31mInstalling $line\e[0m"
					yay -S --noconfirm --needed $apptoinstall ;;
		esac
	done < $aurapps
}
