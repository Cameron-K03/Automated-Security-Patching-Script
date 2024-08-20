#!/bin/bash

# Configurable variables
LOG_FILE="/var/log/security_patching.log"
EMAIL="youremail@example.com"

# Function to log messages
log_message() {
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - $1" >> $LOG_FILE
}

# Function to send email
send_email() {
    SUBJECT=$1
    BODY=$2
    echo "$BODY" | mail -s "$SUBJECT" $EMAIL
}

# Start the security patching process
log_message "Security patching started."
if sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y; then
    log_message "Security patching completed successfully."
    send_email "Security Patching Successful" "The security patching process completed successfully."
else
    log_message "Security patching failed."
    send_email "Security Patching Failed" "The security patching process failed. Check the log file for details: $LOG_FILE"
fi
