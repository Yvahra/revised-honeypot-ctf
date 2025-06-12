#!/bin/bash
set -e

# Start Docker daemon
dockerd &

# Wait for Docker daemon to be ready
sleep 10

# Configuration
#SSH_CONTAINER_NAME="realssh"
#HONEYPOT1_NAME="honeypot1"
#HONEYPOT2_NAME="honeypot2"
#HONEYPOT3_NAME="honeypot3"

# Start containers (no port mappings to host)
#docker build -t ssh ssh/
#docker run -d --name "$SSH_CONTAINER_NAME" -h "$SSH_CONTAINER_NAME" --rm ssh
#docker run -d --name "$HONEYPOT1_NAME" -h "$HONEYPOT1_NAME" --rm your-honeypot1-image:latest
#docker run -d --name "$HONEYPOT2_NAME" -h "$HONEYPOT2_NAME" --rm your-honeypot2-image:latest
#docker run -d --name "$HONEYPOT3_NAME" -h "$HONEYPOT3_NAME" --rm your-honeypot3-image:latest

# Start Nginx reverse proxy (or SSH proxy)
#nginx &

# Output connection instructions (important!)
echo "Connect to the following using your browser or SSH (see documentation for details):"
echo "Real SSH: ssh://$SSH_CONTAINER_NAME.192.168.0.10"
#echo "Honeypot 1: ssh://$HONEYPOT1_NAME.your-ctf-domain.com"
#echo "Honeypot 2: ssh://$HONEYPOT2_NAME.your-ctf-domain.com"
#echo "Honeypot 3: ssh://$HONEYPOT3_NAME.your-ctf-domain.com"
echo "Connect via ssh to ssh://<subdomain>.192.168.0.10 -p 8080"
# Keep the container running
tail -f /dev/null
