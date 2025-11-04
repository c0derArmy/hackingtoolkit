#!/bin/bash

# Cloud Security Tools Module

cloud_security_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${PURPLE}║${BOLD}${WHITE}             CLOUD SECURITY TOOLS                         ${PURPLE}║${NC}"
        echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${CYAN}1)${NC} ScoutSuite - Multi-Cloud Security Auditing"
        echo -e "${CYAN}2)${NC} Prowler - AWS Security Assessment"
        echo -e "${CYAN}3)${NC} CloudMapper - AWS Network Visualization"
        echo -e "${CYAN}4)${NC} Pacu - AWS Exploitation Framework"
        echo -e "${CYAN}5)${NC} CloudSploit - Cloud Security Scanner"
        echo -e "${CYAN}6)${NC} S3Scanner - S3 Bucket Finder"
        echo -e "${CYAN}7)${NC} CloudBrute - Cloud Infrastructure Recon"
        echo -e "${CYAN}8)${NC} SkyArk - Azure Security Scanner"
        echo -e "${CYAN}9)${NC} Azucar - Azure Security Auditor"
        echo -e "${CYAN}10)${NC} GCPBucketBrute - GCP Bucket Scanner"
        echo ""
        echo -e "${YELLOW}0)${NC} Back to Main Menu"
        echo ""
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -ne "${BOLD}${WHITE}Select option: ${NC}"
        read -r choice

        case $choice in
            1) scoutsuite_tool ;;
            2) prowler_tool ;;
            3) cloudmapper_tool ;;
            4) pacu_tool ;;
            5) cloudsploit_tool ;;
            6) s3scanner_tool ;;
            7) cloudbrute_tool ;;
            8) skyark_tool ;;
            9) azucar_tool ;;
            10) gcpbucketbrute_tool ;;
            0) return ;;
            *) echo -e "${RED}[X[*] Invalid option${NC}"; pause ;;
        esac
    done
}

scoutsuite_tool() {
    show_banner
    echo -e "${PURPLE}═══ ScoutSuite - Multi-Cloud Security Auditing ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install ScoutSuite"
    echo -e "${CYAN}2)${NC} Scan AWS"
    echo -e "${CYAN}3)${NC} Scan Azure"
    echo -e "${CYAN}4)${NC} Scan GCP"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing ScoutSuite...${NC}"
            pip3 install scoutsuite
            echo -e "${GREEN}[+[*] ScoutSuite installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Scanning AWS...${NC}"
            scout aws
            pause
            ;;
        3)
            echo -e "${YELLOW}[*[*] Scanning Azure...${NC}"
            scout azure
            pause
            ;;
        4)
            echo -e "${YELLOW}[*[*] Scanning GCP...${NC}"
            scout gcp
            pause
            ;;
        0) return ;;
    esac
}

prowler_tool() {
    show_banner
    echo -e "${PURPLE}═══ Prowler - AWS Security Assessment ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Prowler"
    echo -e "${CYAN}2)${NC} Run Full AWS Scan"
    echo -e "${CYAN}3)${NC} Run CIS Benchmark"
    echo -e "${CYAN}4)${NC} Scan Specific Service"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Prowler...${NC}"
            git clone https://github.com/prowler-cloud/prowler
            cd prowler && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] Prowler installed${NC}"
            pause
            ;;
        2)
            echo -e "${YELLOW}[*[*] Running full AWS scan...${NC}"
            cd prowler && ./prowler
            cd ..
            pause
            ;;
        3)
            echo -e "${YELLOW}[*[*] Running CIS Benchmark...${NC}"
            cd prowler && ./prowler -c check
            cd ..
            pause
            ;;
        4)
            echo -ne "${WHITE}Enter service name (e.g., s3, ec2): ${NC}"
            read -r service
            cd prowler && ./prowler -s "$service"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

cloudmapper_tool() {
    show_banner
    echo -e "${PURPLE}═══ CloudMapper - AWS Network Visualization ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install CloudMapper"
    echo -e "${CYAN}2)${NC} Collect AWS Data"
    echo -e "${CYAN}3)${NC} Prepare Data"
    echo -e "${CYAN}4)${NC} Generate Web Report"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing CloudMapper...${NC}"
            git clone https://github.com/duo-labs/cloudmapper.git
            cd cloudmapper && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] CloudMapper installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter AWS account name: ${NC}"
            read -r account
            cd cloudmapper && python3 cloudmapper.py collect --account "$account"
            cd ..
            pause
            ;;
        3)
            cd cloudmapper && python3 cloudmapper.py prepare
            cd ..
            pause
            ;;
        4)
            cd cloudmapper && python3 cloudmapper.py webserver
            cd ..
            ;;
        0) return ;;
    esac
}

pacu_tool() {
    show_banner
    echo -e "${PURPLE}═══ Pacu - AWS Exploitation Framework ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Pacu"
    echo -e "${CYAN}2)${NC} Run Pacu"
    echo -e "${CYAN}3)${NC} Configure AWS Keys"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Pacu...${NC}"
            git clone https://github.com/RhinoSecurityLabs/pacu.git
            cd pacu && bash install.sh
            cd ..
            echo -e "${GREEN}[+[*] Pacu installed${NC}"
            pause
            ;;
        2)
            cd pacu && python3 pacu.py
            cd ..
            ;;
        3)
            echo -e "${YELLOW}[*[*] Configure AWS keys in Pacu interactive mode${NC}"
            echo -e "${CYAN}Use: set_keys${NC}"
            pause
            ;;
        0) return ;;
    esac
}

cloudsploit_tool() {
    show_banner
    echo -e "${PURPLE}═══ CloudSploit - Cloud Security Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install CloudSploit"
    echo -e "${CYAN}2)${NC} Scan AWS"
    echo -e "${CYAN}3)${NC} Scan Azure"
    echo -e "${CYAN}4)${NC} Scan GCP"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing CloudSploit...${NC}"
            git clone https://github.com/aquasecurity/cloudsploit.git
            cd cloudsploit && npm install
            cd ..
            echo -e "${GREEN}[+[*] CloudSploit installed${NC}"
            pause
            ;;
        2)
            cd cloudsploit && node index.js --cloud aws --config config.js
            cd ..
            pause
            ;;
        3)
            cd cloudsploit && node index.js --cloud azure --config config.js
            cd ..
            pause
            ;;
        4)
            cd cloudsploit && node index.js --cloud gcp --config config.js
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

s3scanner_tool() {
    show_banner
    echo -e "${PURPLE}═══ S3Scanner - S3 Bucket Finder ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install S3Scanner"
    echo -e "${CYAN}2)${NC} Scan for S3 Buckets"
    echo -e "${CYAN}3)${NC} Check Bucket Permissions"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing S3Scanner...${NC}"
            git clone https://github.com/sa7mon/S3Scanner.git
            cd S3Scanner && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] S3Scanner installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter bucket name or file with names: ${NC}"
            read -r input
            cd S3Scanner && python3 s3scanner.py "$input"
            cd ..
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter bucket name: ${NC}"
            read -r bucket
            cd S3Scanner && python3 s3scanner.py --bucket "$bucket"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}

cloudbrute_tool() {
    show_banner
    echo -e "${PURPLE}═══ CloudBrute - Cloud Infrastructure Recon ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install CloudBrute"
    echo -e "${CYAN}2)${NC} Scan AWS Infrastructure"
    echo -e "${CYAN}3)${NC} Scan Azure Infrastructure"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing CloudBrute...${NC}"
            go install github.com/0xsha/CloudBrute@latest
            echo -e "${GREEN}[+[*] CloudBrute installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter keyword: ${NC}"
            read -r keyword
            CloudBrute -d "$keyword" -c aws -w wordlist.txt
            pause
            ;;
        3)
            echo -ne "${WHITE}Enter keyword: ${NC}"
            read -r keyword
            CloudBrute -d "$keyword" -c azure -w wordlist.txt
            pause
            ;;
        0) return ;;
    esac
}

skyark_tool() {
    show_banner
    echo -e "${PURPLE}═══ SkyArk - Azure Security Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install SkyArk"
    echo -e "${CYAN}2)${NC} Run AzureStealth"
    echo -e "${CYAN}3)${NC} Run AWStrace"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing SkyArk...${NC}"
            git clone https://github.com/cyberark/SkyArk.git
            echo -e "${GREEN}[+[*] SkyArk installed${NC}"
            pause
            ;;
        2)
            cd SkyArk/AzureStealth && powershell -ExecutionPolicy Bypass -File AzureStealth.ps1
            cd ../..
            ;;
        3)
            cd SkyArk/AWStrace && powershell -ExecutionPolicy Bypass -File AWStrace.ps1
            cd ../..
            ;;
        0) return ;;
    esac
}

azucar_tool() {
    show_banner
    echo -e "${PURPLE}═══ Azucar - Azure Security Auditor ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install Azucar"
    echo -e "${CYAN}2)${NC} Run Azucar Scan"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing Azucar...${NC}"
            git clone https://github.com/nccgroup/azucar.git
            echo -e "${GREEN}[+[*] Azucar installed${NC}"
            pause
            ;;
        2)
            cd azucar && powershell -ExecutionPolicy Bypass -File Azucar.ps1
            cd ..
            ;;
        0) return ;;
    esac
}

gcpbucketbrute_tool() {
    show_banner
    echo -e "${PURPLE}═══ GCPBucketBrute - GCP Bucket Scanner ═══${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} Install GCPBucketBrute"
    echo -e "${CYAN}2)${NC} Scan GCP Buckets"
    echo -e "${CYAN}0)${NC} Back"
    echo ""
    echo -ne "${BOLD}${WHITE}Select option: ${NC}"
    read -r choice

    case $choice in
        1)
            echo -e "${YELLOW}[*[*] Installing GCPBucketBrute...${NC}"
            git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git
            cd GCPBucketBrute && pip3 install -r requirements.txt
            cd ..
            echo -e "${GREEN}[+[*] GCPBucketBrute installed${NC}"
            pause
            ;;
        2)
            echo -ne "${WHITE}Enter keyword: ${NC}"
            read -r keyword
            cd GCPBucketBrute && python3 gcpbucketbrute.py -k "$keyword"
            cd ..
            pause
            ;;
        0) return ;;
    esac
}
