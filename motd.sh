#!/bin/bash

# ألوان
SMAY='\033[0;36m' 
GREEN='\033[0;32m'
Yellow='\033[0;33m'
WHITEC='\033[01;91m'
CNIL='\033[0m'

clear
echo -e "${GREEN}"
echo -e " ╔════════════════════════════════════════════════╗"
echo -e " ║        ${Yellow}🖥️  TH3BOSS VPS MANAGEMENT PANEL         ${GREEN}║"
echo -e " ╠════════════════════════════════════════════════╣"
echo -e " ║ ${SMAY}Telegram: https://t.me/TH3BOSS   ${GREEN}║"
echo -e " ║ ${SMAY}Services: Fast - Secure - Clean VPS   ${GREEN}║"
echo -e " ╚════════════════════════════════════════════════╝"
echo -e "${Yellow}------------------------------------------------------${WHITEC}"

# النظام
echo -e "| System »» ${SMAY}$(lsb_release -ds 2>/dev/null || grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')${WHITEC}"

# الرام
echo -e "| Memory »»» ${SMAY}$(free -m | awk 'NR==2{printf "%sMB/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')${WHITEC}"

# القرص
echo -e "| HardDisk » ${SMAY}$(df -h / | awk 'NR==2{print $3"/"$2" ~ {"$5"}"}')${WHITEC}"

# المعالج
CORES=$(nproc)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo -e "| CPU »»»»»» ${SMAY}${CORES} Core ~ {${CPU_USAGE}%}${WHITEC}"

# الوقت
echo -e "| Date »»»»» ${SMAY}$(date +"%Y/%m/%d , %r")${WHITEC}"

# مدة التشغيل
UPTIME=$(uptime -p | sed 's/up //')
echo -e "| Uptime »»» ${SMAY}${UPTIME}${WHITEC}"

# عدد الحزم
PKGS=$(dpkg --get-selections | wc -l)
echo -e "| Packages »» ${SMAY}${PKGS} installed${WHITEC}"

# اختبار الإنترنت
PING=$(ping -c1 8.8.8.8 > /dev/null 2>&1 && echo "Connected ✅" || echo "No Internet ❌")
echo -e "| Internet »» ${SMAY}${PING}${WHITEC}"

echo -e "${Yellow}----------------------------------------------------------${CNIL}"
echo -e "\n${GREEN}Welcome to ${WHITEC}TH3BOSS VPS${GREEN} – Always Online ⚡️${CNIL}"
