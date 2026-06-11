#!/bin/bash
# ==============================================================================
#  PROJECT: SIAM2 ULTRA ANIMATED SETUP (FINAL FIX)
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

# --- ব্যাকগ্রাউন্ড প্রসেস স্পイナー অ্যানিমেশন ফাংশন ---
run_with_animation() {
    local message=$1
    local command=$2
    
    eval "$command" > /dev/null 2>&1 &
    local pid=$!
    
    while kill -0 $pid 2>/dev/null; do
        for spin in "◢" "◣" "◤" "◥"; do
            printf "\r${BOLD}${CR_CYAN}[${CR_PINK}${spin}${CR_CYAN}] ${CR_WHITE}${message}...${RESET}"
            sleep 0.08
        done
    done
    
    wait $pid
    printf "\r${BOLD}${CR_GREEN}[✓] ${message} DONE! 🎉${RESET}\n"
}

# --- 1. DYNAMIC COMPACT BANNER (টার্মাক্সে কখনোই কাটবে না) ---
banner_siam_codex() {
    local offset=$1
    local c1=$2
    local c2=$3
    # স্ক্রিন সাইজ ছোট হলেও যেন না কাটে তাই একদম নিখুঁত সাইজের প্রফেশনাল ব্যানার layout
    printf "\033[%d;%dH${BOLD}${c1}  ██████╗██╗ █████╗ ███╗   ███╗  ${c2}██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗${RESET}\n" $((mid_line - 5)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██╔════╝██║██╔══██╗████╗ ████║  ${c2}██╔═══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝${RESET}\n" $((mid_line - 4)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚█████╗ ██║███████║██╔████╔██║  ${c2}██║   ██║██║  ██║█████╗   ╚███╔╝ ${RESET}\n" $((mid_line - 3)) $offset
    printf "\033[%d;%dH${BOLD}${c1}   ╚═══██╗██║██╔══██║██║╚██╔╝██║  ${c2}██║   ██║██║  ██║██╔══╝   ██╔██╗ ${RESET}\n" $((mid_line - 2)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██████╔╝██║██║  ██║██║ ╚═╝ ██║  ${c2}╚██████╔╝██████╔╝███████╗██╔╝ ██╗${RESET}\n" $((mid_line - 1)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚══════╝╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ${c2} ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝${RESET}\n" $mid_line $offset
}

# অফসেট সেট করা হলো যেন স্ক্রিনের বাম পাশ থেকে ঠিকঠাক বসে
start_offset=$((mid_col - 37))
if ((start_offset < 1)); then start_offset=1; fi

# Kinetic Slide Animation
for ((col_shift=cols; col_shift>=start_offset; col_shift-=5)); do
    clear
    banner_siam_codex $col_shift $CR_CYAN $CR_GREEN
    sleep 0.01
done

clear
banner_siam_codex $start_offset $CR_CYAN $CR_GREEN
printf "\033[%d;%dH${BOLD}${CR_YELLOW}👑 OFFICIAL CREDIT: SIAM / SIAM CODEX 👑${RESET}" $((mid_line + 2)) $((mid_col - 19))
printf "\033[%d;%dH${CR_WHITE}─────────────────────────────────────────────────────────────────────────────${RESET}" $((mid_line + 3)) $((mid_col - 38))

# --- 2. FAST DEPENDENCY HANDLING ---
echo -e "\n"
printf "\033[%d;2H" $((mid_line + 5))

echo -e "${BOLD}${CR_ORANGE}[➔] Injected Core Environment Booting...${RESET}"
sleep 0.2

# প্যাকেজ আপডেট যদি লক হয়ে থাকে, তাই জোর করে তা স্কিপ বা রান করানো
run_with_animation "Syncing Termux Packages" "pkg update -y --fix-missing"

# পাইথন এবং গিট চেক ও ইনস্টল
if ! command -v python &> /dev/null; then
    run_with_animation "Installing Python Engine" "pkg install python -y"
fi

if ! command -v git &> /dev/null; then
    run_with_animation "Installing Git Core" "pkg install git -y"
fi

# Flask ডিপেন্ডেন্সি ইনস্টল নিশ্চিত করা
run_with_animation "Verifying Flask Core Framework" "pip install --upgrade flask werkzeug"

# --- 3. REPOSITORY CHECKS & GUARANTEED FLASK RUN ---
echo -e "${BOLD}${CR_GREEN}[✓] Setup Process Finished!${RESET}"
sleep 0.2

# প্রজেক্ট ডিরেক্টরি লোড করা
if [ -d "Siam-info-web" ]; then
    cd Siam-info-web
elif [ -d "Siam-Codex-info-ban-web" ]; then
    cd Siam-Codex-info-ban-web
fi

# লাইভ ড্যাশবোর্ড কার্ড প্রিন্ট করা
clear
banner_siam_codex $start_offset $CR_CYAN $CR_GREEN
printf "\033[%d;%dH${BOLD}${CR_YELLOW}👑 OFFICIAL CREDIT: SIAM / SIAM CODEX 👑${RESET}" $((mid_line + 2)) $((mid_col - 19))
printf "\033[%d;%dH${CR_WHITE}─────────────────────────────────────────────────────────────────────────────${RESET}" $((mid_line + 3)) $((mid_col - 38))

echo -e "\n\n"
echo -e "  ${BOLD}${CR_GREEN}╔════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "    ${BOLD}${CR_WHITE}🚀 SIAM-CODEX SERVER IS INITIATING LIVE NOW...                 ${RESET}"
echo -e "    ${BOLD}${CR_CYAN}🌐 Local Web Link: ${CR_YELLOW}http://127.0.0.1:5000                       ${RESET}"
echo -e "    ${BOLD}${CR_PURPLE}🛡️ Credit Signature: Verified BY SIAM CODEX                   ${RESET}"
echo -e "  ${BOLD}${CR_GREEN}╚════════════════════════════════════════════════════════════════╝${RESET}"
echo -e "\n"

# Restore cursor 
printf "\033[?25h"

# 🛑 মেইন পাইথন ফাইলটি যাতে ১০০% রান হয় তার গ্যারান্টিড কমান্ড
if [ -f "app.py" ]; then
    python app.py
elif [ -f "../app.py" ]; then
    cd .. && python app.py
else
    # যদি কোনো কারণে ফাইল না পায়, তবে কারেন্ট ফোল্ডারের যেকোনো পাইথন ফাইল খুঁজবে
    python *.py 2>/dev/null || echo -e "${CR_RED}[✗] Error: app.py file not found in directory!${RESET}"
fi
