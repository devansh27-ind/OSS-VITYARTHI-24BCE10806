#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Devansh Agrawal | Reg: 24BCE10806
# Course: Open Source Software | VIT Bhopal University
# Purpose: Display a formatted system identity welcome screen
#          showing kernel version, distro, user info, uptime,
#          date/time, and OS license message.
# ============================================================

# --- Student and project variables ---
STUDENT_NAME="Devansh Agrawal"
REG_NUMBER="24BCE10806"
SOFTWARE_CHOICE="Git"       # Chosen open-source software for this audit

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                      # Kernel release version (e.g. 6.5.0-15-generic)
USER_NAME=$(whoami)                     # Currently logged-in username
HOME_DIR="$HOME"                        # User's home directory path
UPTIME=$(uptime -p)                     # Human-readable uptime (e.g. up 2 hours, 3 minutes)
CURRENT_DATE=$(date '+%A, %d %B %Y')   # Formatted date (e.g. Monday, 15 March 2025)
CURRENT_TIME=$(date '+%H:%M:%S')       # Current time in 24-hour format

# --- Detect Linux distribution name from /etc/os-release ---
# /etc/os-release is a standard file present on all modern Linux distros
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d'=' -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Display the identity report with formatting ---
echo "============================================="
echo "     Open Source Audit — System Identity     "
echo "============================================="
echo "Student   : $STUDENT_NAME ($REG_NUMBER)"
echo "Software  : $SOFTWARE_CHOICE (GPL v2)"
echo "---------------------------------------------"
echo "Distro    : $DISTRO"
echo "Kernel    : $KERNEL"
echo "User      : $USER_NAME"
echo "Home Dir  : $HOME_DIR"
echo "Uptime    : $UPTIME"
echo "Date      : $CURRENT_DATE"
echo "Time      : $CURRENT_TIME"
echo "---------------------------------------------"
echo "OS License: GNU General Public License (GPL)"
echo "The Linux kernel is licensed under GPLv2,"
echo "meaning anyone can study, modify, and share it"
echo "freely — including this system you're running on."
echo "============================================="
