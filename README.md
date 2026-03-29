# 🔍 OSS Audit — Git

> **The Open Source Audit** | Capstone Project for OSS NGMC Course  
> VIT Bhopal University | School of Computing Science and Engineering

---

## 👤 Student Details

| Field | Details |
|---|---|
| **Name** | Devansh Agrawal |
| **Registration Number** | 24BCE10806 |
| **Course** | Open Source Software (OSS NGMC) |
| **Unit Coverage** | Units 1 – 5 |
| **Chosen Software** | **Git** (License: GPL v2) |
| **GitHub** | [@devansh27-ind](https://github.com/devansh27-ind) |

---

## 📂 Repository Structure

```
oss-audit-24BCE10806/
├── README.md                    ← You are here
├── scripts/
│   ├── script1_system_identity.sh       ← System Identity Report
│   ├── script2_package_inspector.sh     ← FOSS Package Inspector
│   ├── script3_disk_permission_audit.sh ← Disk and Permission Auditor
│   ├── script4_log_analyzer.sh          ← Log File Analyzer
│   └── script5_manifesto_generator.sh   ← Open Source Manifesto Generator
└── report/
    └── OSS_Capstone_DevanshAgrawal_24BCE10806.pdf   ← Project Report (upload here)
```

---

## 📜 Chosen Software: Git

**Git** is a free and open-source distributed version control system created by Linus Torvalds in 2005, licensed under the **GNU General Public License v2 (GPL v2)**. It was built after the Linux kernel community lost access to BitKeeper — a proprietary VCS — making it a direct product of the open-source philosophy it now helps sustain.

---

## 🛠️ Scripts Overview

### Script 1 — `script1_system_identity.sh`
**Purpose:** Displays a formatted welcome screen showing Linux distribution name, kernel version, logged-in user, home directory, system uptime, current date/time, and the open-source license covering the OS.  
**Shell Concepts:** Variables, `echo`, command substitution `$()`, `if-then`, `uname`, `whoami`, `uptime`, `date`, output formatting.

---

### Script 2 — `script2_package_inspector.sh`
**Purpose:** Checks whether the chosen software (Git) is installed, retrieves version and license metadata using `rpm` or `dpkg`, and uses a `case` statement to print a philosophy note about each recognised package.  
**Shell Concepts:** `if-then-elif-else`, `case` statement, `rpm -qi` / `dpkg -l`, `grep` with regex, `awk`, pipe (`|`) chaining, `command -v`.

---

### Script 3 — `script3_disk_permission_audit.sh`
**Purpose:** Loops through a list of important system directories and reports the size and owner/permissions of each. Also checks for Git's config files and prints their permissions.  
**Shell Concepts:** `for` loop with arrays, `ls -ld`, `du -sh`, `awk` for field extraction, `cut`, `printf` for aligned output, `2>/dev/null` for error suppression.

---

### Script 4 — `script4_log_analyzer.sh`
**Purpose:** Reads a log file line by line, counts occurrences of a keyword (default: `error`), prints a summary, and displays the last 5 matching lines. Accepts file path and keyword as arguments.  
**Shell Concepts:** `while IFS= read -r` loop, positional parameters `$1` `$2`, default values `${var:-default}`, counter arithmetic `$(())`, `grep -i`, `tail -5`, file test operators `-f`, `-z`, `-s`.

---

### Script 5 — `script5_manifesto_generator.sh`
**Purpose:** Interactively asks the user three questions and generates a personalised open-source philosophy paragraph, saving it to a uniquely named `.txt` file.  
**Shell Concepts:** `read -p` for interactive input, string concatenation, `heredoc` (`<<EOF`), `>` file writing, `date` command, `cat` for display, alias concept demonstrated via comment.

---

## ⚙️ Dependencies

All scripts require a standard Linux environment. The following tools must be available:

| Tool | Purpose | Install (Ubuntu/Debian) | Install (Fedora/RHEL) |
|---|---|---|---|
| `bash` | Shell interpreter | Pre-installed | Pre-installed |
| `git` | Script 2 target package | `sudo apt install git` | `sudo dnf install git` |
| `rpm` or `dpkg` | Package inspection | Pre-installed (distro-dependent) | Pre-installed (distro-dependent) |
| `coreutils` | `du`, `ls`, `date`, `cut`, `tail` | Pre-installed | Pre-installed |
| `grep` | Pattern matching | Pre-installed | Pre-installed |
| `awk` | Field extraction | Pre-installed | Pre-installed |

> **Note:** Scripts 1, 3, 4, and 5 have no external dependencies beyond a standard Linux installation. Script 2 auto-detects whether your system uses `rpm` (Fedora/RHEL/CentOS) or `dpkg` (Debian/Ubuntu) and adjusts accordingly.

---

## 🚀 How to Run Each Script

### Setup — Clone and Make Scripts Executable

```bash
# Clone the repository
git clone https://github.com/devansh27-ind/oss-audit-24BCE10806.git
cd oss-audit-24BCE10806/scripts

# Make all scripts executable
chmod +x *.sh
```

---

### Script 1 — System Identity Report

```bash
./script1_system_identity.sh
```

**Expected output:** A formatted welcome screen with system info including distro name, kernel version, uptime, and OS license message.

---

### Script 2 — FOSS Package Inspector

```bash
./script2_package_inspector.sh
```

**Expected output:** Detects whether `git` is installed, shows version and license metadata, and prints a philosophy note about Git.

> To inspect a different package, edit the `PACKAGE` variable inside the script.

---

### Script 3 — Disk and Permission Auditor

```bash
./script3_disk_permission_audit.sh
```

**Expected output:** A formatted table showing permissions, owner, and disk usage for `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, and `/usr/lib/git-core`. Also checks for Git config files.

---

### Script 4 — Log File Analyzer

```bash
# Basic usage with default keyword 'error'
./script4_log_analyzer.sh /var/log/syslog

# Custom keyword
./script4_log_analyzer.sh /var/log/syslog "warning"

# On systems without /var/log/syslog, try:
./script4_log_analyzer.sh /var/log/messages "error"

# Or use journalctl to create a test file first:
sudo journalctl > /tmp/system.log
./script4_log_analyzer.sh /tmp/system.log "error"
```

**Expected output:** Count of matching lines and the last 5 lines that contain the keyword.

---

### Script 5 — Open Source Manifesto Generator

```bash
./script5_manifesto_generator.sh
```

**Expected output:** Interactive prompts for 3 questions, followed by a personalised manifesto paragraph saved to `manifesto_<username>_<timestamp>.txt` and printed to screen.

---

## 📋 Submission Checklist

- [x] Public GitHub repository named `oss-audit-24BCE10806`
- [x] `README.md` with student details, script descriptions, and run instructions
- [x] All 5 `.sh` script files in `scripts/` directory
- [ ] Project report PDF uploaded to `report/` directory
- [ ] GitHub repo URL submitted on VITyarthi portal
- [ ] Report PDF uploaded directly on VITyarthi portal

---

## 📚 References

- GNU Project — The Free Software Definition: [gnu.org/philosophy/free-sw.html](https://gnu.org/philosophy/free-sw.html)
- Pro Git Book (free): [git-scm.com/book/en/v2](https://git-scm.com/book/en/v2)
- SPDX GPL-2.0 License: [spdx.org/licenses/GPL-2.0-only.html](https://spdx.org/licenses/GPL-2.0-only.html)
- The Linux Command Line by William Shotts: [linuxcommand.org](http://linuxcommand.org)
- Git source repository: [kernel.org/pub/software/scm/git](https://kernel.org/pub/software/scm/git/)

---

<div align="center">
  <sub>VIT Bhopal University | Open Source Software Course | 2025</sub>
</div>
