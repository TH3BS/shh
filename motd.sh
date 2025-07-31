#!/bin/bash

# ألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
RESET='\033[0m'

clear
echo -e "${CYAN}"
echo -e "╔═════════════════════════════════════════════════════════════╗"
echo -e "║                                                             ║"
echo -e "║   ${YELLOW}██╗░░██╗██╗░░░██╗██╗░░░░░██╗░░░░░░██████╗░░██████╗${CYAN}    ║"
echo -e "║   ${YELLOW}██║░██╔╝╚██╗░██╔╝██║░░░░░██║░░░░░██╔══██╗██╔════╝${CYAN}    ║"
echo -e "║   ${YELLOW}█████═╝░░╚████╔╝░██║░░░░░██║░░░░░██║░░██║╚█████╗░${CYAN}    ║"
echo -e "║   ${YELLOW}██╔═██╗░░░╚██╔╝░░██║░░░░░██║░░░░░██║░░██║░╚═══██╗${CYAN}    ║"
echo -e "║   ${YELLOW}██║░╚██╗░░░██║░░░███████╗███████╗██████╔╝██████╔╝${CYAN}    ║"
echo -e "║   ${YELLOW}╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚══════╝╚═════╝░╚═════╝░${CYAN}    ║"
echo -e "║                                                             ║"
echo -e "║   ${WHITE}TH3BOSS VPS | Fast ⚡ Secure 🔒 Clean ☁️                        ${CYAN}║"
echo -e "║   ${WHITE}Telegram: https://t.me/TH3BOSS                                 ${CYAN}║"
echo -e "╚═════════════════════════════════════════════════════════════╝${RESET}"

# نظام التشغيل
OS=$(lsb_release -ds 2>/dev/null || grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# الرام
MEMORY=$(free -m | awk 'NR==2{printf "%sMB / %sMB (%.1f%%)", $3,$2,$3*100/$2 }')

# القرص
DISK=$(df -h / | awk 'NR==2{print $3" / "$2" ~ "$5}')

# المعالج
CORES=$(nproc)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", 100 - $8}')

# الوقت والتاريخ
DATE=$(date +"%Y/%m/%d - %I:%M:%S %p")

# مدة التشغيل
UPTIME=$(uptime -p | sed 's/up //')

# الحزم
PACKAGES=$(dpkg --get-selections | wc -l)

# اختبار الإنترنت
PING=$(ping -c1 8.8.8.8 &>/dev/null && echo "Connected ✅" || echo "No Internet ❌")

echo -e "${YELLOW}───────────────────────────────────────────────────────────────${RESET}"
echo -e "${BLUE}🌐 System     ${WHITE}» ${OS}"
echo -e "${BLUE}💾 Memory     ${WHITE}» ${MEMORY}"
echo -e "${BLUE}📀 Disk       ${WHITE}» ${DISK}"
echo -e "${BLUE}🧠 CPU        ${WHITE}» ${CORES} Core(s) ~ ${CPU_LOAD}%"
echo -e "${BLUE}📦 Packages   ${WHITE}» ${PACKAGES} installed"
echo -e "${BLUE}🌍 Internet   ${WHITE}» ${PING}"
echo -e "${BLUE}📆 Date       ${WHITE}» ${DATE}"
echo -e "${BLUE}⏳ Uptime     ${WHITE}» ${UPTIME}"
echo -e "${YELLOW}───────────────────────────────────────────────────────────────${RESET}"
echo -e "${GREEN}Welcome to ${WHITE}TH3BOSS VPS${GREEN} – Always Online ⚡️${RESET}"
