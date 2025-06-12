FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    net-tools \
    iproute2 \
    iptables && rm -rf /var/lib/apt/lists/*

# Add a user for the players (IMPORTANT: Change username/password)
RUN useradd -m ctfuser && \
    echo "ctfuser:password" | chpasswd

# Configure SSH server
RUN mkdir -p /run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config  #Uncomment if commented


# Expose port 22
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
