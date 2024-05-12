#!/bin/bash

# Update package list
sudo apt update

# Install OpenVPN and EasyRSA
sudo apt install -y openvpn easy-rsa

# Set up EasyRSA directory
make-cadir ~/openvpn-ca
cd ~/openvpn-ca

# Configure EasyRSA variables
cat > vars <<EOF
set_var EASYRSA_REQ_COUNTRY    "US"
set_var EASYRSA_REQ_PROVINCE   "California"
set_var EASYRSA_REQ_CITY       "San Francisco"
set_var EASYRSA_REQ_ORG        "OpenVPN"
set_var EASYRSA_REQ_EMAIL      "admin@example.com"
set_var EASYRSA_REQ_OU         "Community"
EOF

# Initialize PKI (Public Key Infrastructure)
./easyrsa init-pki
./easyrsa build-ca nopass

# Generate server keypair and certificate
./easyrsa gen-req server nopass
./easyrsa sign-req server server

# Generate Diffie-Hellman parameters
./easyrsa gen-dh

# Generate HMAC signature
openvpn --genkey --secret pki/ta.key

# Move keys and certificates to OpenVPN directory
sudo cp pki/ca.crt pki/private/server.key pki/issued/server.crt pki/dh.pem pki/ta.key /etc/openvpn

# Copy sample server configuration file
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz | sudo tee /etc/openvpn/server.conf

# Enable IP forwarding
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo sysctl -p

# Configure firewall rules to allow OpenVPN traffic (UDP and TCP)
sudo ufw allow 1194/udp
sudo ufw allow OpenSSH
sudo ufw disable
#sudo ufw enable

# Start OpenVPN service
sudo systemctl start openvpn@server
sudo systemctl enable openvpn@server

# Install and configure OpenVPN WebUI (OpenVPN-Admin)
sudo apt install -y apache2 php php-mysql php-pear libapache2-mod-php php-mbstring php-gettext
sudo apt install -y openvpn-auth-ldap
sudo systemctl restart apache2

sudo mkdir /var/www/openvpn
sudo git clone https://github.com/Adreax/OpenVPN-Admin.git /var/www/openvpn
sudo cp /var/www/openvpn/config.php.example /var/www/openvpn/config.php

# Update OpenVPN-Admin configuration
sudo sed -i "s/define('CONFIG_DB_NAME', 'admin');/define('CONFIG_DB_NAME', 'rhsalisu');/" /var/www/openvpn/config.php
sudo sed -i "s/define('CONFIG_DB_USER', 'root');/define('CONFIG_DB_USER', 'rhsalisu');/" /var/www/openvpn/config.php
sudo sed -i "s/define('CONFIG_DB_PASS', 'admin');/define('CONFIG_DB_PASS', 'Rabiu2004@');/" /var/www/openvpn/config.php

echo "OpenVPN server installation and configuration completed."
