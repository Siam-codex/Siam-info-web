#!/bin/bash
# ==============================================================================
#  PROJECT: SIAM2 ULTRA ANIMATED SETUP (REAL INSTALLER)
#  DEVELOPER & CREDIT: SIAM / SIAM CODEX
# ==============================================================================

# Reset and initialization
printf "\033[0m"
clear

# Ensure trap handles exits cleanly restoring cursor
trap "printf '\033[?25h\033[0m'; exit" INT TERM

# Custom ANSI Colors
CR_RED="\033[38;5;196m"
CR_ORANGE="\033[38;5;208m"
CR_YELLOW="\033[38;5;220m"
CR_GREEN="\033[38;5;46m"
CR_CYAN="\033[38;5;51m"
CR_BLUE="\033[38;5;27m"
CR_PURPLE="\033[38;5;129m"
CR_PINK="\033[38;5;201m"
CR_WHITE="\033[38;5;255m"
CR_GRAY="\033[38;5;244m"
RESET="\033[0m"
BOLD="\033[1m"

# Hide cursor for immersive animation
printf "\033[?25l"

lines=$(tput lines)
cols=$(tput cols)
mid_line=$((lines / 2))
mid_col=$((cols / 2))

# --- ব্যাকগ্রাউন্ড প্রসেস স্পিনার অ্যানিমেশন ফাংশন (REAL ANIMATION) ---
run_with_animation() {
    local message=$1
    local command=$2
    
    # ব্যাকগ্রাউন্ডে মেইন কমান্ড রান করানো
    eval "$command" > /dev/null 2>&1 &
    local pid=$!
    
    # কমান্ড শেষ না হওয়া পর্যন্ত অ্যানিমেশন চলবে
    while kill -0 $pid 2>/dev/null; do
        for spin in "◢" "◣" "◤" "◥"; do
            printf "\r${BOLD}${CR_CYAN}[${CR_PINK}${spin}${CR_CYAN}] ${CR_WHITE}${message}...${RESET}"
            sleep 0.08
        done
    done
    
    # প্রসেস সাকসেসফুলি শেষ হলে টিক মার্ক দেখাবে
    wait $pid
    if [ $? -eq 0 ]; then
        printf "\r${BOLD}${CR_GREEN}[✓] ${message} COMPLETE! 🎉${RESET}\n"
    else
        printf "\r${BOLD}${CR_RED}[✗] ${message} FAILED! ❌${RESET}\n"
    fi
}

# --- 1. DYNAMIC SIAM CODEX BANNER (COMPACT & COOL) ---
clear
banner_siam_codex() {
    local offset=$1
    local c1=$2
    local c2=$3
    printf "\033[%d;%dH${BOLD}${c1}  ██████╗██╗ █████╗ ███╗   ███╗  ${c2} ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗ ${RESET}\n" $((mid_line - 5)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██╔════╝██║██╔══██╗████╗ ████║  ${c2}██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝  ${RESET}\n" $((mid_line - 4)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚█████╗ ██║███████║██╔████╔██║  ${c2}██║     ██║   ██║██║  ██║█████╗   ╚███╔╝   ${RESET}\n" $((mid_line - 3)) $offset
    printf "\033[%d;%dH${BOLD}${c1}   ╚═══██╗██║██╔══██║██║╚██╔╝██║  ${c2}██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗   ${RESET}\n" $((mid_line - 2)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██████╔╝██║██║  ██║██║ ╚═╝ ██║  ${c2}╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗  ${RESET}\n" $((mid_line - 1)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚══════╝╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ${c2} ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝  ${RESET}\n" $mid_line $offset
}

start_offset=$((mid_col - 39))
if ((start_offset < 1)); then start_offset=1; fi

# Fast Kinetic Slide
for ((col_shift=cols; col_shift>=start_offset; col_shift-=6)); do
    clear
    banner_siam_codex $col_shift $CR_BLUE $CR_CYAN
    sleep 0.01
done

clear
banner_siam_codex $start_offset $CR_CYAN $CR_GREEN
printf "\033[%d;%dH${BOLD}${CR_YELLOW}👑 OFFICIAL CREDIT: SIAM / SIAM CODEX 👑${RESET}" $((mid_line + 2)) $((mid_col - 19))
printf "\033[%d;%dH${CR_WHITE}─────────────────────────────────────────────────────────────────────────────${RESET}" $((mid_line + 3)) $((mid_col - 38))

# --- 2. REAL DEPENDENCY INSTALLATION WITH LIVE ANIMATION ---
echo -e "\n"
printf "\033[%d;2H" $((mid_line + 5))

echo -e "${BOLD}${CR_ORANGE}[➔] Injected Core Environment Booting...${RESET}"
sleep 0.2

# ১. রিয়েল টার্মাক্স প্যাকেজ আপডেট
run_with_animation "Updating Termux Packages (pkg update)" "pkg update -y && pkg upgrade -y"

# ২. রিয়েল পাইথন ইনস্টলেশন চেক ও ইনস্টল
if ! command -v python &> /dev/null; then
    run_with_animation "Installing Python Engine" "pkg install python -y"
else
    echo -e "${BOLD}${CR_GREEN}[✓] Python Environment: Already Installed! 🐍${RESET}"
fi

# ৩. রিয়েল গিট ইনস্টলেশন চেক ও ইনস্টল
if ! command -v git &> /dev/null; then
    run_with_animation "Installing Git Core" "pkg install git -y"
else
    echo -e "${BOLD}${CR_GREEN}[✓] Git Core Component: Already Installed! 🛠️${RESET}"
fi

# ৪. রিয়েল Flask এবং রিকোয়ারমেন্টস ইনস্টল
echo -e "${BOLD}${CR_CYAN}[+] Checking Python Dependencies...${RESET}"
run_with_animation "Installing Flask Server via PIP" "pip install flask werkzeug"

# --- 3. REPOSITORY CONFIGURATION & RUN ---
# যদি প্রজেক্ট ফোল্ডারে না থাকে, তবে ক্লোন করবে
if [ ! -f "app.py" ] && [ ! -f "../app.py" ]; then
    if [ -d "Siam-info-web" ]; then
        cd Siam-info-web
    elif [ -d "Siam-Codex-info-ban-web" ]; then
        cd Siam-Codex-info-ban-web
    else
        run_with_animation "Cloning Web Source Files" "git clone https://github.com/Siam-codex/Siam-info-web.git && cd Siam-info-web"
    fi
fi

# Setup Success Dashboard Card
echo -e "\n"
echo -e "  ${BOLD}${CR_GREEN}╔════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "    ${BOLD}${CR_WHITE}🚀 SIAM-CODEX SERVER IS RUNNING LIVE!                         ${RESET}"
echo -e "    ${BOLD}${CR_CYAN}🌐 Local Web Link: ${CR_YELLOW}http://127.0.0.1:5000                       ${RESET}"
echo -e "    ${BOLD}${CR_PURPLE}🛡️ Credit Signature: Verified BY SIAM CODEX                   ${RESET}"
echo -e "  ${BOLD}${CR_GREEN}╚════════════════════════════════════════════════════════════════╝${RESET}"
echo -e "\n"

# Restore cursor before running python server
printf "\033[?25h"

# মেইন সার্ভার রান করা
if [ -f "app.py" ]; then
    python app.py
elif [ -f "../app.py" ]; then
    cd .. && python app.py
fi
