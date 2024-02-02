#!/bin/bash

# Function to count matching numbers
count_matches() {
    local numbers_array=($1)
    local user_numbers_array=($2)
    local count=0

    for number in "${user_numbers_array[@]}"; do
        if [[ " ${numbers_array[@]} " =~ " ${number} " ]]; then
            ((count++))
        fi
    done

    echo $count
}

# Get today's date in YYYYMMDD format
today=$(date +"%Y%m%d")

# Prompt the user to enter their lottery numbers
read -p "Enter your 5 lottery numbers (separated by spaces): " user_numbers

# Prompt the user to enter the bonus ball number
read -p "Enter your bonus ball number: " user_bonus_ball

# Read the generated lottery numbers from the corresponding file
lottery_numbers_file="lottery_numbers_${today}.txt"
if [ -f "$lottery_numbers_file" ]; then
    source "$lottery_numbers_file"

    # Convert the string of lottery numbers to an array
    IFS=', ' read -r -a numbers_array <<< "$Lottery Numbers"

    # Convert the user input to an array
    IFS=' ' read -r -a user_numbers_array <<< "$user_numbers"

    # Check for matches
    matches=$(count_matches "${numbers_array[@]}" "${user_numbers_array[@]}")

    # Check the bonus ball
    bonus_ball_match=false
    if [ "$user_bonus_ball" == "$Bonus Ball" ]; then
        bonus_ball_match=true
    fi

    # Display the results
    echo -e "\nLottery Numbers: ${numbers_array[@]}"
    echo "Your Numbers: ${user_numbers_array[@]}"
    echo -e "Bonus Ball: $Bonus Ball (Your guess: $user_bonus_ball)\n"

    if [ "$matches" -eq 5 ]; then
        echo "Congratulations! You have all 5 numbers matched!"
    else
        echo "Matches: $matches"
        if [ "$bonus_ball_match" == true ]; then
            echo "Bonus Ball matched!"
        else
            echo "No bonus ball match."
        fi
    fi
else
    echo "Lottery numbers file not found. Please run the lottery number generator script first."
fi

