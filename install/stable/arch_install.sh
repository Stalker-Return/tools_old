#!/bin/bash
# date 03-06-2021, ver.4
clear
# Upload external functions
checkfile=./instfunc.sh
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
# Upload parameters
checkfile=./apps.conf
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || source $checkfile;
#
# Checking parameters
	case $typeinstall in
		"virtual" )	echo -e "${Green}Installation type: '$typeinstall'. Correct.${White}" && read -t 2 ;;
		"normal" )	echo -e "${Green}Installation type: '$typeinstall'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}Invalid option: '$typeinstall'. Exit in 5 sec ...${White}" && read -t 5
					exit 5;;
	esac
#
	case $shellinstall in
		"openbox" )		echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
		"lxde" )		echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
#		"kde" )			echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
#		"cinnamon" )	echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
#		"mate" )		echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
#		"flashback" )	echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
#		"xfce" )		echo -e "${Green}DE/WM type: '$shellinstall'. Correct.${White}" && read -t 2 ;;
		* )				echo -e "${Red}${BlinkOn}Invalid option: '$typeinstall'. Exit in 5 sec ...${White}${BlinkOff}" && read -t 5
						exit 5;;
	esac
#
	case $boottype in
		"mbr" )		echo -e "${Green}Boot type: '$boottype'. Correct.${White}" && read -t 2 ;;
		"uefi" )	echo -e "${Green}Boot type: '$boottype'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}Invalid option: '$boottype'. Exit in 5 sec ...${White}" && read -t 5
					exit 5;;
	esac
#
	case $bluetooth_set in
		"yes" )		echo -e "${Green}Bluetooth option: '$bluetooth_set'. Correct.${White}" && read -t 2 ;;
		"no" )		echo -e "${Green}Bluetooth option: '$bluetooth_set'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}${BlinkOn}Invalid option: '$bluetooth_set'. Exit in 5 sec ...${White}${BlinkOff}" && read -t 5
					exit 5;;
	esac
#
	case $cups_set in
		"yes" )		echo -e "${Green}Cups option: '$cups_set'. Correct.${White}" && read -t 2 ;;
		"no" )		echo -e "${Green}Cups option: '$cups_set'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}${BlinkOn}Invalid option: '$cups_set'. Exit in 5 sec...${White}${BlinkOff}" && read -t 5
					exit 5;;
	esac
#
	case $virtualbox_inst in
		"yes" )		echo -e "${Green}VirtualBox option: '$virtualbox_inst'. Correct.${White}" && read -t 2 ;;
		"no" )		echo -e "${Green}VirtualBox option: '$virtualbox_inst'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}${BlinkOn}Invalid option: '$cups_set'. Exit in 5 sec...${White}${BlinkOff}" && read -t 5
					exit 5;;
	esac
#
	case $dminstall in
		"lightdm" )	echo -e "${Green}Display Manager is: '$typeinstall'. Correct.${White}" && read -t 2 ;;
		"lxdm" )	echo -e "${Green}Display Manager is: '$typeinstall'. Correct.${White}" && read -t 2 ;;
		* )			echo -e "${Red}Invalid option: '$typeinstall'. Exit in 5 sec ...${White}" && read -t 5
					exit 5;;
	esac
#
# SWAP file for UEFI
	case $boottype in
		"mbr" ) echo -e "${Green}SWAP file for MBR exists. Nothing to do.${White}" && read -t 2 ;;
		"uefi" )
		echo -e "${Green}Creating SWAP file for UEFI.${White}" && read -t 2
		dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
		chmod 600 /swapfile
		mkswap /swapfile
		swapon /swapfile
		echo -e "/swapfile	none	swap	defaults	0 0" >> /etc/fstab
		clear
		echo -e "${Green}SWAP file created! Look at /etc/fstab. Press ENTER to continue...${White}" && read
		nano /etc/fstab
		;;
	esac
#
# Time zone config
clear
echo -e "${Green}Set up the Time zone and Localization.${White}" && read -t 2
ln -sf /usr/share/zoneinfo/$land/$city /etc/localtime
hwclock --systohc
echo -e "${Green}Time zone for $city created.${White}" && read -t 2
#
# Keyboard layout
clear
echo -e "${Green}Set up the keyboard layout.${White}" && read -t 2
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8\nuk_UA.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo -e "LANG=en_US.UTF-8" >> /etc/locale.conf
echo -e "${Green}The keyboard layout created.${White}" && read -t 2
#
clear
echo -e "${Green}Set up Network.${White}" && read -t 2
echo $hostname > /etc/hostname
( echo $hostpass; echo $hostpass ) | passwd
clear
echo -e "" >> /etc/hosts
echo -e "127.0.0.1	localhost" >> /etc/hosts
echo -e "::1		localhost" >> /etc/hosts
echo -e "127.0.1.1	$hostname.localdomain     $hostname" >> /etc/hosts
echo -e "${Green}Network configuration for $hostname created.${White}" && read -t 2
#
# Uncompile visudo
clear
echo -e "${Green}Uncompile # group wheel. Press any key to continue...${White}"  && read -rsn1
EDITOR=nano visudo
#
# Install GRUB
clear
	case $boottype in
		"mbr" )	echo -e "${Green}Creating GRUB for MBR.${White}" && read -t 2
				pacman -Syyy
				pacman -S grub --noconfirm
				grub-install /dev/sda && read -t 2 
				echo -e "${Green}GRUB succesfully installed.${White}" && read -t 5 ;;
		"uefi" ) echo -e "${Green}Creating GRUB for UEFI.${White}" && read -t 2
				 pacman -Syyy
				 pacman -S --noconfirm grub efibootmgr
				 grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB && read -t 2
				 echo -e "${Green}GRUB succesfully installed.${White}" && read -t 5 ;;
	esac
# Check GRUB config
clear
echo -e "${Green}Check GRUB configurations. Press any key to continue...${White}"  && read -rsn1
nano /etc/default/grub
clear
grub-mkconfig -o /boot/grub/grub.cfg
clear
echo -e "${Green}Grub for '$boottype' installed.${White}" && read -t 2
#
# Install initial apps
clear
checkfile=./initial.apps
[[ ! -f $checkfile ]] && { tput civis; echo -e "\e[0;33mFile $(basename -- "$checkfile") does not exist. \nExit in 5 sec.\e[0m"; read -t 5; tput cnorm; clear; exit 5; } || pacmanapps=$checkfile;
#
pacmaninstall
#
# Enable services
clear
echo -e "${Green}Apps installed. Now enable services.${White}" && read -t 2
systemctl enable NetworkManager
systemctl enable sshd
#
clear
	case $bluetooth_set in
		"yes" )	systemctl enable bluetooth
				echo -e "${Green}Bluetooth service enabled.${White}" && read -t 2 ;;
		"no" )	echo -e "${Green}Bluetooth service rejected.${White}" && read -t 2 ;;
	esac
#
clear
	case $cups_set in
		"yes" )	systemctl enable cups
				echo -e "${Green}Cups service enabled.${White}" && read -t 2 ;;
		"no" )	echo -e "${Green}Cups service rejected.${White}" && read -t 2 ;;
	esac
#
clear
echo -e "${Green}Services enabled, I believe.${White}" && read -t 2
#
# Add regular user
clear
echo -e "${Green}Add regular user.${White}" && read -t 2
useradd -m $username
( echo $userpass; echo $userpass ) | sudo passwd $username
groupadd -r autologin
#groupadd -r vboxusers
usermod -aG wheel,audio,video,optical,storage,autologin $username
groups $username
clear
echo -e "${Green}Groups for '$username'${White}" && read -t 2
groups $username && read -t 2
clear
#
# Create paccache.timer
echo -e "${Green}Create paccache.timer.${White}" && read -t 2
echo -e "[Unit]" >> /etc/systemd/system/paccache.timer
echo -e "Description=Clean-up old pacman pkg" >> /etc/systemd/system/paccache.timer
echo -e "" >> /etc/systemd/system/paccache.timer
echo -e "[Timer]" >> /etc/systemd/system/paccache.timer
echo -e "OnCalendar=monthly" >> /etc/systemd/system/paccache.timer
echo -e "Persistent=true" >> /etc/systemd/system/paccache.timer
echo -e "" >> /etc/systemd/system/paccache.timer
echo -e "[Install]" >> /etc/systemd/system/paccache.timer
echo -e "WantedBy=multi-user.target" >> /etc/systemd/system/paccache.timer
chmod 755 /etc/systemd/system/paccache.timer
systemctl enable paccache.timer
#
# Improve Perfomance
clear
journalctl --vacuum-size=30M
journalctl --verify
echo -e "${Green}Enable [*] [SystemMaxUse=30M] ${White}" 
echo -e "${Green}Enable [*] [SystemMaxFileSize=20M] ${White}"  && read -rsn1
nano /etc/systemd/journald.conf
#
# enable multilib
clear
echo -e "${Green}Enable [*] [multilib] ${White}"
echo -e "${Green}# Misc options ${White}"
echo -e "${Green}UseSyslog ${White}"
echo -e "${Green}Color ${White}"
echo -e "${Green}CheckSpace ${White}"
echo -e "${Green}VerbosePkgLists ${White}"  && read -rsn1

sudo nano /etc/pacman.conf
#
# Copy files to $HOME
clear
echo -e "${Green}Make folders for regular user '$username'${White}" && read -t 2
mkdir /home/$username/$dirname
cp -R ./* /home/$username/$dirname/
chown -R $username:$username /home/$username/$dirname/
chmod u=rw,og=r /home/$username/$dirname/*.apps
chmod u=rw,og=r /home/$username/$dirname/*.conf
chmod +x /home/$username/$dirname/*.sh
cp -R /home/$username/$dirname/apps.conf /home/$username/
chown $username:$username /home/$username/apps.conf
#
# Create folders at $HOME
mkdir /home/$username/Downloads && chown -R $username:$username /home/$username/Downloads
mkdir /home/$username/Documents && chown -R $username:$username /home/$username/Documents
mkdir /home/$username/Music && chown -R $username:$username /home/$username/Music
mkdir /home/$username/Pictures && chown -R $username:$username /home/$username/Pictures
mkdir /home/$username/Videos && chown -R $username:$username /home/$username/Videos
mkdir /home/$username/Public && chown -R $username:$username /home/$username/Public
mkdir /home/$username/portable && chown -R $username:$username /home/$username/portable
#
clear
echo -e "${Red}Done! Type exit, umount -a and 'shutdown now'.${White}"
#
exit
