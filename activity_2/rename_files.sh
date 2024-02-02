#!/bin/bash

# Get today's date in YYYYMMDD format
today=$(date +"%Y%m%d")

# Iterate through each file in the directory
for file in $(ls); do
    # Exclude the script itself
    if [ "$file" != "rename_files.sh" ]; then
        # Check if it is a file
        if [ -f "$file" ]; then
            # Get the file extension
            extension="${file##*.}"

            # Rename the file with today's date and the original extension
            mv "$file" "${today}_${file%.*}.${extension}"
        fi
    fi
done


