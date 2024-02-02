#!/bin/bash

	#function to calculate product of integers
calculate_product() {
	local product=1
	for num in "${numbers[@]}"; do
		((product *= num))
	done
	echo $product
}

	#function to calculate the average of  integers
calculate_average() {
	local sum=0
	for num in "${numbers[@]}"; do
		((sum += num))
	done
	local count=${#numbers[@]}
	echo "scale=2; $sum / $count" | bc
}

	#function to calculate the minimum value of the integers
min_value() {
	local min=${numbers[0]}
	for num in "${numbers[@]}"; do
		((num < min)) && min=$num
	done
	echo $min
}
	#function to calculate the maximum value of the integers
max_value() {
	local max=${numbers[0]}
	for num in "${numbers[@]}"; do
		((num > max)) && max=$num
	done
	echo $max
}

	#prompt for entering integers
	#prompt for how to stop prompting after 5 integers or once you reach 10
echo "Enter a series of integers. Enter at least 5 numbers and no more than 10"
echo "to stop entering numbers type 'stop' or when 10 numbers are entered"

	#main program (front-endish)
numbers=()
count=0

while [ $count -lt 10 ]; do
	read -p "enter an integer: " input
		
	#check if user wants to stop or if they have entered 10 integers
	if [ $count -ge 5 ] && [ "$input" == "stop" ] || [ $count -eq 10 ]; then
		break
	fi

	#make sure input is an integer
	if ! [[ "$input" =~ ^[0-9]+$ ]]; then
		echo "Invalid input. Enter an integer"
		continue
	fi
	
	numbers+=("$input")
	((count++))
done

		#displaying the values
echo -e "\nValues entered: ${numbers[@]}"

		#do calculations
product=$(calculate_product)
average=$(calculate_average)
sum=$(echo "${numbers[@]}" | tr ' ' '+' | bc)
min=$(min_value)
max=$(max_value)

		#display calculations
echo "product: $product"
echo "average: $average"
echo "sum: $sum"
echo "min_value: $min"
echo "max_value: $max"

