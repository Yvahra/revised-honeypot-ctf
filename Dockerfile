# Use the Docker-in-Docker (DinD) image.
FROM docker:dind

# Set the working directory
WORKDIR /app

# INSTALL PACKAGES
RUN apk add --no-cache git \
    openssh-server \
    net-tools \
    iproute2 \
    iptables \
    #dnsutils \
    python3 \
    #python3-pip \
    nginx && rm -rf /var/lib/apt/lists/*


# Optional: Add a CTF user
RUN adduser -D ctfuser

# Copy necessary files
COPY scripts/ /app/scripts/
COPY ssh/ /app/ssh/
COPY nginx/ /etc/nginx/

# Expose the single port
EXPOSE 8080

RUN mkdir -p /app/scripts/
RUN echo "#!/bin/bash" > /app/scripts/start.sh
RUN echo "set -e" > /app/scripts/start.sh
RUN echo "# Start Docker daemon" > /app/scripts/start.sh
RUN echo "dockerd &" > /app/scripts/start.sh
RUN echo "# Wait for Docker daemon to be ready" > /app/scripts/start.sh
RUN echo "sleep 10" > /app/scripts/start.sh
RUN echo "# Configuration" > /app/scripts/start.sh
RUN echo "# Start Nginx reverse proxy (or SSH proxy)" > /app/scripts/start.sh
RUN echo "nginx &" > /app/scripts/start.sh
RUN echo "# Output connection instructions (important!)" > /app/scripts/start.sh
RUN echo "echo \"Connect to the following using your browser or SSH (see documentation for details):\"" > /app/scripts/start.sh
RUN echo "echo \"Real SSH: ssh://$SSH_CONTAINER_NAME.192.168.0.10\"" > /app/scripts/start.sh
#echo "Honeypot 1: ssh://$HONEYPOT1_NAME.your-ctf-domain.com"
#echo "Honeypot 2: ssh://$HONEYPOT2_NAME.your-ctf-domain.com"
#echo "Honeypot 3: ssh://$HONEYPOT3_NAME.your-ctf-domain.com"
RUN echo "echo \"Connect via ssh to ssh://<subdomain>.192.168.0.10 -p 8080\"" > /app/scripts/start.sh
RUN echo "# Keep the container running" > /app/scripts/start.sh
RUN echo "tail -f /dev/null"
RUN chmod +x /app/scripts/start.sh

# Entrypoint script
CMD ["/app/scripts/start.sh"]
