#!/bin/bash

# Web Attack Tools Module

web_attack_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}                WEB ATTACK TOOLS                          ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Burp Suite - Web Vulnerability Scanner"
        echo -e "${CYAN}2)${NC} Nikto - Web Server Scanner"
        echo -e "${CYAN}3)${NC} WPScan - WordPress Scanner"
        echo -e "${CYAN}4)${NC} Dirb - Web Content Scanner"
        echo -e "${CYAN}5)${NC} Dirsearch - Advanced Path Scanner"
        echo -e "${CYAN}6)${NC} Gobuster - Directory Bruteforcer"
        echo -e "${CYAN}7)${NC} WhatWeb - Web Scanner"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) burpsuite_tool ;;
            2) nikto_tool ;;
            3) wpscan_tool ;;
            4) dirb_tool ;;
            5) dirsearch_tool ;;
            6) gobuster_tool ;;
            7) whatweb_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

burpsuite_tool() {
    show_banner
    echo -e "${PURPLE}═══ Burp Suite - Web Vulnerability Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Burp Suite Community"
    echo -e "${CYAN}2)${NC} Run Burp Suite"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Burp Suite...${NC}"
            sudo apt-get update && sudo apt-get install -y burpsuite
            echo -e "${GREEN}[+[*] Burp Suite installed${NC}"
            pause
            ;;
        2)
            burpsuite &
            pause
            ;;
        0) return ;;
    esac
}

nikto_tool() {
    show_banner
    echo -e "${PURPLE}═══ Nikto - Web Server Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Nikto"
    echo -e "${CYAN}2)${NC} Scan Website"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Nikto...${NC}"
            sudo apt-get update && sudo apt-get install -y nikto
            echo -e "${GREEN}[+[*] Nikto installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL/IP: ${NC}"
            read -r target
            nikto -h "$target"
            pause
            ;;
        0) return ;;
    esac
}

wpscan_tool() {
    show_banner
    echo -e "${PURPLE}═══ WPScan - WordPress Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install WPScan"
    echo -e "${CYAN}2)${NC} Scan WordPress Site"
    echo -e "${CYAN}3)${NC} Enumerate Users"
    echo -e "${CYAN}4)${NC} Enumerate Plugins"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing WPScan...${NC}"
            sudo apt-get update && sudo apt-get install -y wpscan
            echo -e "${GREEN}[+[*] WPScan installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter WordPress URL: ${NC}"
            read -r url
            wpscan --url "$url"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter WordPress URL: ${NC}"
            read -r url
            wpscan --url "$url" --enumerate u
            pause
            ;;
        4)
            echo -ne "${WHITE}Enter WordPress URL: ${NC}"
            read -r url
            wpscan --url "$url" --enumerate p
            pause
            ;;
        0) return ;;
    esac
}

dirb_tool() {
    show_banner
    echo -e "${PURPLE}═══ Dirb - Web Content Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Dirb"
    echo -e "${CYAN}2)${NC} Scan Directory"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Dirb...${NC}"
            sudo apt-get update && sudo apt-get install -y dirb
            echo -e "${GREEN}[+[*] Dirb installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            dirb "$url"
            pause
            ;;
        0) return ;;
    esac
}

dirsearch_tool() {
    show_banner
    echo -e "${PURPLE}═══ Dirsearch - Advanced Path Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Dirsearch"
    echo -e "${CYAN}2)${NC} Scan Directory"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Dirsearch...${NC}"
            git clone https://github.com/maurosoria/dirsearch.git
            cd dirsearch && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] Dirsearch installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            cd dirsearch && python3 dirsearch.py -u "$url"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

gobuster_tool() {
    show_banner
    echo -e "${PURPLE}═══ Gobuster - Directory Bruteforcer ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Gobuster"
    echo -e "${CYAN}2)${NC} Directory Bruteforce"
    echo -e "${CYAN}3)${NC} DNS Subdomain Bruteforce"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Gobuster...${NC}"
            sudo apt-get update && sudo apt-get install -y gobuster
            echo -e "${GREEN}[+[*] Gobuster installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            echo -ne "${WHITE}Enter wordlist path: ${NC}"
            read -r wordlist
            gobuster dir -u "$url" -w "$wordlist"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter target domain: ${NC}"
            read -r domain
            echo -ne "${WHITE}Enter wordlist path: ${NC}"
            read -r wordlist
            gobuster dns -d "$domain" -w "$wordlist"
            pause
            ;;
        0) return ;;
    esac
}

whatweb_tool() {
    show_banner
    echo -e "${PURPLE}═══ WhatWeb - Web Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install WhatWeb"
    echo -e "${CYAN}2)${NC} Scan Website"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing WhatWeb...${NC}"
            sudo apt-get update && sudo apt-get install -y whatweb
            echo -e "${GREEN}[+[*] WhatWeb installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            whatweb "$url"
            pause
            ;;
        0) return ;;
    esac
}
