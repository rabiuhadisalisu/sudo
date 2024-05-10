FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    tar \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Check out repository
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/rabytebuild/sudo.git /app

# Set up user
COPY user.sh /app/user.sh
RUN chmod +x /app/user.sh

# Update and upgrade packages
COPY update.sh /app/update.sh
RUN chmod +x /app/update.sh

# Install Desktop GNOME
COPY desktop.sh /app/desktop.sh
RUN chmod +x /app/desktop.sh

# Install XRDP
COPY xrdp.sh /app/xrdp.sh
RUN chmod +x /app/xrdp.sh

# Configure Ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz && \
    mv ngrok /usr/local/bin/ngrok && \
    rm ngrok-v3-stable-linux-amd64.tgz
COPY ngrok-authtoken.sh /app/ngrok-authtoken.sh
RUN chmod +x /app/ngrok-authtoken.sh && \
    /app/ngrok-authtoken.sh 2Hd7yeF4INCKbg2aP9rGMLnDqBX_5K7WhATjW8eUxS6UoHSRa && \
    ngrok tcp 3389 & \
    ngrok tcp 22 &

WORKDIR /app
CMD ["sleep", "86400"]
