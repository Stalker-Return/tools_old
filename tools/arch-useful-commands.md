## Terminal Commands | Arch Linux
**Recomended videos:**<br/>
[Learn the Bash Command Line](https://www.youtube.com/watch?v=GFGImSdJNWk)
<br/>
[Using Pacman on Arch Linux: Everything you need to know](https://www.youtube.com/watch?v=-dEuXTMzRKs)
<br/>

**Remove package with all dependencies:**					<br/>
yay -Rns package-name								<br/>
sudo pacman -Rns package-name							<br/>

**Search:**									<br/>
yay -Sa package-name								<br/>
	
**Package information:**							<br/>
yay -Si package-name								<br/>
	
**Update packages:**								<br/>
sudo pacman -Syyu					# update only standard pkgs		<br/>
yay -Sua --noconfirm				# update only AUR pkgs			<br/>
yay -Syu --noconfirm				# update standard pkgs and AUR pkgs	<br/>
sudo rm /var/lib/pacman/db.lck		# remove pacman lock			<br/>
sudo pacman -Rns $(pacman -Qtdq)	# remove orphaned packages		<br/>

**Packages no longer required as dependencies:**				<br/>
pacman -Qdt
<br/>
**Packages explicitly installed and not required as dependencies:**		<br/>
pacman -Qet									<br/>

**List of Installed Packages**							<br/>
pacman -Q (pacman -Q >> /home/ed/Clouds/Dropbox/BackUps/Linux/tools/pacman_Q_list.txt)							<br/>
**list of AUR packages to be updated:**<br/>
yay -Pu
<br/>
**Remove unwanted dependencies:**<br/>
yay -Yc
<br/>
**Remove package:**<br/>
yay -R package-name 
<br/>
**Search for package:**<br/>
yay -Ss package-name
<br/>
**Clean package cache:**<br/>
paccache -r<br/>
ls /var/cache/pacman/pkg<br/> 
du -sh /var/cache/pacman/pkg/<br/>
<br/>
**Remove cached packages:**<br/>
sudo pacman -Scc
<br/>
**Find and Locate Your Files:**<br/>
find ~/Downloads/ -name "\*.pdf"<br/>
sudo find / -name mimeapps.list<br/>
sudo find / -type f -name "*Business*"<br/>
find -type d -name Downloads<br/>
sudo find / -type d -name Downloads<br/>
sudo find / -type d -name .icons <br/>
sudo find / -type d -name '\*icon*'<br/>
<br/>
**Find the text into files:**<br/>
sudo find /path/to/file/ -type f -name "*.xml" -exec grep -l "text" {} \; <br/>
sudo find /home/ed/Clouds/Dropbox/BackUps/Linux/ -type f -name "\*.apps" -exec grep -l "xdg-utils" {} \\; <br/>
<br/>
**Delete *.txt files from ~/Downloads/:**<br/>
find ~/Downloads/ -name "\*.txt" -exec rm {} \;<br/>
**Copy *.txt files from ~/Downloads/ to ~/Documents/:**<br/>
find ~/Downloads/ -name "\*.txt" -exec cp {} ~/Documents/ \;<br/>
<br/>
**Create Links:**<br/>
ln -s /usr/share/applications/org.keepassxc.KeePassXC.desktop /home/ed/Desktop<br/>
ln -s /home/name/Downloads /home/name/Desktop
<br/>
**Take a screenshot:**<br/>
gnome-screenshot -a --file=/home/ed/Pictures/screen.png<br/>
<br/>
**Create a bootable USB stick:**<br/>
sudo dd if=archlinux-2021.01.01-x86_64.iso of=/dev/sdb bs=1M status=progress<br/>
<br/>
**Send system notification:**<br/>
notify-send --urgency=critical --expire-time=3000 "Full System Update has completed"<br/>
<br/>
**mount / umount usb**<br/>
sudo mount -t ntfs /dev/sdb1 /mnt/sdb1 -o uid=1000,gid=1000,utf8,dmask=027,fmask=137<br/>
sudo umount /dev/sdb1<br/>
<br/>
**FFMPEG COMMANDS:**<br/>
**_Convert image to 5 sec. video:_** ffmpeg -loop 1 -i 01.png -t 5 out.mp4 <br/>
**_15 images to 30 Hz 5 sec. video:_** ffmpeg -r 3 -i %03d.png -r 30 out.mp4 <br/>
**_Resize video to 720p:_** ffmpeg -i input.webm -s 1280x720 output.webm <br/>
**_Concatenate videos:_** ffmpeg -f concat -i mylist.txt -c copy out.mp4 <br/>
**_Fade in the first 25 frames and fade out the last 25 frames of a 1000-frame video:_**<br/>
ffmpeg -i in.mp4 -vf 'fade=in:0:25, fade=out:975:25' out.mp4<br/>
**_Cut Up the video (get the fragment):_**<br/>
ffmpeg -ss 00:04:39.0 -i input.mp4 -c copy -t 00:02:06.0 output.mp4<br/>
**_Convert AVI to MP4:_** <br/>
ffmpeg -i input.avi -c:v libx264 -crf 19 -preset slow -c:a aac -b:a 192k -ac 2 output.mp4<br/>
**_Reduce MP4 size:_** <br/>
ffmpeg -i input.mp4 -acodec mp2 output.mkv<br/>
**_To set the second audio track as default_** <br/>
ffmpeg -i input.mkv -map 0:0 -map 0:2 -map 0:1 -disposition:a:0 default -disposition:a:1 none -c copy out.mkv<br/>
<br/>
**_Play Video with 2-nd audio track_** <br/>
ffplay -i input.avi -ast 2<br/>
**_Play Video with external subtitles str-file_** <br/>
ffplay -vf subtitles=filename.srt video.avi<br/>
**_Retrieve MP3 from YouTube:_**<br/>
youtube-dl --extract-audio --audio-format mp3<br/>
https://www.youtube.com/watch?v=th04azA3ueg&list=PLvLOVNjx9A5TweqxDRkDmbDzxqkVSDi7s&index=42<br/>
<br/>
**Remove password from .pdf**<br/>
qpdf --password=viktoria --decrypt V1484999002.pdf b.pdf<br/>
qpdf --password=viktoriia67 --decrypt 1472284018_2.pdf p2.pdf<br/>
<br/>
**Merge .pdf**<br/>
qpdf --empty --pages private-2020.pdf p.pdf -- pr.pdf<br/>
<br/>
**System**<br/>
lspci -k | grep -A 2 -E "(VGA|3D)"<br/>
systemctl --user list-timers<br/>
sudo systemctl list-timers<br/>
<br/>
**Create xdg menu**<br/>
xdg_menu --format openbox3 --root-menu /etc/xdg/menus/arch-applications.menu > ~/.confif/openbox/xdg-menu.xml<br/>
<br/>
**Mount Clouds**								<br/> 
google-drive-ocamlfuse ~/Clouds/GoogleDrive/					<br/>
rclone --vfs-cache-mode writes mount "onedrive":  ~/Clouds/OneDrive &		<br/>
rclone --vfs-cache-mode writes mount "mega": ~/megasync &			<br/>
rclone --vfs-cache-mode writes mount "grive": ~/Clouds/GoogleDrive/ &		<br/>
<br/>
**ls / exa** <br/>
exa -al --color=always --group-directories-first # my preferred listing <br/>
exa -a --color=always --group-directories-first  # all files and dirs <br/>
exa -l --color=always --group-directories-first  # long format <br/>
exa -aT --color=always --group-directories-first # tree listing <br/><br/>
<br/>
**Install from git**<br/>
git clone https://aur.archlinux.org/yay.git<br/>
cd yay<br/>
makepkg -sir --needed --noconfirm --skippgpcheck<br/>
rm -rf yay_install<br/>
<br/>
**Check for errors:**								<br/>
sudo systemctl --failed								<br/>
sudo journalctl -p 3 -xb							<br/>
sudo dmesg >> /home/ed/Clouds/Dropbox/BackUps/Linux/tools/dmesg.txt		<br/>
