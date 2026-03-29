#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Devansh Agrawal | Reg: 24BCE10806
# Course: Open Source Software | VIT Bhopal University
# Purpose: Loop through important system directories and report
#          their disk usage, permissions, and owner/group.
#          Also checks Git's specific config file locations.
# ============================================================

# --- Define the list of directories to audit as an array ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/git-core")

echo "======================================================"
echo "       Directory Audit Report                        "
echo "       Devansh Agrawal | 24BCE10806                  "
echo "======================================================"

# printf for column-aligned output (%-30s = left-align in 30 chars)
printf "%-30s %-22s %-8s\n" "Directory" "Permissions / Owner" "Size"
echo "------------------------------------------------------"

# --- For loop: iterate over every directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do

    # -d test: check whether the path is a directory that exists
    if [ -d "$DIR" ]; then

        # ls -ld: list the directory entry itself, not its contents
        # awk '{print $1, $3"/"$4}' extracts: permissions, owner/group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3"/"$4}')

        # du -sh: summarise total disk usage in human-readable format
        # 2>/dev/null: suppress "Permission denied" errors silently
        # cut -f1: keep only the first tab-separated field (the size)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print the row; ${SIZE:-N/A} means "use N/A if SIZE is empty"
        printf "%-30s %-22s %-8s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"

    else
        # Directory does not exist on this system
        printf "%-30s %-22s\n" "$DIR" "[does not exist on this system]"
    fi

done

echo "======================================================"
echo ""
echo "--- Git Configuration File Audit ---"
echo ""

# --- Check system-wide Git config (/etc/gitconfig) ---
GIT_SYSCFG="/etc/gitconfig"
if [ -f "$GIT_SYSCFG" ]; then
    echo "System gitconfig found: $GIT_SYSCFG"
    # ls -lh: human-readable long listing for the file
    ls -lh "$GIT_SYSCFG"
else
    echo "No /etc/gitconfig found (normal if no system-wide git config is set)."
fi

echo ""

# --- Check user-level Git config (~/.gitconfig) ---
USER_CFG="$HOME/.gitconfig"
if [ -f "$USER_CFG" ]; then
    echo "User gitconfig found: $USER_CFG"
    ls -lh "$USER_CFG"
    echo ""
    echo "Contents of ~/.gitconfig:"
    echo "------------------------------------------------------"
    cat "$USER_CFG"
    echo "------------------------------------------------------"
else
    echo "No ~/.gitconfig found. Run 'git config --global user.name' to create one."
fi

echo "======================================================"
