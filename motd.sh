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

# شعار بسيط TH3BOSS
echo -e "${GREEN}████████╗██╗  ██╗ ██████╗ ██████╗  ██████╗ ███████╗${RESET}"
echo -e "${GREEN}╚══██╔══╝██║  ██║██╔═══██╗██╔══██╗██╔═══██╗██╔════╝${RESET}"
echo -e "${GREEN}   ██║   ███████║██║   ██║██████╔╝██║   ██║█████╗  ${RESET}"
echo -e "${GREEN}   ██║   ██╔══██║██║   ██║██╔═══╝ ██║   ██║██╔══╝  ${RESET}"
echo -e "${GREEN}   ██║   ██║  ██║╚██████╔╝██║     ╚██████╔╝███████╗${RESET}"
echo -e "${GREEN}   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝      ╚═════╝ ╚══════╝${RESET}"
echo

echo -e "${CYAN}╔═════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║${RESET}$(printf ' %.0s' {1..59})${CYAN}║${RESET}"
echo -e "${CYAN}║${RESET}  ${GREEN}Welcome to Your VPS Management Panel${RESET}$(printf ' %.0s' {1..26})${CYAN}║${RESET}"
echo -e "${CYAN}║${RESET}$(printf ' %.0s' {1..59})${CYAN}║${RESET}"
echo -e "${CYAN}╠═════════════════════════════════════════════════════════════╣${RESET}"

# النظام
OS=$(lsb_release -ds 2>/dev/null || grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
echo -e "${BLUE}║${RESET} ${YELLOW}System:${RESET}  ${WHITE}$OS${RESET}$(printf ' %.0s' {1..37})${CYAN}║${RESET}"

# الذاكرة
MEMORY=$(free -m | awk 'NR==2{printf "%sMB / %sMB (%.1f%%)", $3,$2,$3*100/$2 }')
echo -e "${BLUE}║${RESET} ${YELLOW}Memory:${RESET}  ${WHITE}$MEMORY${RESET}$(printf ' %.0s' {1..38})${CYAN}║${RESET}"

# القرص
DISK=$(df -h / | awk 'NR==2{print $3" / "$2" ~ "$5}')
echo -e "${BLUE}║${RESET} ${YELLOW}Disk:${RESET}    ${WHITE}$DISK${RESET}$(printf ' %.0s' {1..40})${CYAN}║${RESET}"

# المعالج
CORES=$(nproc)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f", 100 - $8}')
echo -e "${BLUE}║${RESET} ${YELLOW}CPU:${RESET}     ${WHITE}${CORES} Core(s) ~ ${CPU_LOAD}%${RESET}$(printf ' %.0s' {1..33})${CYAN}║${RESET}"

# الحزم
PACKAGES=$(dpkg --get-selections | wc -l)
echo -e "${BLUE}║${RESET} ${YELLOW}Packages:${RESET} ${WHITE}${PACKAGES} installed${RESET}$(printf ' %.0s' {1..30})${CYAN}║${RESET}"

# الانترنت
PING=$(ping -c1 8.8.8.8 &>/dev/null && echo "Connected ✅" || echo "No Internet ❌")
echo -e "${BLUE}║${RESET} ${YELLOW}Internet:${RESET} ${WHITE}$PING${RESET}$(printf ' %.0s' {1..34})${CYAN}║${RESET}"

# الوقت
DATE=$(date +"%Y/%m/%d - %I:%M:%S %p")
echo -e "${BLUE}║${RESET} ${YELLOW}Date:${RESET}    ${WHITE}$DATE${RESET}$(printf ' %.0s' {1..39})${CYAN}║${RESET}"

# مدة التشغيل
UPTIME=$(uptime -p | sed 's/up //')
echo -e "${BLUE}║${RESET} ${YELLOW}Uptime:${RESET}  ${WHITE}$UPTIME${RESET}$(printf ' %.0s' {1..37})${CYAN}║${RESET}"

echo -e "${CYAN}╚═════════════════════════════════════════════════════════════╝${RESET}"
echo -e "${GREEN}                   Always Online ⚡️  |  Secure & Fast VPS${RESET}"
