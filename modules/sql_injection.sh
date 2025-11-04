#!/bin/bash

# SQL Injection Tools Module

sql_injection_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}              SQL INJECTION TOOLS                         ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} SQLmap - SQL Injection Tool"
        echo -e "${CYAN}2)${NC} NoSQLMap - NoSQL Injection"
        echo -e "${CYAN}3)${NC} SQLiv - SQL Injection Scanner"
        echo -e "${CYAN}4)${NC} SQLmate - SQL Injection Friend"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) sqlmap_tool ;;
            2) nosqlmap_tool ;;
            3) sqliv_tool ;;
            4) sqlmate_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

sqlmap_tool() {
    show_banner
    echo -e "${PURPLE}═══ SQLmap - SQL Injection Tool ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SQLmap"
    echo -e "${CYAN}2)${NC} Basic SQLmap Scan"
    echo -e "${CYAN}3)${NC} Advanced SQLmap"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SQLmap...${NC}"
            git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
            echo -e "${GREEN}[+[*] SQLmap installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            cd sqlmap && python3 sqlmap.py -u "$url" --batch
            cd ..
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter target URL: ${NC}"
            read -r url
            echo -ne "${WHITE}Enter options (e.g., --dbs --tables): ${NC}"
            read -r options
            cd sqlmap && python3 sqlmap.py -u "$url" $options --batch
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

nosqlmap_tool() {
    show_banner
    echo -e "${PURPLE}═══ NoSQLMap - NoSQL Injection ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install NoSQLMap"
    echo -e "${CYAN}2)${NC} Run NoSQLMap"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing NoSQLMap...${NC}"
            git clone https://github.com/codingo/NoSQLMap.git
            cd NoSQLMap && sudo python setup.py install
            cd ..
            echo -e "${GREEN}[+[*] NoSQLMap installed${NC}"
            pause
            ;;
        2)
            cd NoSQLMap && python nosqlmap.py
            cd ..
            ;;
        0) return ;;
    esac
}

sqliv_tool() {
    show_banner
    echo -e "${PURPLE}═══ SQLiv - SQL Injection Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SQLiv"
    echo -e "${CYAN}2)${NC} Run SQLiv"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SQLiv...${NC}"
            git clone https://github.com/Hadesy2k/sqliv.git
            cd sqliv && sudo pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] SQLiv installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter dork or target: ${NC}"
            read -r target
            cd sqliv && python3 sqliv.py -t "$target"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

sqlmate_tool() {
    show_banner
    echo -e "${PURPLE}═══ SQLmate - SQL Injection Friend ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SQLmate"
    echo -e "${CYAN}2)${NC} Run SQLmate"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SQLmate...${NC}"
            git clone https://github.com/UltimateHackers/sqlmate.git
            cd sqlmate && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] SQLmate installed${NC}"
            pause
            ;;
        2)
            cd sqlmate && python3 sqlmate.py
            cd ..
            ;;
        0) return ;;
    esac
}
