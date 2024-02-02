#!/bin/bash

# Function to check if the password meets the security criteria
validate_password() {
    local password=$1

    if [ ${#password} -lt 8 ]; then
        echo "Password should be 8 or more characters."
        return 1
    fi

    if ! [[ "$password" =~ [0-9] ]] || ! [[ "$password" =~ [a-zA-Z] ]]; then
        echo "Password should contain both numbers and letters."
        return 1
    fi

    if ! [[ "$password" =~ [a-z] ]] || ! [[ "$password" =~ [A-Z] ]]; then
        echo "Password should contain both uppercase and lowercase letters."
        return 1
    fi

    echo "Password is secure."
    return 0
}

# Prompt the user to enter a password
read -p "Enter your password: " user_password
echo

# Validate the entered password
validate_password "$user_password"
