import os

# Start containers (no port mappings to host)
os.system("docker build -t 1 /app/ssh/")
os.system("docker run -d --net honeypot_network --name 1_c -h \"service-1\" --rm 1")
#docker run -d --name "$HONEYPOT1_NAME" -h "$HONEYPOT1_NAME" --rm your-honeypot1-image:latest
#docker run -d --name "$HONEYPOT2_NAME" -h "$HONEYPOT2_NAME" --rm your-honeypot2-image:latest
#docker run -d --name "$HONEYPOT3_NAME" -h "$HONEYPOT3_NAME" --rm your-honeypot3-image:latest

