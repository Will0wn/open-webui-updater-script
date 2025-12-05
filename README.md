# Open WebUI - Automatic Update Script

Simple and safe Bash script to update **Open WebUI** (https://openwebui.com) to the latest version while keeping all your data persistent — no need to rewrite the long `docker run` command every time.

Perfect for anyone running Open WebUI with Ollama on a home server (e.g., mini-PC, Raspberry Pi, NAS, etc.).

## Features

- Stops and removes the existing `open-webui` container
- Deletes the old Docker image to free up disk space
- Pulls the latest version of `ghcr.io/open-webui/open-webui:main`
- Restarts the container with the exact same configuration as before
- Preserves all your data (downloaded models, chats, settings) thanks to the `open-webui` Docker volume

## Prerequisites

- Docker installed and running
- An Ollama instance running (in this example at `http://192.168.178.27:11434`)
- Port 3000 free on your server (or change it in the script if needed)

## Usage

1. Save the script with your preferred name, for example:

```bash
curl -o update-openwebui.sh https://raw.githubusercontent.com/your-username/your-repo/main/update-openwebui.sh
