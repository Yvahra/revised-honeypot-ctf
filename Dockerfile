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

WORKDIR /app

# Copy necessary files
COPY scripts/ /home/ctfuser/scripts/
COPY ssh/ /home/ctfuser/ssh/
COPY nginx/ /etc/nginx/

# Expose the single port
EXPOSE 8080

RUN chmod +x /home/ctfuser/scripts/start.sh

# Entrypoint script
CMD ["/app/scripts/start.sh"]
