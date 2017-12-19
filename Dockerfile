FROM ansi/mosquitto
USER root

RUN mkdir -p /etc/letsencrypt/live/cert && \
    mkdir -p /etc/letsencrypt/archive
RUN mv /etc/mosquitto/mosquitto.conf.example /etc/mosquitto/mosquitto.conf
RUN sed -i 's%^#certfile$%certfile /etc/letsencrypt/live/cert/fullchain.pem%' /etc/mosquitto/mosquitto.conf && \
    sed -i 's%^#keyfile$%keyfile /etc/letsencrypt/live/cert/privkey.pem%' /etc/mosquitto/mosquitto.conf && \
    sed -i 's%^#listener$%listener 8883%' /etc/mosquitto/mosquitto.conf && \
    sed -i 's%^#capath$%capath /etc/ssl/certs/%' /etc/mosquitto/mosquitto.conf


EXPOSE 8883
CMD ["/usr/local/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
