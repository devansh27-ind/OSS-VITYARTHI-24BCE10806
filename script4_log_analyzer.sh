#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Devansh Agrawal | Reg: 24BCE10806
# Course: Open Source Software | VIT Bhopal University
# Usage:  ./script4_log_analyzer.sh /path/to/logfile [keyword]
# Example:./script4_log_analyzer.sh /var/log/syslog error
# Purpose: Read a log file line by line, count keyword matches,
#          and display the last 5 matching lines.
# ============================================================

# $1 = log file path (required positional argument)
# $2 = keyword to search for (optional; defaults to 'error')
LOGFILE="$1"
KEYWORD="${2:-error}"   # If $2 is not provided, use 'error' as default

COUNT=0                 # Counter variable, initialised to zero

# --- Validate that the user provided a log file argument ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 /path/to/logfile [keyword]"
    echo "Example: $0 /var/log/syslog error"
    echo ""
    echo "Tip: On systems without /var/log/syslog, try:"
    echo "  sudo journalctl > /tmp/system.log"
    echo "  $0 /tmp/system.log error"
    exit 1
fi

# --- Check that the specified log file exists ---
# -f test: true if the path is a regular file that exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Do-while style retry if the file is empty ---
# In bash, a do-while is simulated with: while true; do ... [condition] && break; done
# -s test: true if the file exists AND has a size greater than zero
ATTEMPT=0
while [ ! -s "$LOGFILE" ]; do
    ATTEMPT=$((ATTEMPT + 1))
    echo "Warning: '$LOGFILE' appears to be empty. (Attempt $ATTEMPT of 3)"

    # After 3 failed attempts, give up
    if [ "$ATTEMPT" -ge 3 ]; then
        echo "File remains empty after $ATTEMPT checks. Please provide a non-empty log file."
        exit 1
    fi

    sleep 2   # Wait 2 seconds before retrying (log may still be written)
done

echo "======================================================"
echo "  Log File Analyzer | Devansh Agrawal | 24BCE10806   "
echo "======================================================"
echo "File     : $LOGFILE"
echo "Keyword  : '$KEYWORD' (case-insensitive)"
echo "------------------------------------------------------"

# --- Main loop: read the log file line by line ---
# IFS= : disables word splitting so leading spaces are preserved
# -r   : prevents backslash sequences from being interpreted
# < "$LOGFILE" : redirects the file as input to the while loop
while IFS= read -r LINE; do

    # grep -iq: case-insensitive (-i), quiet mode (-q) — only sets exit code
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Arithmetic expansion to increment counter
    fi

done < "$LOGFILE"

# --- Print the summary ---
echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Show the last 5 matching lines for context ---
echo "Last 5 matching lines:"
echo "------------------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "------------------------------------------------------"
echo "======================================================"
