# Use the Docker-in-Docker (DinD) image.
FROM docker:dind

# Set the working directory
WORKDIR /home/ctfuser

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
#RUN chown ${USER}:${USER} ${JAIL_DIR}

# Copy necessary files
COPY . .
COPY nginx/ /etc/nginx/

# Expose the single port
EXPOSE 8080

RUN chmod +x /home/ctfuser/scripts/start.sh
# Entrypoint script

#USER ctfuser
CMD ["ls -al /home/ctfuser/"] #/home/ctfuser/scripts/start.sh"]
