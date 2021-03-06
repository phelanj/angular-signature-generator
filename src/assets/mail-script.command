#!/bin/sh

cd /Users/$USER/Library/Mail/
mailData=$(ls | grep '^V[0-9]\+$' | cut -c2- | sort -n | tail -n1 | sed 's|^|V|') #Find the <V#> file with the largest number (Most likely 5)




cd $mailData/MailData/Signatures

sigFile=$(ls -rt *.mailsignature | tail -n 1) #Get the file name of the most recently modified signature file
echo " __  __  ____  _____"
echo '|  \/  |/ __ \|  __ \   /\'
echo '| \  / | |  | | |  | | /  \'
echo '| |\/| | |  | | |  | |/ /\ \'
echo '| |  | | |__| | |__| / ____ \'
echo '|_|  |_|\____/|_____/_/    \_\'

echo
echo -e "The most recently changed signature file was modified: \033[1m"
date -r $sigFile
echo -e '\033[0m'
echo "Is this the file you want to change? (y/n)"
read input


sed -i '' '7,$d' $sigFile #Delete everything past the first 5 or so lines

echo "Paste the html signature code that you copied from the website and press ENTER"
read -n 3000 input

echo $input >> $sigFile
chflags uchg $sigFile
echo "Quit out of mail app and reopen to see changes made to signature"
echo "Press ENTER to exit"
read input
