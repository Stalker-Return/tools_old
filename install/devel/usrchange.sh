#!/bin/bash
#
# Replace user name
# find files with "/home/ed/"
grep -rl "/home/ed/" $HOME/ >> ./list.txt
[[ -f ./list.txt ]] && filelist='./list.txt' || echo -e "\e[1;93mNothing to do \e[0m"
# replace with 'sed'
while read filename
do
	sed -i 's+/home/ed/+/home/fuck/+g' $filename
done < $filelist
#
exit
