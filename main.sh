#! /bin/bash

echo -e "\n--------------Welcome to the program--------------------\nAuthors: Bineet K Dash, Diptanil Roy, Amit B Sanyal \n\nChoose any of the systems below to simulate: \n [1] Regular System \n [2] One Initial Speed \n [3] Uniform Speed \n"

read -p "Enter your choice (1,2,3): " choice

case $choice in
1) cd Regular/
   echo -e "Please keep the number of particles below 200 \n"
   ./Simulate
;;

2) cd OneInitialSpeed/
 	echo -e "Please keep the number of particles below 200 \n"
   ./Simulate
;;

3) cd UniformSpeed/
	echo -e "Please keep the number of particles below 200 \n"
    ./Simulate
;;

*) echo "Please enter any of the numbers 1,2,3 as your choice"
;;

esac

echo -e "\n"
