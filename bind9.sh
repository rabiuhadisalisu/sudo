#!/bin/bash

# Install BIND9
echo "Installing BIND9..."
apt-get update
apt-get install -y bind9

# Configure BIND9
echo "Configuring BIND9..."
cat <<EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable 
    // nameservers, you probably want to use them as forwarders.  
    // Uncomment the following block, and insert the addresses replacing 
    // the all-0's placeholder.

    // forwarders {
    //      8.8.8.8;
            8.8.4.4;
            ns1.afrinic.net;
            dns-admin.afrinic.net;
            dns-admin.mtnbusiness.co.za;
            ns0.iafrica.com;
            ns-931.awsdns-52.net;
            awsdns-hostmaster.amazon.com;
            1.1.1.1;
            1.0.0.1;
    // };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    dnssec-validation auto;

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};
EOF

# Restart BIND9
echo "Restarting BIND9..."
systemctl restart bind9

echo "BIND9 installation and configuration completed."
