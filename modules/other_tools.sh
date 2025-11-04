#!/bin/bash

# Other Tools Module - Comprehensive collection

payload_menu() {
    show_banner
    echo -e "${PURPLE}═══ Payload Creation Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Metasploit Venom - Payload Generator"
    echo -e "${CYAN}2)${NC} The Fat Rat - Backdoor Generator"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Metasploit...${NC}"
            sudo apt-get update && sudo apt-get install -y metasploit-framework
            echo -e "${GREEN}[+[*] Metasploit installed. Use: msfvenom${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Installing TheFatRat...${NC}"
            git clone https://github.com/Screetsec/TheFatRat.git
            cd TheFatRat && chmod +x setup.sh && sudo ./setup.sh
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

post_exploitation_menu() {
    show_banner
    echo -e "${PURPLE}═══ Post Exploitation Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Metasploit Framework"
    echo -e "${CYAN}2)${NC} Empire - PowerShell Framework"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y metasploit-framework
            msfconsole
            ;;
        2)
            git clone https://github.com/EmpireProject/Empire.git
            cd Empire && sudo ./setup/install.sh
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

forensic_menu() {
    show_banner
    echo -e "${PURPLE}═══ Forensic Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Autopsy - Digital Forensics"
    echo -e "${CYAN}2)${NC} Volatility - Memory Forensics"
    echo -e "${CYAN}3)${NC} Binwalk - Firmware Analysis"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y autopsy
            echo -e "${GREEN}[+[*] Autopsy installed${NC}"
            pause
            ;;
        2)
            sudo apt-get update && sudo apt-get install -y volatility
            echo -e "${GREEN}[+[*] Volatility installed${NC}"
            pause
            ;;
        3)
            sudo apt-get update && sudo apt-get install -y binwalk
            echo -e "${GREEN}[+[*] Binwalk installed${NC}"
            pause
            ;;
        0) return ;;
    esac
}

exploit_framework_menu() {
    show_banner
    echo -e "${PURPLE}═══ Exploit Framework Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Metasploit Framework"
    echo -e "${CYAN}2)${NC} RouterSploit - Router Exploitation"
    echo -e "${CYAN}3)${NC} Commix - Command Injection"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y metasploit-framework
            msfconsole
            ;;
        2)
            git clone https://github.com/threat9/routersploit.git
            cd routersploit && pip3 install -r requirements.txt
            python3 rsf.py
            cd ..
            ;;
        3)
            git clone https://github.com/commixproject/commix.git
            cd commix && python3 commix.py
            cd ..
            ;;
        0) return ;;
    esac
}

reverse_engineering_menu() {
    show_banner
    echo -e "${PURPLE}═══ Reverse Engineering Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Radare2 - Reverse Engineering Framework"
    echo -e "${CYAN}2)${NC} Ghidra - Software Reverse Engineering"
    echo -e "${CYAN}3)${NC} OllyDbg - Windows Debugger"
    echo -e "${CYAN}4)${NC} GDB - GNU Debugger"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y radare2
            echo -e "${GREEN}[+[*] Radare2 installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Download Ghidra from: https://ghidra-sre.org/${NC}"
            pause
            ;;
        3)
            echo -e "${YELLOW}[*[*] OllyDbg is Windows-only${NC}"
            echo -e "${CYAN}Download from: http://www.ollydbg.de/${NC}"
            pause
            ;;
        4)
            sudo apt-get update && sudo apt-get install -y gdb
            echo -e "${GREEN}[+[*] GDB installed${NC}"
            pause
            ;;
        0) return ;;
    esac
}

rat_menu() {
    show_banner
    echo -e "${PURPLE}═══ Remote Administration Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Metasploit Meterpreter"
    echo -e "${CYAN}2)${NC} Netcat - Network Swiss Army Knife"
    echo -e "${CYAN}3)${NC} SSH Remote Access"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get install -y metasploit-framework
            msfconsole
            ;;
        2)
            sudo apt-get install -y netcat
            echo -e "${GREEN}[+[*] Netcat installed${NC}"
            echo -e "${CYAN}Usage: nc -lvp <port> (listener)${NC}"
            echo -e "${CYAN}Usage: nc <ip> <port> (connect)${NC}"
            pause
            ;;
        3)
            echo -e "${CYAN}SSH is usually pre-installed${NC}"
            echo -e "${CYAN}Usage: ssh user@host${NC}"
            pause
            ;;
        0) return ;;
    esac
}

xss_menu() {
    show_banner
    echo -e "${PURPLE}═══ XSS Attack Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} XSStrike - XSS Detection Suite"
    echo -e "${CYAN}2)${NC} XSSer - Cross Site Scripter"
    echo -e "${CYAN}3)${NC} Dalfox - XSS Scanner"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            git clone https://github.com/s0md3v/XSStrike.git
            cd XSStrike && pip3 install -r requirements.txt
            python3 xsstrike.py
            cd ..
            ;;
        2)
            git clone https://github.com/epsylon/xsser.git
            cd xsser && python3 xsser
            cd ..
            ;;
        3)
            wget https://github.com/hahwul/dalfox/releases/latest/download/dalfox_linux_amd64.tar.gz
            tar -xvf dalfox_linux_amd64.tar.gz
            sudo mv dalfox /usr/local/bin/
            echo -e "${GREEN}[+[*] Dalfox installed${NC}"
            pause
            ;;
        0) return ;;
    esac
}

steganography_menu() {
    show_banner
    echo -e "${PURPLE}═══ Steganography Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Steghide - Hide Data in Images"
    echo -e "${CYAN}2)${NC} StegCracker - Steghide Password Cracker"
    echo -e "${CYAN}3)${NC} Stegsolve - Image Analysis"
    echo -e "${CYAN}4)${NC} Zsteg - PNG/BMP Steganography"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y steghide
            echo -e "${GREEN}[+[*] Steghide installed${NC}"
            echo -e "${CYAN}Usage: steghide embed -cf <image> -ef <file>${NC}"
            pause
            ;;
        2)
            pip3 install stegcracker
            echo -e "${GREEN}[+[*] StegCracker installed${NC}"
            pause
            ;;
        3)
            wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
            echo -e "${GREEN}[+[*] Stegsolve downloaded${NC}"
            echo -e "${CYAN}Run with: java -jar stegsolve.jar${NC}"
            pause
            ;;
        4)
            sudo gem install zsteg
            echo -e "${GREEN}[+[*] Zsteg installed${NC}"
            pause
            ;;
        0) return ;;
    esac
}

other_tools_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}                  OTHER TOOLS                             ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} Hash Cracker (John the Ripper, Hashcat)"
        echo -e "${CYAN}2)${NC} Android Attack Tools (ADB, APKTool)"
        echo -e "${CYAN}3)${NC} Social Media Finder (Sherlock)"
        echo -e "${CYAN}4)${NC} Email Verifier Tools"
        echo -e "${CYAN}5)${NC} Web Crawling Tools (HTTrack)"
        echo -e "${CYAN}0)${NC} Back"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) hash_cracker_tools ;;
            2) android_tools ;;
            3) social_media_tools ;;
            4) email_verifier_tools ;;
            5) web_crawling_tools ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

hash_cracker_tools() {
    show_banner
    echo -e "${PURPLE}═══ Hash Cracker Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install John the Ripper"
    echo -e "${CYAN}2)${NC} Install Hashcat"
    echo -e "${CYAN}3)${NC} Run John the Ripper"
    echo -e "${CYAN}4)${NC} Run Hashcat"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y john
            echo -e "${GREEN}[+[*] John the Ripper installed${NC}"
            pause
            ;;
        2)
            sudo apt-get update && sudo apt-get install -y hashcat
            echo -e "${GREEN}[+[*] Hashcat installed${NC}"
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter hash file: ${NC}"
            read -r hashfile
            john "$hashfile"
            pause
            ;;
        4)
            echo -ne "${WHITE}Enter hash file: ${NC}"
            read -r hashfile
            echo -ne "${WHITE}Enter wordlist: ${NC}"
            read -r wordlist
            hashcat -m 0 "$hashfile" "$wordlist"
            pause
            ;;
        0) return ;;
    esac
}

android_tools() {
    show_banner
    echo -e "${PURPLE}═══ Android Attack Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install ADB"
    echo -e "${CYAN}2)${NC} Install APKTool"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y adb
            echo -e "${GREEN}[+[*] ADB installed${NC}"
            pause
            ;;
        2)
            sudo apt-get update && sudo apt-get install -y apktool
            echo -e "${GREEN}[+[*] APKTool installed${NC}"
            pause
            ;;
        0) return ;;
    esac
}

social_media_tools() {
    show_banner
    echo -e "${PURPLE}═══ Social Media Finder Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}Already available in Information Gathering > Sherlock${NC}"
    pause
}

email_verifier_tools() {
    show_banner
    echo -e "${PURPLE}═══ Email Verifier Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Holehe (Email to Accounts)"
    echo -e "${CYAN}2)${NC} Run Holehe"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            pip3 install holehe
            echo -e "${GREEN}[+[*] Holehe installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter email: ${NC}"
            read -r email
            holehe "$email"
            pause
            ;;
        0) return ;;
    esac
}

web_crawling_tools() {
    show_banner
    echo -e "${PURPLE}═══ Web Crawling Tools ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install HTTrack"
    echo -e "${CYAN}2)${NC} Run HTTrack"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            sudo apt-get update && sudo apt-get install -y httrack
            echo -e "${GREEN}[+[*] HTTrack installed${NC}"
            pause
            ;;
        2)
            httrack
            ;;
        0) return ;;
    esac
}
