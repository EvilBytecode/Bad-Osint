#!/usr/bin/bash

source utils/ipinfo.sh
source utils/osint.sh #btw this is replit i named it cuz idk felt like it
source utils/instagram.sh
source utils/roblox.sh


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

ascii() {
    echo -e "${RED}__________      .__                  __________              "
    echo "\\______   \\__ __|  |   ______ ____   \\______   \\ _______  ___"
    echo " |     ___/  |  \\  |  /  ___// __ \\   |    |  _//  _ \\  \\/  /"
    echo " |    |   |  |  /  |__\\___ \\\\  ___/   |    |   (  <_> >    < "
    echo " |____|   |____/|____/____  >\\___  >  |______  /\\____/__/>_ \\"
    echo
    echo -e "${YELLOW}[1] IP Info${RESET}"
    echo -e "${MAGENTA}[2] EMAIL OSINT NEEDS TO BE FINISHED${RESET}"
    echo -e "${MAGENTA}[3] USERNAME OSINT NOTDONE${RESET}"
    echo -e "${MAGENTA}[4] ROBLOX OSINT${RESET}"
    echo -e "${RED}[0] Exit${RESET}"
    echo 
}

IpInf() {
    echo "Enter the IP address:"
    read -r ip
    ip_info=$(IpInfo "${ip}")
    echo -e "\nIP Info for ${ip}:\n${ip_info}"
}

Osint() {
    echo "Input your email:"
    read -r email
    replit "${email}"
    fetchinsta "${email}"
}

while true; do
    clear
    ascii

    echo "Enter your choice:"
    read -r choice

    case $choice in
        1)
            IpInf
            ;;
        2)
            Osint
            ;;


        4)
            echo "Enter the ROBLOX Player ID:"
            read -r roblox_player_id
            get_rolimons_info "$roblox_player_id"
            get_roblox_info "$roblox_player_id"
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac

    read -rp "Press Enter to continue..."
done
