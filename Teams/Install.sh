#!/bin/bash

BLINK='\033[5;96m'
RED='\033[0;31m'
GREEN='\033[1;92m'
CYAN='\033[1;96m'
PURPLE='\033[0;95m'
NC='\033[0m'  #NC stands for NoColour here

progress-bar() {  #A loading bar that takes time in seconds as a parameter.
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "${PURPLE}▇${NC}"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "${PURPLE}| %s%%${NC}" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

echo -e "${BLINK}The installation is running! Please wait...${NC}"
progress-bar 20 #Twenty is the time until the countdown is finished.
sudo cp -f ~/Desktop/Teams/Teams/Teams/msteams.png /usr/share/pixmaps/msteams.png& #Here the PNG is copied from the icon to pixmaps
sudo cp -f ~/Desktop/Teams/Teams/Teams/Teams.desktop ~/Desktop/Teams.desktop& 	#The desktop file is copied
sudo cp -fR ~/Desktop/Teams/Teams/Teams ~/Documents/Teams& 	 #The folder with the team script is copied
sudo chmod a+x ~/Desktop/Teams.desktop&  #The desktop file is made executable
sudo chmod a+x ~/Documents/Teams/Teams.sh& #The team script is made executable
sleep 0.5 #Delay to prevent the folder from being deleted prematurely (without this, the folder will be deleted before the previous commands are completed!)
sudo rm -r ~/Desktop/Teams&  #The folder copied to the desktop is deleted here.
echo -e "${CYAN}The installation process was${NC} ${GREEN}completed!${NC}"
sleep 2
clear
exit
