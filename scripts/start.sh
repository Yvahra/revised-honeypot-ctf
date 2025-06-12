#!/bin/sh

set -e

# Start Docker daemon
#dockerd &

# Wait for Docker daemon to be ready
#sleep 10

python /app/scripts/start-services.py

# Start Nginx reverse proxy (or SSH proxy)
nginx &

# Output connection instructions (important!)
echo "Connect to the following using your browser or SSH (see documentation for details):"
echo "Connect via ssh to ssh://service-X.192.168.0.10 -p 8080"
# Keep the container running
tail -f /dev/null
