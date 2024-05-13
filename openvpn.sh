#!/bin/bash

# Update package lists
sudo apt update

# Install required packages
sudo apt install -y bridge-utils dmidecode iptables iproute2 libc6 libffi7 libgcc-s1 liblz4-1 liblzo2-2 libmariadb3 libpcap0.8 libssl3 libstdc++6 libsasl2-2 libsqlite3-0 net-tools python3-pkg-resources python3-migrate python3-sqlalchemy python3-mysqldb python3-ldap3 sqlite3 zlib1g python3-netaddr python3-arrow python3-lxml python3-constantly python3-hyperlink python3-automat python3-service-identity python3-cffi python3-defusedxml libcap-ng0 libnl-3-200 libnl-genl-3-200 python3-typing-extensions

# Install OpenVPN
sudo dpkg -i openvpn-as-bundled-clients-30.deb openvpn-as_2.13.1-d8cdeb9c-Ubuntu22_amd64.deb | tee installation.log

# Fetch Admin and Client UI URLs from the terminal output
admin_ui=$(tail -n 5 installation.log | grep "Admin UI:" | awk '{print $NF}')
client_ui=$(tail -n 5 installation.log | grep "Client UI:" | awk '{print $NF}')
username=$(tail -n 5 installation.log | grep "Login as" | awk '{print $NF}')
password=$(tail -n 5 installation.log | grep "Login as" | awk '{print $(NF-1)}')

# Display Admin and Client UI URLs along with login credentials
echo "Admin UI: $admin_ui"
echo "Client UI: $client_ui"
echo "Login as '$username' with '$password' to continue"
