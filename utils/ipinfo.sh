#!/usr/bin/bash

IpInfo() {
    local ip=$1
    local api_url="https://ipapi.com/ip_api.php?ip=${ip}"

    local result=$(curl -s "${api_url}")

    if [ "$(grep -oP '"ip": "\K[^"]+' <<< "${result}")" == "null" ]; then
        echo "Error: Unable to retrieve IP information. Check your IP address and try again."
    else
        local formatted="IP: ${ip}\n"
        formatted+="Country: $(grep -oP '"country_name": "\K[^"]+' <<< "${result}")\n"
        formatted+="Region: $(grep -oP '"region_name": "\K[^"]+' <<< "${result}")\n"
        formatted+="City: $(grep -oP '"city": "\K[^"]+' <<< "${result}")\n"
        formatted+="Latitude: $(grep -oP '"latitude": \K[^,]+' <<< "${result}")\n"
        formatted+="Longitude: $(grep -oP '"longitude": \K[^,]+' <<< "${result}")\n"
        formatted+="ISP: $(grep -oP '"isp": "\K[^"]+' <<< "${result}")\n"
        formatted+="AS Number: $(grep -oP '"asn": \K[^,]+' <<< "${result}")\n"
        formatted+="Time Zone: $(grep -oP '"code": "\K[^"]+' <<< "${result}")\n"

        echo -e "${formatted}"
    fi
}
