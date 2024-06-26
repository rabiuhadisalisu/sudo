#!/bin/bash

# Step 1: Download Localtonet
echo "Downloading Localtonet..."
wget https://localtonet.com/download/localtonet-linux-x64.zip

# Step 2: Extract the downloaded file
echo "Extracting Localtonet..."
sudo unzip localtonet-linux-x64.zip -d /usr/local/bin

# Step 4: Set up Localtonet with authentication token
echo "Setting up Localtonet with authentication token..."
nohup sudo localtonet authtoken AzqKXOBuEPJGhadsN2vF9HjfDikntxUWL &> localtonet.out.txt &
nohup sudo localtonet app &> gaster.out.txt
cat localtonet.out.txt
cat gaster.out.txt

echo "Localtonet setup completed."
