#!/bin/bash
# date 01-04-2021, ver.3
# load source
[[ -f ./apps.conf ]] && source ./apps.conf || echo -e "\e[1;31mFile ./apps.conf doesn't exist ...\e[0m";
[[ ! -f ./apps.conf ]] && exit || echo -e "\e[1;32mParameters Check ... \e[0m";
#
# Remove old rabbish
[[ -d $HOME/.dotfiles ]] && rm -r $HOME/.dotfiles || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -d $HOME/.config ]] && rm -r $HOME/.config || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -d $HOME/.local ]] && rm -r $HOME/.local || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -d $HOME/scripts ]] && rm -r $HOME/scripts || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -d $HOME/bin ]] && rm -r $HOME/bin || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.gitignore ]] && rm $HOME/.gitignore || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.bashrc ]] && rm $HOME/.bashrc || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/README.md ]] && rm $HOME/README.md || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.xprofile ]] && rm $HOME/.xprofile || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.xinitrc ]] && rm $HOME/.xinitrc || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.fehbg ]] && rm $HOME/.fehbg || echo -e "\e[1;93mNothing to do.\e[0m"
[[ -f $HOME/.xscreensaver ]] && rm $HOME/.xscreensaver || echo -e "\e[1;93mNothing to do.\e[0m"
#
# Clone dot-files
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/Stalker-Return/.dotfiles.git $HOME/.dotfiles
alias gitbr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
gitbr config status.showUntrackedFiles no
gitbr checkout
#
chmod +x ~/bin/*.sh; chmod +x ~/scripts/*.sh
#
# Enable user's timers
systemctl --user enable clean_journal.timer
systemctl --user enable del_cache.timer
systemctl --user enable github_dots.timer
systemctl --user enable github_tools.timer
systemctl --user enable pac_cache.timer
systemctl --user enable sys_update.timer
systemctl --user enable aur_update.timer
systemctl --user enable orphan_pack.timer
systemctl --user enable unwanted_dep.timer
systemctl --user enable mirrorlist.timer
systemctl --user enable xscreensaver
#
# If openbox, check autostart 
	case $shellinstall in
		"openbox" | "lxde" )
			echo -e "${Green}Done! Look at autostart. Press ENTER to continue ...${White}"  && read -t 2
			nano ~/.config/openbox/autostart
			echo -e "${Green}Done! Look at .xprofile. Press ENTER to continue ...${White}" && read -t 2
			nano ~/.xprofile
			;;
		* )	echo -e "${Green}Nothing to do.${White}"  && read -t 3 ;;
	esac
#
# Remove rubbish
sudo yes | rm -r /opt/tools
# sudo yes | rm -r $HOME/$dirname
# sudo yes | rm $HOME/apps.conf
# sudo yes | rm $HOME/list.txt
#
exit
