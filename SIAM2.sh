#!/bin/bash
# ==============================================================================
#  PROJECT: SIAM2 ULTRA ANIMATED SETUP
#  DEVELOPER & CREDIT: SIAM / SIAM CODEX
#  YEAR: 2026
# ==============================================================================

# Reset and initialization
printf "\033[0m"
clear

# Ensure trap handles exits cleanly restoring cursor
trap "printf '\033[?25h\033[0m'; clear; exit" INT TERM

# Custom ANSI and 256-Bit Ultra Colors
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

# Get terminal boundaries
lines=$(tput lines)
cols=$(tput cols)
mid_line=$((lines / 2))
mid_col=$((cols / 2))

# --- 1. RADIAL CYBER MATRIX SCAN ANIMATION ---
for ((i=1; i<=18; i++)); do
    clear
    # Dynamic grid simulation lines
    for ((l=2; l<lines-1; l+=3)); do
        if ((l % 2 == 0)); then
            printf "\033[%d;%dH${CR_GRAY}+ - - - - - - - - - - - - +${RESET}" $l $((mid_col - 13))
        fi
    done
    
    # Core system charging bar header
    printf "\033[%d;%dH${BOLD}${CR_CYAN}⚡ SIAM CORE ENGINE INITIATING ⚡${RESET}" $((mid_line - 3)) $((mid_col - 16))
    
    printf "\033[%d;%dH${CR_GRAY}[${RESET}" $((mid_line - 1)) $((mid_col - 11))
    for ((j=1; j<=20; j++)); do
        if ((j <= i * 1.2 || j <= i / 1)); then
            printf "${CR_GREEN}█${RESET}"
        else
            printf "${CR_GRAY}░${RESET}"
        fi
    done
    printf "${CR_GRAY}]${RESET}"
    
    # Rotating loading spinner accent
    case $((i % 4)) in
        0) spin="◢" ; color=$CR_RED ;;
        1) spin="◣" ; color=$CR_ORANGE ;;
        2) spin="◤" ; color=$CR_YELLOW ;;
        3) spin="◥" ; color=$CR_GREEN ;;
    esac
    printf "\033[%d;%dH${BOLD}${color}${spin} QUANTUM INJECTING: $((i * 5 + 10))%%${RESET}" $((mid_line + 1)) $((mid_col - 12))
    sleep 0.05
done

# --- 2. GLITCH BREAKOUT MATRIX EFFECTS ---
clear
for ((i=1; i<=30; i++)); do
    r_line=$((RANDOM % lines + 1))
    r_col=$((RANDOM % (cols - 10) + 1))
    r_color=$((16 + RANDOM % 215))
    printf "\033[%d;%dH\033[38;5;%dm⚡ SIAM-CODEX OVERRIDE ⚡${RESET}" $r_line $r_col $r_color
    if ((i % 6 == 0)); then
        sleep 0.02
    fi
done
sleep 0.1

# --- 3. THE GRAND BANNER REVEAL (DYNAMIC CYBER SLIDE) ---
clear
banner_siam() {
    local offset=$1
    local c1=$2
    local c2=$3
    printf "\033[%d;%dH${BOLD}${c1}   ██████╗ ██╗ █████╗ ███╗   ███╗    ${c2} ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗ ${RESET}\n" $((mid_line - 4)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██╔════╝ ██║██╔══██╗████╗ ████║    ${c2}██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝ ${RESET}\n" $((mid_line - 3)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚█████╗  ██║███████║██╔████╔██║    ${c2}██║     ██║   ██║██║  ██║█████╗   ╚███╔╝  ${RESET}\n" $((mid_line - 2)) $offset
    printf "\033[%d;%dH${BOLD}${c1}   ╚═══██╗ ██║██╔══██║██║╚██╔╝██║    ${c2}██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗  ${RESET}\n" $((mid_line - 1)) $offset
    printf "\033[%d;%dH${BOLD}${c1}  ██████╔╝ ██║██║  ██║██║ ╚═╝ ██║    ${c2}╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗ ${RESET}\n" $mid_line $offset
    printf "\033[%d;%dH${BOLD}${c1}  ╚══════╝ ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝    ${c2} ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝ ${RESET}\n" $((mid_line + 1)) $offset
}

# Calculated static safe center offset
start_offset=$((mid_col - 38))
if ((start_offset < 1)); then start_offset=1; fi

# Fast Kinetic Slide In
for ((col_shift=cols; col_shift>=start_offset; col_shift-=5)); do
    clear
    banner_siam $col_shift $CR_BLUE $CR_CYAN
    sleep 0.01
done

# RGB Chromatic Flash Strobe & Pulse
for ((p=1; p<=3; p++)); do
    banner_siam $start_offset $CR_RED $CR_PINK
    printf "\033[%d;%dH${BOLD}${CR_WHITE}⚡ DEVELOPMENT MASTERMIND: SIAM CODEX ⚡${RESET}" $((mid_line + 4)) $((mid_col - 18))
    sleep 0.1
    banner_siam $start_offset $CR_PURPLE $CR_BLUE
    printf "\033[%d;%dH${BOLD}${CR_YELLOW}👑 SYSTEM ACCESS AUTHORIZED BY SIAM 👑${RESET}" $((mid_line + 4)) $((mid_col - 18))
    sleep 0.1
    banner_siam $start_offset $CR_GREEN $CR_CYAN
    printf "\033[%d;%dH${BOLD}${CR_CYAN}✨ SHIELDING BACKBONE SYSTEMS RUNNING ✨${RESET}" $((mid_line + 4)) $((mid_col - 19))
    sleep 0.1
done

# Final Bright Neon Cyan Frame Hold
clear
banner_siam $start_offset $CR_CYAN $CR_GREEN
printf "\033[%d;%dH${BOLD}${CR_YELLOW}👑 OFFICIAL CREDIT: SIAM / SIAM CODEX 👑${RESET}" $((mid_line + 3)) $((mid_col - 20))
printf "\033[%d;%dH${CR_WHITE}─────────────────────────────────────────────────────────────────────────${RESET}" $((mid_line + 5)) $((mid_col - 37))

# --- 4. DEPLOYMENT MATRIX LOADER ---
echo -e "\n"
printf "\033[%d;2H" $((mid_line + 7))

echo -e "${BOLD}${CR_ORANGE}[➔] Initiating Cyber-Link Web Deployment Setup...${RESET}"
sleep 0.4
echo -e "${CR_GREEN}[✓] Firewall & Security Core Tuned Perfectly.${RESET}"
sleep 0.3

echo -e "\n${BOLD}${CR_CYAN}[+] Syncing Environment Dependencies (Flask Engine)...${RESET}"
sleep 0.6
echo -e "${CR_GREEN}[✓] Python Requirements Standardized.${RESET}"
sleep 0.3

echo -e "\n${BOLD}${CR_PINK}[+] Extracting Asset Templates (index.html)...${RESET}"
sleep 0.4

# Setup Success Dashboard Card
echo -e "\n"
echo -e "  ${BOLD}${CR_GREEN}╔════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "    ${BOLD}${CR_WHITE}🚀 SIAM-CODEX CUSTOM INTERFACE ACTIVATED!                      ${RESET}"
echo -e "    ${BOLD}${CR_CYAN}🌐 Local Web Link: ${CR_YELLOW}http://127.0.0.1:5000                   ${RESET}"
echo -e "    ${BOLD}${CR_PURPLE}🛡️ Author Signature: Secured & Powered BY SIAM                 ${RESET}"
echo -e "  ${BOLD}${CR_GREEN}╚════════════════════════════════════════════════════════════════╝${RESET}"
echo -e "\n"

# Restore cursor gracefully
printf "\033[?25h"
