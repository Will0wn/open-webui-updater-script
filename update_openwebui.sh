#!/bin/bash

# Simple and safe script to automatically update Open WebUI
echo "=== Updating Open WebUI ==="

# Show currently running containers
echo -e "\nExisting containers:"
docker ps -a

# Stop and remove the Open WebUI container
echo -e "\nStopping and removing the Open WebUI container..."
docker stop open-webui 2>/dev/null || true
docker rm open-webui 2>/dev/null || true

# Show existing Docker images
echo -e "\nExisting Docker images:"
docker images

# Remove the old Open WebUI image (if present)
echo -e "\nRemoving the old Open WebUI image..."
WEBUI_IMAGE_ID=$(docker images -q ghcr.io/open-webui/open-webui:main)
if [ -n "$WEBUI_IMAGE_ID" ]; then
    docker rmi "$WEBUI_IMAGE_ID"
else
    echo "No existing Open WebUI image found."
fi

# Verify that the old image has been removed
echo -e "\nVerifying remaining images:"
docker images

# Pull the new image
echo -e "\nPulling the new Open WebUI image..."
docker pull ghcr.io/open-webui/open-webui:main

# Start the new container
echo -e "\nStarting the new Open WebUI container..."
docker run -d -p 3000:8080 \
  -e OLLAMA_BASE_URL=http://192.168.178.27:11434 \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

# Final message
echo -e "\n=== Update completed successfully ==="
echo "Open WebUI is now running on port 3000"
echo "Access it in your browser at: http://YOUR_SERVER_IP:3000"