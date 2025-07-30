FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

# Remove any Google Chrome repository to avoid signature issues
RUN rm -f /etc/apt/sources.list.d/google-chrome.list || true

# Update packages and install Chromium safely
RUN apt-get update && apt-get install -y \
    chromium-browser \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6080
CMD ["/startup.sh"]
