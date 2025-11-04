#!/bin/bash

# Wordlist Generator Tools Module

wordlist_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}            WORDLIST GENERATOR TOOLS                      ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Cupp - Common User Passwords Profiler"
        echo -e "${CYAN}2)${NC} WordlistCreator"
        echo -e "${CYAN}3)${NC} Crunch - Wordlist Generator"
        echo -e "${CYAN}4)${NC} Cewl - Custom Word List Generator"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) cupp_tool ;;
            2) wlcreator_tool ;;
            3) crunch_tool ;;
            4) cewl_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

cupp_tool() {
    show_banner
    echo -e "${PURPLE}═══ Cupp - Common User Passwords Profiler ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Cupp"
    echo -e "${CYAN}2)${NC} Run Cupp (Interactive)"
    echo -e "${CYAN}3)${NC} Download Wordlists"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Cupp...${NC}"
            git clone https://github.com/Mebus/cupp.git
            echo -e "${GREEN}[+[*] Cupp installed${NC}"
            pause
            ;;
        2)
            cd cupp && python3 cupp.py -i
            cd ..
            ;;
        3)
            cd cupp && python3 cupp.py -l
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

wlcreator_tool() {
    show_banner
    echo -e "${PURPLE}═══ WordlistCreator ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install WordlistCreator"
    echo -e "${CYAN}2)${NC} Run WordlistCreator"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing WordlistCreator...${NC}"
            git clone https://github.com/Z4nzu/wlcreator.git
            cd wlcreator && gcc -o wlcreator wlcreator.c
            cd ..
            echo -e "${GREEN}[+[*] WordlistCreator installed${NC}"
            pause
            ;;
        2)
            cd wlcreator
            echo -ne "${WHITE}Enter length: ${NC}"
            read -r length
            ./wlcreator "$length"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

crunch_tool() {
    show_banner
    echo -e "${PURPLE}═══ Crunch - Wordlist Generator ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Crunch"
    echo -e "${CYAN}2)${NC} Generate Wordlist"
    echo -e "${CYAN}3)${NC} Generate with Pattern"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Crunch...${NC}"
            sudo apt-get update && sudo apt-get install -y crunch
            echo -e "${GREEN}[+[*] Crunch installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter minimum length: ${NC}"
            read -r min
            echo -ne "${WHITE}Enter maximum length: ${NC}"
            read -r max
            echo -ne "${WHITE}Enter output file: ${NC}"
            read -r output
            crunch "$min" "$max" -o "$output"
            echo -e "${GREEN}[+[*] Wordlist generated: $output${NC}"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter minimum length: ${NC}"
            read -r min
            echo -ne "${WHITE}Enter maximum length: ${NC}"
            read -r max
            echo -ne "${WHITE}Enter charset (e.g., abc123): ${NC}"
            read -r charset
            echo -ne "${WHITE}Enter output file: ${NC}"
            read -r output
            crunch "$min" "$max" "$charset" -o "$output"
            echo -e "${GREEN}[+[*] Wordlist generated: $output${NC}"
            pause
            ;;
        0) return ;;
    esac
}

cewl_tool() {
    show_banner
    echo -e "${PURPLE}═══ Cewl - Custom Word List Generator ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Cewl"
    echo -e "${CYAN}2)${NC} Generate Wordlist from URL"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Cewl...${NC}"
            sudo apt-get update && sudo apt-get install -y cewl
            echo -e "${GREEN}[+[*] Cewl installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter URL: ${NC}"
            read -r url
            echo -ne "${WHITE}Enter output file: ${NC}"
            read -r output
            echo -ne "${WHITE}Enter depth (default 2): ${NC}"
            read -r depth
            depth=${depth:-2}
            cewl -d "$depth" -w "$output" "$url"
            echo -e "${GREEN}[+[*] Wordlist generated: $output${NC}"
            pause
            ;;
        0) return ;;
    esac
}
