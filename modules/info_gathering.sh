#!/bin/bash

# Information Gathering Tools Module

info_gathering_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}          INFORMATION GATHERING TOOLS                     ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Nmap - Network Scanner"
        echo -e "${CYAN}2)${NC} Dracnmap - Nmap GUI"
        echo -e "${CYAN}3)${NC} Port Scanning"
        echo -e "${CYAN}4)${NC} Host to IP"
        echo -e "${CYAN}5)${NC} Xerosploit - MITM Framework"
        echo -e "${CYAN}6)${NC} Red Hawk - All-in-One Scanner"
        echo -e "${CYAN}7)${NC} ReconSpider - OSINT Framework"
        echo -e "${CYAN}8)${NC} Infoga - Email OSINT"
        echo -e "${CYAN}9)${NC} Th3inspector - Information Gathering"
        echo -e "${CYAN}10)${NC} Sherlock - Username Hunter"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) nmap_tool ;;
            2) dracnmap_tool ;;
            3) port_scan_tool ;;
            4) host_to_ip_tool ;;
            5) xerosploit_tool ;;
            6) redhawk_tool ;;
            7) reconspider_tool ;;
            8) infoga_tool ;;
            9) th3inspector_tool ;;
            10) sherlock_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

nmap_tool() {
    show_banner
    echo -e "${PURPLE}═══ Nmap - Network Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Nmap"
    echo -e "${CYAN}2)${NC} Quick Scan"
    echo -e "${CYAN}3)${NC} Intense Scan"
    echo -e "${CYAN}4)${NC} OS Detection"
    echo -e "${CYAN}5)${NC} Service Version Detection"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Nmap...${NC}"
            sudo apt-get update && sudo apt-get install -y nmap
            echo -e "${GREEN}[+[*] Nmap installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target IP/hostname: ${NC}"
            read -r target
            nmap "$target"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter target IP/hostname: ${NC}"
            read -r target
            sudo nmap -T4 -A -v "$target"
            pause
            ;;
        4)
            echo -ne "${WHITE}Enter target IP/hostname: ${NC}"
            read -r target
            sudo nmap -O "$target"
            pause
            ;;
        5)
            echo -ne "${WHITE}Enter target IP/hostname: ${NC}"
            read -r target
            nmap -sV "$target"
            pause
            ;;
        0) return ;;
    esac
}

dracnmap_tool() {
    show_banner
    echo -e "${PURPLE}═══ Dracnmap - Nmap GUI ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Dracnmap"
    echo -e "${CYAN}2)${NC} Run Dracnmap"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Dracnmap...${NC}"
            git clone https://github.com/Screetsec/Dracnmap.git
            cd Dracnmap && chmod +x dracnmap-v2.2.sh
            cd ..
            echo -e "${GREEN}[+[*] Dracnmap installed${NC}"
            pause
            ;;
        2)
            cd Dracnmap && sudo ./dracnmap-v2.2.sh
            cd ..
            ;;
        0) return ;;
    esac
}

port_scan_tool() {
    show_banner
    echo -e "${PURPLE}═══ Port Scanning ═══${NC}"
    echo ""
    echo -ne "${WHITE}Enter target IP/hostname: ${NC}"
    read -r target
    echo -e "${YELLOW}[*[*] Scanning ports on $target...${NC}"
    sudo nmap -O -Pn "$target"
    pause
}

host_to_ip_tool() {
    show_banner
    echo -e "${PURPLE}═══ Host to IP Converter ═══${NC}"
    echo ""
    echo -ne "${WHITE}Enter hostname (e.g., www.google.com): ${NC}"
    read -r hostname
    echo -e "${YELLOW}[*[*] Resolving $hostname...${NC}"
    host "$hostname"
    pause
}

xerosploit_tool() {
    show_banner
    echo -e "${PURPLE}═══ Xerosploit - MITM Framework ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Xerosploit"
    echo -e "${CYAN}2)${NC} Run Xerosploit"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Xerosploit...${NC}"
            git clone https://github.com/LionSec/xerosploit.git
            cd xerosploit && sudo python install.py
            cd ..
            echo -e "${GREEN}[+[*] Xerosploit installed${NC}"
            pause
            ;;
        2)
            sudo xerosploit
            ;;
        0) return ;;
    esac
}

redhawk_tool() {
    show_banner
    echo -e "${PURPLE}═══ Red Hawk - All-in-One Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Red Hawk"
    echo -e "${CYAN}2)${NC} Run Red Hawk"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Red Hawk...${NC}"
            git clone https://github.com/Tuhinshubhra/RED_HAWK.git
            echo -e "${GREEN}[+[*] Red Hawk installed${NC}"
            pause
            ;;
        2)
            cd RED_HAWK && php rhawk.php
            cd ..
            ;;
        0) return ;;
    esac
}

reconspider_tool() {
    show_banner
    echo -e "${PURPLE}═══ ReconSpider - OSINT Framework ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install ReconSpider"
    echo -e "${CYAN}2)${NC} Run ReconSpider"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing ReconSpider...${NC}"
            git clone https://github.com/bhavsec/reconspider.git
            cd reconspider && sudo python3 setup.py install
            cd ..
            echo -e "${GREEN}[+[*] ReconSpider installed${NC}"
            pause
            ;;
        2)
            reconspider
            ;;
        0) return ;;
    esac
}

infoga_tool() {
    show_banner
    echo -e "${PURPLE}═══ Infoga - Email OSINT ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Infoga"
    echo -e "${CYAN}2)${NC} Run Infoga"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Infoga...${NC}"
            git clone https://github.com/m4ll0k/Infoga.git
            cd Infoga && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] Infoga installed${NC}"
            pause
            ;;
        2)
            cd Infoga && python3 infoga.py
            cd ..
            ;;
        0) return ;;
    esac
}

th3inspector_tool() {
    show_banner
    echo -e "${PURPLE}═══ Th3inspector - Information Gathering ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Th3inspector"
    echo -e "${CYAN}2)${NC} Run Th3inspector"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Th3inspector...${NC}"
            git clone https://github.com/Moham3dRiahi/Th3inspector.git
            cd Th3inspector && chmod +x install.sh && sudo ./install.sh
            cd ..
            echo -e "${GREEN}[+[*] Th3inspector installed${NC}"
            pause
            ;;
        2)
            th3inspector
            ;;
        0) return ;;
    esac
}

sherlock_tool() {
    show_banner
    echo -e "${PURPLE}═══ Sherlock - Username Hunter ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Sherlock"
    echo -e "${CYAN}2)${NC} Run Sherlock"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Sherlock...${NC}"
            git clone https://github.com/sherlock-project/sherlock.git
            cd sherlock && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] Sherlock installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter username to search: ${NC}"
            read -r username
            cd sherlock && python3 sherlock.py "$username"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}
