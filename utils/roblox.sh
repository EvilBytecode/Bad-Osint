#!/usr/bin/bash

get_rolimons_info() {
    local PLAYER_ID="$1"

    response=$(curl -s "https://www.rolimons.com/api/playerassets/${PLAYER_ID}")
    echo
    echo "Response from Rolimons API:"
    echo "$response"

    success=$(echo "$response" | grep -oP '"success":\s*\K[^,]*')
    message=$(echo "$response" | grep -oP '"message":\s*"\K[^"]*' | tr -d '\n')

    if [[ "$success" == "false" && "$message" == "Player inventory scan failed" ]]; then
        echo "Rolimons API problem, trying Roblox API..."
        get_roblox_info "$PLAYER_ID"
    elif [[ "$success" == "true" ]]; then
        echo "Rolimons API Success:"
        id=$(echo "$response" | grep -oP '"id":\s*\K[^,]*')
        assets=$(echo "$response" | grep -oP '"playerAssets":\s*{\K[^}]*')
    else
        echo 
    fi
}

get_roblox_info() {
    local PLAYER_ID="$1"

    response=$(curl -s "https://users.roblox.com/v1/users/${PLAYER_ID}")

    echo # this is for debugging btw
    echo
    echo "Response from Roblox API:"
    echo "$response"

    success=$(echo "$response" | grep -oP '"success":\s*\K[^,]*')

    if [[ "$success" == "true" ]]; then
        id=$(echo "$response" | grep -oP '"id":\s*\K[^,]*')
        name=$(echo "$response" | grep -oP '"name":\s*"\K[^"]*')
        displayName=$(echo "$response" | grep -oP '"displayName":\s*"\K[^"]*')
        description=$(echo "$response" | grep -oP '"description":\s*"\K[^"]*')
        created=$(echo "$response" | grep -oP '"created":\s*"\K[^"]*')
        isBanned=$(echo "$response" | grep -oP '"isBanned":\s*\K[^,]*')

        printf "ID: %s
Name: %s
Display Name: %s
Description: %s
Created: %s
Is Banned: %s\n" \
            "$id" "$name" "$displayName" "$description" "$created" "$isBanned"
    else
        echo
    fi
}
