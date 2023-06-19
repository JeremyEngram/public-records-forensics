#!/bin/bash

# User-friendly script for public records forensics

# Function to search court records
search_court_records() {
    read -p "Enter the keyword to search in court records: " keyword
    read -p "Enter the file name of court records: " filename
    echo "Searching court records..."
    grep "$keyword" "$filename"
    read -p "Press Enter to continue..."
}

# Function to search property records
search_property_records() {
    read -p "Enter the keyword to search in property records: " keyword
    read -p "Enter the file name of property records: " filename
    echo "Searching property records..."
    awk -F',' -v pattern="$keyword" '$0 ~ pattern {print $1,$3}' "$filename"
    read -p "Press Enter to continue..."
}

# Function to search business registrations
search_business_registrations() {
    read -p "Enter the URL of the business registrations API: " url
    echo "Searching business registrations..."
    curl "$url"
    read -p "Press Enter to continue..."
}

# Function to search government databases
search_government_databases() {
    read -p "Enter the URL of the government database: " url
    echo "Searching government databases..."
    wget -O temp_file "$url"
    file temp_file
    strings temp_file
    rm temp_file
    read -p "Press Enter to continue..."
}

# Main menu
while true; do
    clear
    echo "----- Public Records Forensics -----"
    echo "1. Search court records"
    echo "2. Search property records"
    echo "3. Search business registrations"
    echo "4. Search government databases"
    echo "0. Exit"

    read -p "Please select an option: " choice

    case $choice in
        1)
            search_court_records
            ;;
        2)
            search_property_records
            ;;
        3)
            search_business_registrations
            ;;
        4)
            search_government_databases
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
