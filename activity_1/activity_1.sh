#!/bin/bash

# Get user information
username=$(whoami)

# Get date and time
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

# Get current working directory
current_directory=$(pwd)

# Count the number of files in the current directory
file_count=$(ls -l | grep -v ^d | wc -l)

# Find the biggest file in the current directory
biggest_file=$(du -h --max-depth=1 | sort -rh | head -n 1)

# Display information
echo "Username: $username"
echo "Date: $current_date"
echo "Time: $current_time"
echo "Current Directory: $current_directory"
echo "Number of Files in Current Directory: $file_count"
echo "Biggest File in Current Directory: $biggest_file"
