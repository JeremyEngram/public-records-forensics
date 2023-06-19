#!/bin/bash

# User-friendly script for public records forensics

LOG_FILE="public_records.log"

# Function to log messages
log_message() {
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

# Function to search court records
search_court_records() {
    read -p "Enter the keyword to search in court records: " keyword
    read -p "Enter the file name of court records: " filename
    log_message "Searching court records for keyword: $keyword"
    grep "$keyword" "$filename"
    log_message "Search in court records complete."
    read -p "Press Enter to continue..."
}

# Function to search property records
search_property_records() {
    read -p "Enter the keyword to search in property records: " keyword
    read -p "Enter the file name of property records: " filename
    log_message "Searching property records for keyword: $keyword
