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
#RUN groupadd ${SSH_USER}
USER ctfuser
#RUN chown ${USER}:${USER} ${JAIL_DIR}
WORKDIR /home/ctfuser

# Copy necessary files
COPY scripts/ /home/ctfuser/scripts/
COPY honeypots/ /home/ctfuser/honeypots/
COPY nginx/ /etc/nginx/

# Expose the single port
EXPOSE 8080

# Entrypoint script
ENTRYPOINT ["/home/ctfuser/scripts/entrypoint.sh"]
