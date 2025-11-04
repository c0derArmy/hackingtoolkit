#!/bin/bash

# Anonymously Hiding Tools Module

anonsurf_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}            ANONYMOUSLY HIDING TOOLS                      ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Anonsurf - Anonymous Surfing Tool"
        echo -e "${CYAN}2)${NC} Multitor - Multi Tor Circuit"
        echo -e "${CYAN}3)${NC} ProxyChains - Proxy Tool"
        echo -e "${CYAN}4)${NC} MacChanger - Change MAC Address"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) anonsurf_tool ;;
            2) multitor_tool ;;
            3) proxychains_tool ;;
            4) macchanger_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

anonsurf_tool() {
    show_banner
    echo -e "${PURPLE}═══ Anonsurf - Anonymous Surfing ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Anonsurf"
    echo -e "${CYAN}2)${NC} Start Anonsurf"
    echo -e "${CYAN}3)${NC} Stop Anonsurf"
    echo -e "${CYAN}4)${NC} Check Status"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Anonsurf...${NC}"
            git clone https://github.com/Und3rf10w/kali-anonsurf.git
            cd kali-anonsurf && sudo ./installer.sh
            cd .. && sudo rm -rf kali-anonsurf
            echo -e "${GREEN}[+[*] Anonsurf installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Starting Anonsurf...${NC}"
            sudo anonsurf start
            pause
            ;;
        3)
            echo -e "${YELLOW}[*[*] Stopping Anonsurf...${NC}"
            sudo anonsurf stop
            pause
            ;;
        4)
            echo -e "${YELLOW}[*[*] Checking Anonsurf status...${NC}"
            sudo anonsurf status
            pause
            ;;
        0) return ;;
    esac
}

multitor_tool() {
    show_banner
    echo -e "${PURPLE}═══ Multitor - Multiple Tor Circuits ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Multitor"
    echo -e "${CYAN}2)${NC} Run Multitor"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Multitor...${NC}"
            git clone https://github.com/trimstray/multitor.git
            cd multitor && sudo bash setup.sh install
            cd ..
            echo -e "${GREEN}[+[*] Multitor installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Running Multitor...${NC}"
            multitor --init 2 --user debian-tor --socks-port 9000 --control-port 9900
            pause
            ;;
        0) return ;;
    esac
}

proxychains_tool() {
    show_banner
    echo -e "${PURPLE}═══ ProxyChains - Proxy Tool ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install ProxyChains"
    echo -e "${CYAN}2)${NC} Configure ProxyChains"
    echo -e "${CYAN}3)${NC} Test ProxyChains"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing ProxyChains...${NC}"
            sudo apt-get update && sudo apt-get install -y proxychains4
            echo -e "${GREEN}[+[*] ProxyChains installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Opening ProxyChains config...${NC}"
            sudo nano /etc/proxychains4.conf
            ;;
        3)
            echo -e "${YELLOW}[*[*] Testing ProxyChains...${NC}"
            proxychains4 curl ifconfig.me
            pause
            ;;
        0) return ;;
    esac
}

macchanger_tool() {
    show_banner
    echo -e "${PURPLE}═══ MAC Changer - Change MAC Address ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install MacChanger"
    echo -e "${CYAN}2)${NC} Show Current MAC"
    echo -e "${CYAN}3)${NC} Change MAC (Random)"
    echo -e "${CYAN}4)${NC} Restore Original MAC"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing MacChanger...${NC}"
            sudo apt-get update && sudo apt-get install -y macchanger
            echo -e "${GREEN}[+[*] MacChanger installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter interface (e.g., wlan0, eth0): ${NC}"
            read -r interface
            ifconfig "$interface" | grep ether
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter interface (e.g., wlan0, eth0): ${NC}"
            read -r interface
            sudo ifconfig "$interface" down
            sudo macchanger -r "$interface"
            sudo ifconfig "$interface" up
            echo -e "${GREEN}[+[*] MAC address changed${NC}"
            pause
            ;;
        4)
            echo -ne "${WHITE}Enter interface (e.g., wlan0, eth0): ${NC}"
            read -r interface
            sudo ifconfig "$interface" down
            sudo macchanger -p "$interface"
            sudo ifconfig "$interface" up
            echo -e "${GREEN}[+[*] MAC address restored${NC}"
            pause
            ;;
        0) return ;;
    esac
}
