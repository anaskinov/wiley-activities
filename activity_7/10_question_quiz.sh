#!/bin/bash

# True or False quiz game

questions=(
    "The Earth is flat." # False
    "Bananas are berries." # True
    "The capital of France is Berlin." # False
    "Cats can fly." # False
    "The sun is a star." # True
    "The Great Wall of China is visible from space." # False
    "Water boils at 100 degrees Fahrenheit." # False
    "The currency of Japan is the yen." # True
    "The Eiffel Tower is taller than the Statue of Liberty." # True
    "Mount Everest is the highest mountain in the world." # True
)

# Array to store correct answers
answers=(
    false
    true
    false
    false
    true
    false
    false
    true
    true
    true
)

correct_answers=0

echo "Welcome to the True or False Quiz Game!"

for ((i=0; i<10; i++)); do
    echo -e "\nQuestion $((i+1)): ${questions[$i]}"
    read -p "Is this statement true or false? " user_answer

    # Validate user input
    if [[ "$user_answer" == "true" || "$user_answer" == "false" ]]; then
        # Check the answer
        if [ "${user_answer}" == "${answers[$i]}" ]; then
            echo "Correct!"
            ((correct_answers++))
        else
            echo "Incorrect. The correct answer is ${answers[$i]}."
        fi
    else
        echo "Invalid input. Please enter 'true' or 'false'."
        ((i--))  # Decrement i to repeat the same question
    fi
done

echo -e "\nQuiz completed!"
echo "You got $correct_answers out of 10 questions correct."

