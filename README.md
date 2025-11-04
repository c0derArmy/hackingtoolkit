# HackingTool - Shell Version

A comprehensive security testing toolkit written in pure Shell Script (with minimal Python dependencies), based on the original HackingTool Python project.

## DISCLAIMER - FOR EDUCATIONAL PURPOSES ONLY

This tool is designed for security professionals, ethical hackers, and penetration testers to conduct authorized security assessments. Unauthorized access to computer systems is illegal.

- Only use this tool on systems you own or have explicit permission to test
- The developers are not responsible for misuse or illegal activities
- Always comply with applicable laws and regulations

## Features

- Pure Shell Script implementation
- 19 Categories of security tools
- 120+ Tools included
- Easy Installation process
- User-Friendly interactive menu
- Modular Design for easy extension

## Tool Categories

### 0. Anonymously Hiding Tools
- Anonsurf, Multitor, ProxyChains, MacChanger

### 1. Information Gathering Tools  
- Nmap, Dracnmap, Port Scanning, Host2IP, Xerosploit, RedHawk, ReconSpider, Infoga, Th3inspector, Sherlock

### 2. Wordlist Generator Tools
- Cupp, WordlistCreator, Crunch, Cewl

### 3. Wireless Attack Tools
- Aircrack-ng, Wifite, Fluxion, Wifiphisher, Reaver

### 4. SQL Injection Tools
- SQLmap, NoSQLMap, SQLiv, SQLmate

### 5. Phishing Attack Tools
- SocialFish, HiddenEye, Zphisher, ShellPhish, SocialPhish

### 6. Web Attack Tools
- Burp Suite, Nikto, WPScan, Dirb, Dirsearch, Gobuster, WhatWeb

### 7. Post Exploitation Tools
- Metasploit Framework, Empire

### 8. Forensic Tools
- Autopsy, Volatility, Binwalk

### 9. Payload Creation Tools
- Metasploit Venom, TheFatRat

### 10. Exploit Framework Tools
- Metasploit, RouterSploit, Commix

### 11. Reverse Engineering Tools
- Radare2, Ghidra, OllyDbg, GDB

### 12. DDOS Attack Tools
- LOIC, HOIC, Slowloris, GoldenEye, Hulk, Torshammer

### 13. Remote Administration Tools
- Metasploit Meterpreter, Netcat, SSH

### 14. XSS Attack Tools
- XSStrike, XSSer, Dalfox

### 15. Steganography Tools
- Steghide, StegCracker, Stegsolve, Zsteg

### 16. Other Tools
- Hash Crackers (John, Hashcat), Android Tools, Social Media Finders, Email Verifiers

### 17. Advanced Exploitation Tools (NEW)
- Havoc Framework, Sliver C2, Mythic, PoshC2, Koadic, Covenant, Merlin, SharpSploit, SILENTTRINITY, Impacket

### 18. Cloud Security Tools (NEW)
- ScoutSuite, Prowler, CloudMapper, Pacu, CloudSploit, S3Scanner, CloudBrute, SkyArk, Azucar, GCPBucketBrute

## Installation

### Prerequisites
- Linux OS (Debian/Ubuntu/Kali recommended)
- Root/sudo access
- Internet connection
- Git installed

### Quick Install

```bash
git clone https://github.com/yourusername/hackingtool-shell.git
cd hackingtool-shell
chmod +x install.sh
sudo ./install.sh
```

## Usage

```bash
sudo ./hackingtool.sh
```

Then select a category from the main menu (0-18) and choose specific tools.

## System Requirements

### Minimum
- Linux Kernel 3.x or higher
- 2GB RAM minimum
- 10GB free disk space
- Active internet connection

### Recommended
- Kali Linux / Parrot OS / Ubuntu
- 4GB RAM
- 20GB disk space
- Root access

## Project Structure

```
hackingtool-shell/
├── hackingtool.sh              # Main script
├── install.sh                  # Installation script
├── modules/                    # Tool modules
│   ├── anonsurf.sh
│   ├── info_gathering.sh
│   ├── wordlist.sh
│   ├── wireless.sh
│   ├── sql_injection.sh
│   ├── phishing.sh
│   ├── web_attack.sh
│   ├── ddos.sh
│   ├── other_tools.sh
│   ├── advanced_exploitation.sh (NEW)
│   └── cloud_security.sh (NEW)
└── README.md
```

## Contributing

Contributions welcome:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Credits

- Original HackingTool by Z4nzu
- All open-source tool developers
- Security research community

## Support

- GitHub Issues for bug reports
- GitHub Discussions for questions

## Legal Notice

FOR EDUCATIONAL PURPOSES ONLY

Use only on authorized systems. Unauthorized access is ILLEGAL.

## Changelog

### Version 1.1.0
- Removed all emojis for professional appearance
- Added Advanced Exploitation Tools category
- Added Cloud Security Tools category
- 20+ new advanced tools added
- Improved interface consistency

### Version 1.0.0
- Initial release
- 17 categories with 100+ tools
- Shell-based implementation

---

Remember: Always practice ethical hacking. Get proper authorization before testing any systems.
