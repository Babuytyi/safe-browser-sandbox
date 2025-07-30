FROM dorowu/ubuntu-desktop-lxde-vnc

USER root

# Update packages and install Chromium dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-common \
    chromium-driver \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6080
CMD ["/startup.sh"]
