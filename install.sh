#!/bin/bash

# Installation Script for HackingTool Shell Version

echo "╔════════════════════════════════════════════════════════════╗"
echo "║         HackingTool Shell Version - Installer            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check if running on Linux
if [[ "$(uname)" != "Linux" ]]; then
    echo "[✗] This tool is designed for Linux systems only!"
    exit 1
fi

echo "[*] Checking prerequisites..."

# Check for bash
if ! command -v bash &> /dev/null; then
    echo "[✗] Bash is required but not installed!"
    exit 1
fi
echo "[✓] Bash found"

# Check for git
if ! command -v git &> /dev/null; then
    echo "[!] Git not found. Installing..."
    sudo apt-get update && sudo apt-get install -y git
fi
echo "[✓] Git found"

# Check for python3
if ! command -v python3 &> /dev/null; then
    echo "[!] Python3 not found. Installing..."
    sudo apt-get update && sudo apt-get install -y python3 python3-pip
fi
echo "[✓] Python3 found"

# Check for pip3
if ! command -v pip3 &> /dev/null; then
    echo "[!] pip3 not found. Installing..."
    sudo apt-get update && sudo apt-get install -y python3-pip
fi
echo "[✓] pip3 found"

# Install common dependencies
echo ""
echo "[*] Installing common dependencies..."
sudo apt-get update
sudo apt-get install -y \
    curl \
    wget \
    gcc \
    make \
    build-essential \
    net-tools \
    dnsutils \
    host \
    php \
    ruby \
    gem \
    2>/dev/null

echo ""
echo "[*] Setting up HackingTool..."

# Make scripts executable
chmod +x hackingtool.sh
chmod +x modules/*.sh

# Create desktop shortcut (optional)
read -p "Create desktop shortcut? (y/n): " create_shortcut
if [[ "$create_shortcut" =~ ^[Yy]$ ]]; then
    cat > ~/Desktop/HackingTool.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=HackingTool Shell
Comment=Security Testing Toolkit
Exec=sudo $(pwd)/hackingtool.sh
Icon=utilities-terminal
Terminal=true
Categories=System;Security;
EOF
    chmod +x ~/Desktop/HackingTool.desktop
    echo "[✓] Desktop shortcut created"
fi

# Create symbolic link (optional)
read -p "Install globally (creates /usr/local/bin/hackingtool link)? (y/n): " install_global
if [[ "$install_global" =~ ^[Yy]$ ]]; then
    sudo ln -sf "$(pwd)/hackingtool.sh" /usr/local/bin/hackingtool
    echo "[✓] Global installation complete. Run with: sudo hackingtool"
fi

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              Installation Complete!                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "To run HackingTool:"
echo "  1. From this directory: sudo ./hackingtool.sh"
if [[ "$install_global" =~ ^[Yy]$ ]]; then
    echo "  2. From anywhere: sudo hackingtool"
fi
echo ""
echo "⚠  Remember: Only use for authorized testing!"
echo ""
