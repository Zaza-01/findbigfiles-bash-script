#!/bin/bash

# AUTHOR : Moataz Osama
# Script name : findbigfiles.sh
# Purpose : The user enters a number of bytes, and the script finds all files within the present working directory which are bigger than the specified number of bytes.

# Function to display script usage information
function usage {
    echo "***************************************"
    echo -e "\nPass one argument as shown below"
    echo "USAGE : ./findbigfiles.sh [Number of MB]"
    echo "EXAMPLE : ./findbigfiles.sh 5"
    echo -e "\n***************************************"
}

# Function to handle script exit and display a message
function trap_exit {
    echo -e "\n***********************************"
    echo -e "\n\n EXITING ON A TRAPPED SIGNAL"
    echo -e "\n\n *********************************\n"
}

# Get the current date and time in a specific format
DATE_STAMP=$(date -u +"%h %d,%Y,%T")

# Get the present working directory
SEARCH_PATH=$(pwd)

# Get the file size (in megabytes) from the command line argument
FILE_SIZE=$1

# Check if the number of command line arguments is correct
if [ $# -ne 1 ]; then
    usage
    exit 1
fi

# Display information about the search
echo "Searching for Files Larger Than $FILE_SIZE MB starting in:"
echo -e "\n$SEARCH_PATH"
echo -e "\nPlease Standby for the Search Results..."

echo -e "\nDate and the Time is : $DATE_STAMP"

# Trap signals 1, 2, 3, and 15 and call the trap_exit function
trap 'trap_exit; exit 2' 1 2 3 15

# Find files in the specified path that are larger than the specified size (in megabytes) and save the results to a temporary file
find $SEARCH_PATH -type f -size "$FILE_SIZE"M > temp.txt

# Check if the temporary file has content
if [ -s temp.txt ]; then
    # Count the number of lines in the temporary file
    num_lines=$(cat temp.txt | wc -l)
    
    # Display the number of files found and list the files
    echo -e "\nNumber of files found which are larger than $FILE_SIZE MB are: $num_lines"
    echo -e "\nFiles found are: "
    cat temp.txt | more
else
    # If no files are found, display a message and exit
    echo -e "\nno files found which are more than $FILE_SIZE"
    echo -e "\nExiting"
fi

# Remove the temporary file
rm temp.txt
