#!/usr/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'

replit() {
    local email=$1

    url="https://replit.com/data/user/exists"

    response=$(curl -s -X POST $url -H "Accept: application/json" -H "Content-Type: application/json" -H "Origin: https://replit.com" -H "Referer: https://replit.com/signup" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/119.0" -H "X-Requested-With: XMLHttpRequest" -d "{\"email\":\"$email\"}")

    echo

    if [[ $response == *"exists\":true"* ]]; then
        echo "[+] Replit Account Exists"
    else

        echo "[-] Replit Account Doesn't Exist"
    fi
}
