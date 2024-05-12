#!/bin/bash

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Installing npm..."
    sudo apt update
    sudo apt install -y npm
fi

# Install localtunnel globally using npm without any prompts
npm install -g localtunnel --quiet --no-progress

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "localtunnel installed successfully."
else
    echo "Error: Failed to install localtunnel."
fi
