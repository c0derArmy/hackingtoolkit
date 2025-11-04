#!/bin/bash

# HackingTool Shell Version 1.0
# A comprehensive security testing toolkit written in pure shell script
# For educational and authorized testing purposes only

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Installation path
TOOL_PATH="${HOME}/hackingtool-shell-data"

# Banner
show_banner() {
    clear
    echo -e "${PURPLE}${BOLD}"
    cat << "EOF"
   
    ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀ ██▓ ███▄    █   ▄████       ▄▄▄█████▓ ▒█████   ▒█████   ██▓     ██ ▄█▀ ██▓▄▄▄█████▓
▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██▒ ██ ▀█   █  ██▒ ▀█▒      ▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒     ██▄█▒ ▓██▒▓  ██▒ ▓▒
▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒██▒▓██  ▀█ ██▒▒██░▄▄▄░      ▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    ▓███▄░ ▒██▒▒ ▓██░ ▒░
░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░██░▓██▒  ▐▌██▒░▓█  ██▓      ░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░    ▓██ █▄ ░██░░ ▓██▓ ░ 
░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░██░▒██░   ▓██░░▒▓███▀▒        ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒▒██▒ █▄░██░  ▒██▒ ░ 
 ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░▓  ░ ▒░   ▒ ▒  ░▒   ▒         ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░▒ ▒▒ ▓▒░▓    ▒ ░░   
 ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ▒ ░░ ░░   ░ ▒░  ░   ░           ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░░ ░▒ ▒░ ▒ ░    ░    
 ░  ░░ ░  ░   ▒   ░        ░ ░░ ░  ▒ ░   ░   ░ ░ ░ ░   ░         ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   ░ ░░ ░  ▒ ░  ░      
 ░  ░  ░      ░  ░░ ░      ░  ░    ░           ░       ░                    ░ ░      ░ ░      ░  ░░  ░    ░           
                  ░                                                                                                   

EOF
    echo -e "${NC}"
    echo -e "${CYAN}${BOLD}                           Shell Version - For Educational Purposes Only${NC}"
    echo -e "${YELLOW}${BOLD}                           https://github.com/C0derArmy/hackingtoolkit${NC}"
    echo -e "${RED}${BOLD}                           ⚠ Please Don't Use For Illegal Activity ⚠${NC}"
    echo ""
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        echo -e "${GREEN}[+] Running with root privileges${NC}"
    else
        echo -e "${YELLOW}[!] Some tools may require root privileges${NC}"
    fi
}

# Create installation directory
setup_paths() {
    if [[ ! -d "$TOOL_PATH" ]]; then
        mkdir -p "$TOOL_PATH"
        echo -e "${GREEN}[+] Created installation directory: $TOOL_PATH${NC}"
    fi
    cd "$TOOL_PATH" || exit
}

# Pause function
pause() {
    echo ""
    echo -e "${CYAN}Press [Enter] to continue...${NC}"
    read -r
}

# Source all tool modules
source_modules() {
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    for module in "$script_dir"/modules/*.sh; do
        if [[ -f "$module" ]]; then
            source "$module"
        fi
    done
}

# Main Menu
main_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}                   MAIN MENU - SELECT TOOL                 ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN} 0)${NC}  Anonymously Hiding Tools"
        echo -e "${CYAN} 1)${NC}  Information Gathering Tools"
        echo -e "${CYAN} 2)${NC}  Wordlist Generator Tools"
        echo -e "${CYAN} 3)${NC}  Wireless Attack Tools"
        echo -e "${CYAN} 4)${NC}  SQL Injection Tools"
        echo -e "${CYAN} 5)${NC}  Phishing Attack Tools"
        echo -e "${CYAN} 6)${NC}  Web Attack Tools"
        echo -e "${CYAN} 7)${NC}  Post Exploitation Tools"
        echo -e "${CYAN} 8)${NC}  Forensic Tools"
        echo -e "${CYAN} 9)${NC}  Payload Creation Tools"
        echo -e "${CYAN}10)${NC}  Exploit Framework Tools"
        echo -e "${CYAN}11)${NC}  Reverse Engineering Tools"
        echo -e "${CYAN}12)${NC}  DDOS Attack Tools"
        echo -e "${CYAN}13)${NC}  Remote Administration Tools"
        echo -e "${CYAN}14)${NC}  XSS Attack Tools"
        echo -e "${CYAN}15)${NC}  Steganography Tools"
        echo -e "${CYAN}16)${NC}  Other Tools"
        echo -e "${CYAN}17)${NC}  Advanced Exploitation Tools"
        echo -e "${CYAN}18)${NC}  Cloud Security Tools"
        echo ""
        echo -e "${YELLOW}99)${NC}  Update or Exit"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            0) anonsurf_menu ;;
            1) info_gathering_menu ;;
            2) wordlist_menu ;;
            3) wireless_menu ;;
            4) sql_injection_menu ;;
            5) phishing_menu ;;
            6) web_attack_menu ;;
            7) post_exploitation_menu ;;
            8) forensic_menu ;;
            9) payload_menu ;;
            10) exploit_framework_menu ;;
            11) reverse_engineering_menu ;;
            12) ddos_menu ;;
            13) rat_menu ;;
            14) xss_menu ;;
            15) steganography_menu ;;
            16) other_tools_menu ;;
            17) advanced_exploitation_menu ;;
            18) cloud_security_menu ;;
            99) exit_tool ;;
            *) echo -e "${RED}[X] Invalid option${NC}"; pause ;;
        esac
    done
}

# Exit function
exit_tool() {
    clear
    show_banner
    echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${BOLD}${WHITE}            Thank you for using HackingTool!              ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${WHITE}              Stay Safe & Hack Responsibly!                ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    exit 0
}

# Initialize
check_root
source_modules
setup_paths
main_menu
