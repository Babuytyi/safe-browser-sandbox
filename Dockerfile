FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

# Remove any Google Chrome repo
RUN rm -f /etc/apt/sources.list.d/google-chrome.list || true

# Install Chromium
RUN apt-get update && apt-get install -y \
    chromium-browser \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Railway port for noVNC
ENV PORT=6080

# Tell noVNC to bind to Railway's $PORT
CMD websockify --web=/usr/share/novnc/ $PORT localhost:5900 & /startup.sh
