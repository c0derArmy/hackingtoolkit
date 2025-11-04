#!/bin/bash

# Wireless Attack Tools Module

wireless_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}              WIRELESS ATTACK TOOLS                       ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Aircrack-ng - WiFi Security Auditing"
        echo -e "${CYAN}2)${NC} Wifite - Automated WiFi Attack"
        echo -e "${CYAN}3)${NC} Fluxion - WiFi Evil Twin Attack"
        echo -e "${CYAN}4)${NC} Wifiphisher - Rogue AP Attack"
        echo -e "${CYAN}5)${NC} Reaver - WPS Attack"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) aircrack_tool ;;
            2) wifite_tool ;;
            3) fluxion_tool ;;
            4) wifiphisher_tool ;;
            5) reaver_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

aircrack_tool() {
    show_banner
    echo -e "${PURPLE}═══ Aircrack-ng - WiFi Security ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Aircrack-ng"
    echo -e "${CYAN}2)${NC} Put Interface in Monitor Mode"
    echo -e "${CYAN}3)${NC} Scan Networks"
    echo -e "${CYAN}4)${NC} Stop Monitor Mode"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Aircrack-ng...${NC}"
            sudo apt-get update && sudo apt-get install -y aircrack-ng
            echo -e "${GREEN}[+[*] Aircrack-ng installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter interface (e.g., wlan0): ${NC}"
            read -r interface
            sudo airmon-ng start "$interface"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter monitor interface (e.g., wlan0mon): ${NC}"
            read -r interface
            sudo airodump-ng "$interface"
            ;;
        4)
            echo -ne "${WHITE}Enter monitor interface (e.g., wlan0mon): ${NC}"
            read -r interface
            sudo airmon-ng stop "$interface"
            pause
            ;;
        0) return ;;
    esac
}

wifite_tool() {
    show_banner
    echo -e "${PURPLE}═══ Wifite - Automated WiFi Attack ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Wifite"
    echo -e "${CYAN}2)${NC} Run Wifite"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Wifite...${NC}"
            git clone https://github.com/derv82/wifite2.git
            cd wifite2 && sudo python3 setup.py install
            cd ..
            echo -e "${GREEN}[+[*] Wifite installed${NC}"
            pause
            ;;
        2)
            sudo wifite
            ;;
        0) return ;;
    esac
}

fluxion_tool() {
    show_banner
    echo -e "${PURPLE}═══ Fluxion - WiFi Evil Twin ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Fluxion"
    echo -e "${CYAN}2)${NC} Run Fluxion"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Fluxion...${NC}"
            git clone https://github.com/FluxionNetwork/fluxion.git
            cd fluxion && sudo ./fluxion.sh -i
            cd ..
            echo -e "${GREEN}[+[*] Fluxion installed${NC}"
            pause
            ;;
        2)
            cd fluxion && sudo ./fluxion.sh
            cd ..
            ;;
        0) return ;;
    esac
}

wifiphisher_tool() {
    show_banner
    echo -e "${PURPLE}═══ Wifiphisher - Rogue AP Attack ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Wifiphisher"
    echo -e "${CYAN}2)${NC} Run Wifiphisher"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Wifiphisher...${NC}"
            git clone https://github.com/wifiphisher/wifiphisher.git
            cd wifiphisher && sudo python3 setup.py install
            cd ..
            echo -e "${GREEN}[+[*] Wifiphisher installed${NC}"
            pause
            ;;
        2)
            sudo wifiphisher
            ;;
        0) return ;;
    esac
}

reaver_tool() {
    show_banner
    echo -e "${PURPLE}═══ Reaver - WPS Attack Tool ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Reaver"
    echo -e "${CYAN}2)${NC} Run Reaver"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Reaver...${NC}"
            sudo apt-get update && sudo apt-get install -y reaver
            echo -e "${GREEN}[+[*] Reaver installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter interface (monitor mode): ${NC}"
            read -r interface
            echo -ne "${WHITE}Enter BSSID: ${NC}"
            read -r bssid
            sudo reaver -i "$interface" -b "$bssid" -vv
            ;;
        0) return ;;
    esac
}
