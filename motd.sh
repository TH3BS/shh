#!/bin/bash
SMAY='\033[0;36m' 
GREEN='\033[0;32m'
Yellow='\033[0;33m'
WHITEC='\033[01;91m'
CNIL='\033[0m'
echo -e "${GREEN}"
echo -e " ╔╦╗╦⠀╦ ═╗╔╗⠀╔═╗╔═╗╔═╗ ¦ Dev : T.ME/TH3BS  ⠀";
echo -e " ⠀║⠀╠═╣ ═╣╠╩╗║⠀║╚═╗╚═╗ ¦ Dev : T.ME/TH3BOSS⠀";
echo -e " ⠀╩⠀╩⠀╩ ═╝╚═╝╚═╝╚═╝╚═╝ ¦ Servers VPS TH3BOSS⠀";
echo -e "${Yellow}------------------------------------------------------${WHITEC}"
echo -e "| Seystem »» ${SMAY}"`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om 2>/dev/null`"${WHITEC}"
echo -e "| Memory »»» ${SMAY}"`free -m | awk 'NR==2{printf "%sMB/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'`"${WHITEC}"
echo -e "| HardDisk » ${SMAY}"`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`"${WHITEC}"
echo -e "| Cpu »»»»»» ${SMAY}"`grep -c processor /proc/cpuinfo`"Core ~ {"`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"%}${WHITEC}"
echo -e "| Date »»»»» ${SMAY}"`date +"%Y/%m/%d , %r"`"${WHITEC}"
echo -e "| Uptime »»» ${SMAY}"`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo -e "${Yellow}----------------------------------------------------------${CNIL}

Welcome To servers TH3BOSS VPS
" 
  
