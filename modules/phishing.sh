#!/bin/bash

# Phishing Attack Tools Module

phishing_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}             PHISHING ATTACK TOOLS                        ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} SocialFish - Phishing Framework"
        echo -e "${CYAN}2)${NC} HiddenEye - Modern Phishing Tool"
        echo -e "${CYAN}3)${NC} Zphisher - Automated Phishing"
        echo -e "${CYAN}4)${NC} ShellPhish - Phishing Tool"
        echo -e "${CYAN}5)${NC} SocialPhish - Social Engineering"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) socialfish_tool ;;
            2) hiddeneye_tool ;;
            3) zphisher_tool ;;
            4) shellphish_tool ;;
            5) socialphish_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

socialfish_tool() {
    show_banner
    echo -e "${PURPLE}═══ SocialFish - Phishing Framework ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SocialFish"
    echo -e "${CYAN}2)${NC} Run SocialFish"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SocialFish...${NC}"
            git clone https://github.com/UndeadSec/SocialFish.git
            cd SocialFish && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] SocialFish installed${NC}"
            pause
            ;;
        2)
            cd SocialFish && sudo python3 SocialFish.py
            cd ..
            ;;
        0) return ;;
    esac
}

hiddeneye_tool() {
    show_banner
    echo -e "${PURPLE}═══ HiddenEye - Modern Phishing ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install HiddenEye"
    echo -e "${CYAN}2)${NC} Run HiddenEye"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing HiddenEye...${NC}"
            git clone https://github.com/DarkSecDevelopers/HiddenEye.git
            cd HiddenEye && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] HiddenEye installed${NC}"
            pause
            ;;
        2)
            cd HiddenEye && sudo python3 HiddenEye.py
            cd ..
            ;;
        0) return ;;
    esac
}

zphisher_tool() {
    show_banner
    echo -e "${PURPLE}═══ Zphisher - Automated Phishing ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Zphisher"
    echo -e "${CYAN}2)${NC} Run Zphisher"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Zphisher...${NC}"
            git clone https://github.com/htr-tech/zphisher.git
            cd zphisher && bash zphisher.sh
            cd ..
            echo -e "${GREEN}[+[*] Zphisher installed${NC}"
            pause
            ;;
        2)
            cd zphisher && bash zphisher.sh
            cd ..
            ;;
        0) return ;;
    esac
}

shellphish_tool() {
    show_banner
    echo -e "${PURPLE}═══ ShellPhish - Phishing Tool ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install ShellPhish"
    echo -e "${CYAN}2)${NC} Run ShellPhish"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing ShellPhish...${NC}"
            git clone https://github.com/suljot/shellphish.git
            cd shellphish && bash shellphish.sh
            cd ..
            echo -e "${GREEN}[+[*] ShellPhish installed${NC}"
            pause
            ;;
        2)
            cd shellphish && bash shellphish.sh
            cd ..
            ;;
        0) return ;;
    esac
}

socialphish_tool() {
    show_banner
    echo -e "${PURPLE}═══ SocialPhish - Social Engineering ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SocialPhish"
    echo -e "${CYAN}2)${NC} Run SocialPhish"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SocialPhish...${NC}"
            git clone https://github.com/xHak9x/SocialPhish.git
            cd SocialPhish && bash setup.sh
            cd ..
            echo -e "${GREEN}[+[*] SocialPhish installed${NC}"
            pause
            ;;
        2)
            cd SocialPhish && bash socialphish.sh
            cd ..
            ;;
        0) return ;;
    esac
}
