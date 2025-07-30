FROM dorowu/ubuntu-desktop-lxde-vnc

USER root
RUN apt-get update && apt-get install -y chromium-browser

EXPOSE 6080
CMD ["/startup.sh"]
