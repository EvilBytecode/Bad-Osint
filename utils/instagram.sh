#!/usr/bin/bash

fetchinsta() {
    local email=$1

    url="https://www.instagram.com/api/v1/web/accounts/web_create_ajax/attempt/"
    user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/119.0"
    referer="https://www.instagram.com/accounts/emailsignup/"
    origin="https://www.instagram.com"
    content_type="application/x-www-form-urlencoded"
    accept="*/*"
    accept_language="en-US,en;q=0.5"
    csrf_token="UAi9zJR7Uw7tO7ewCb6mLOAO322y7XGv"
    cookie="csrftoken=UAi9zJR7Uw7tO7ewCb6mLOAO322y7XGv; mid=ZVewFAALAAFPASBJmxyrALxhDDlr; ig_did=0365D830-FAEB-48A6-B3BB-45AAE01CF59D; datr=pLhZZbfS9agFpDkDBMD82ACb"

    enc_password="%23PWD_INSTAGRAM_BROWSER%3A10%3A1700399110%3AAdxQAOAvUgpkq%2FilxWO457tIzhedeh4iQ95QOhijLbmH995guzqHfR7fFirx9QDG4vl%2Bmr7Dwe%2B0gbZc79X2%2FAdrCjLoxtwtZMuhBa6ciieMo7XURFVPD1XSWEIfcRnXwO7QEegLYHsaDzaiPR6iHvaMpA%3D%3D"
    first_name="Xian"
    username="xi.an8859"
    client_id="ZVewFAALAAFPASBJmxyrALxhDDlr"
    seamless_login_enabled="1"
    opt_into_one_tap="false"

    data="enc_password=$enc_password&email=$email&first_name=$first_name&username=$username&client_id=$client_id&seamless_login_enabled=$seamless_login_enabled&opt_into_one_tap=$opt_into_one_tap"

    response=$(curl -s -X POST "$url" \
        -H "User-Agent: $user_agent" \
        -H "Referer: $referer" \
        -H "Origin: $origin" \
        -H "Content-Type: $content_type" \
        -H "Accept: $accept" \
        -H "Accept-Language: $accept_language" \
        -H "X-CSRFToken: $csrf_token" \
        -H "Cookie: $cookie" \
        --data "$data")

    if [[ $response == *"\"account_created\": true"* ]]; then
        echo "[+] Instagram account created"
    else
        echo "[-] Instagram account not created"
        echo "[-] Read the response so you know if its used or not"
        echo
        echo
        echo "$response"
    fi
}
