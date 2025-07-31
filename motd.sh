#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
RESET='\033[0m'

clear

# Header Line
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${RESET}"
echo -e "${WHITE}     Welcome to your private VPS | Managed by ${GREEN}TH3BOSS${RESET}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${RESET}"

# System Info
OS=$(lsb_release -ds 2>/dev/null || grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
MEMORY=$(free -m | awk 'NR==2{printf "%sMB / %sMB (%.1f%%)", $3,$2,$3*100/$2 }')
DISK=$(df -h / | awk 'NR==2{print $3" / "$2" ~ "$5}')
CORES=$(nproc)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", 100 - $8}')
PACKAGES=$(dpkg --get-selections | wc -l)
PING=$(ping -c1 8.8.8.8 &>/dev/null && echo "Connected ✅" || echo "No Internet ❌")
DATE=$(date +"%Y/%m/%d - %I:%M:%S %p")
UPTIME=$(uptime -p | sed 's/up //')

# Output Info
echo -e "${BLUE} System    :${RESET} $OS"
echo -e "${BLUE} Memory    :${RESET} $MEMORY"
echo -e "${BLUE} Disk      :${RESET} $DISK"
echo -e "${BLUE} CPU       :${RESET} ${CORES} Core(s) ~ ${CPU_LOAD}%"
echo -e "${BLUE} Packages  :${RESET} $PACKAGES installed"
echo -e "${BLUE} Internet  :${RESET} $PING"
echo -e "${BLUE} Date      :${RESET} $DATE"
echo -e "${BLUE} Uptime    :${RESET} $UPTIME"

# Footer with channel credit
echo -e "${CYAN}───────────────────────────────────────────────────────────────${RESET}"
echo -e "${WHITE} Powered by ${GREEN}TH3BOSS VPS${WHITE} — Fast ⚡ Secure 🔒 Clean ☁️"
echo -e "${WHITE} Telegram Channel: ${CYAN}https://t.me/TH3BOSS${RESET}"
echo -e "${CYAN}───────────────────────────────────────────────────────────────${RESET}"
