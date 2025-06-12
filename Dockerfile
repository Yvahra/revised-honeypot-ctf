FROM docker:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    net-tools \
    iproute2 \
    iptables \
    dnsutils \
    python3 \
    python3-pip \
    nginx && rm -rf /var/lib/apt/lists/*

# Optional: Add a CTF user
RUN useradd -m ctfuser
USER ctfuser
WORKDIR /home/ctfuser

# Copy necessary files
COPY scripts/ /home/ctfuser/scripts/
COPY honeypots/ /home/ctfuser/honeypots/
COPY nginx/ /etc/nginx/

# Expose the single port
EXPOSE 8080

# Entrypoint script
ENTRYPOINT ["/home/ctfuser/scripts/entrypoint.sh"]
