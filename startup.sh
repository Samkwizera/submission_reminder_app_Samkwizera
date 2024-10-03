#!/bin/bash

# Script to start the reminder application

# Define the path to the app and modules
app_script="submission_reminder_app/app/reminder.sh"
functions_module="submission_reminder_app/modules/functions.sh"
config_file="submission_reminder_app/config/config.env"
submissions_file="submission_reminder_app/assets/submissions.txt"

# Function to check if files exist
function check_required_files {
    echo "Checking required files..."
    for file in $app_script $functions_module $config_file $submissions_file; do
        if [ ! -f "$file" ]; then
            echo "Error: Missing required file - $file"
            exit 1
        fi
    done
    echo "All required files are present."
}

# Start the application
function start_application {
    echo "Starting the reminder application..."
    # Source the configuration and functions
    source $config_file
    source $functions_module

    # Execute the reminder script
    bash $app_script
}

# Main execution flow
echo "Initializing the Submission Reminder Application..."
check_required_files
start_application
echo "Reminder application is running."

