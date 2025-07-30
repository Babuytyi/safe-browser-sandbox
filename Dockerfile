FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

# Remove any Google Chrome repo
RUN rm -f /etc/apt/sources.list.d/google-chrome.list || true

# Install Chromium
RUN apt-get update && apt-get install -y \
    chromium-browser \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Tell Railway to use 6080
ENV PORT=6080
EXPOSE 6080

CMD ["/startup.sh"]
