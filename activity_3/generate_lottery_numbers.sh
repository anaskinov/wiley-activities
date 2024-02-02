#!/bin/bash

# Get today's date in YYYYMMDD format
today=$(date +"%Y%m%d")

# Function to generate random numbers
generate_numbers() {
    local min=$1
    local max=$2
    local count=$3

    for ((i = 0; i < count; i++)); do
        echo $((RANDOM % (max - min + 1) + min))
    done
}

# Generate 5 lottery numbers between 1 and 50
lottery_numbers=$(generate_numbers 1 50 5)

# Generate a bonus ball number between 1 and 10
bonus_ball=$(generate_numbers 1 10 1)

# Output the numbers to a file with the date in its name
output_file="lottery_numbers_${today}.txt"
echo "Lottery Numbers: $lottery_numbers" > "$output_file"
echo "Bonus Ball: $bonus_ball" >> "$output_file"

echo "Lottery numbers generated and saved to $output_file."

