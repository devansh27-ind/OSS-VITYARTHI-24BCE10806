#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Devansh Agrawal | Reg: 24BCE10806
# Course: Open Source Software | VIT Bhopal University
# Purpose: Check if the chosen FOSS package (git) is installed,
#          display its version/license metadata, and print a
#          philosophy note using a case statement.
# ============================================================

PACKAGE="git"   # Primary package: our chosen open-source software

echo "============================================="
echo "        FOSS Package Inspector               "
echo "  Devansh Agrawal | 24BCE10806              "
echo "============================================="
echo "Inspecting package: $PACKAGE"
echo "---------------------------------------------"

# --- Detect which package manager is available ---
# rpm is used on Fedora/RHEL/CentOS; dpkg on Debian/Ubuntu
if command -v rpm &>/dev/null; then
    # rpm-based system (Fedora, CentOS, RHEL, etc.)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[FOUND] $PACKAGE is installed (RPM-based system)."
        echo ""
        # Extract Version, License, and Summary from rpm metadata
        rpm -qi "$PACKAGE" | grep -E '^(Version|License|Summary)'
    else
        echo "[NOT FOUND] $PACKAGE is NOT installed."
        echo "Install with: sudo dnf install $PACKAGE"
    fi

elif command -v dpkg &>/dev/null; then
    # dpkg-based system (Debian, Ubuntu, etc.)
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q '^ii'; then
        echo "[FOUND] $PACKAGE is installed (DEB-based system)."
        echo ""
        # Show installed version from dpkg listing; awk extracts 3rd column
        dpkg -l "$PACKAGE" | grep '^ii' | awk '{print "Version : " $3}'
        echo "License : GPL v2"
        # Show short description from dpkg
        dpkg -l "$PACKAGE" | grep '^ii' | awk '{$1=$2=$3=$4=""; print "Summary :" $0}'
    else
        echo "[NOT FOUND] $PACKAGE is NOT installed."
        echo "Install with: sudo apt install $PACKAGE"
    fi

else
    # Fallback: try running git --version directly
    if command -v git &>/dev/null; then
        echo "[FOUND] git is available on this system."
        git --version
    else
        echo "Cannot determine package manager. Please check manually."
    fi
fi

echo ""
echo "---------------------------------------------"
echo "--- Open Source Philosophy Note ---"
echo ""

# --- Case statement: print a philosophy note for each known package ---
# The case matches against the value of $PACKAGE
case $PACKAGE in
    git)
        echo "Git: Built in 2005 when a proprietary VCS revoked access to the"
        echo "     Linux kernel team. Linus Torvalds wrote it in ~10 days."
        echo "     It now underpins virtually all modern software development."
        ;;
    httpd|apache2)
        echo "Apache: The web server that made the open internet possible."
        echo "        Powers roughly 30% of all websites globally."
        ;;
    mysql|mysqld)
        echo "MySQL: Open source at the heart of millions of web applications."
        echo "       A dual-license story — GPL for community, commercial for enterprise."
        ;;
    firefox)
        echo "Firefox: A nonprofit browser fighting for an open, user-respecting web."
        echo "         Mozilla exists because Netscape chose to open-source its code."
        ;;
    vlc)
        echo "VLC: Born in a Paris university dormitory. Plays anything, for free."
        echo "     A perfect example of students building for the community."
        ;;
    python3|python)
        echo "Python: A language shaped entirely by community consensus."
        echo "        Governed by PEPs — anyone can propose a change to the language."
        ;;
    libreoffice)
        echo "LibreOffice: Born from a community fork of OpenOffice.org."
        echo "             A lesson in what happens when a community reclaims its software."
        ;;
    *)
        # Default case for any package not explicitly listed above
        echo "$PACKAGE: An open-source tool contributing to the commons of knowledge."
        ;;
esac

echo "============================================="
