docker run -p 8883:8883 -v /etc/letsencrypt/live/${YOUR_DOMAIN}/:/etc/letsencrypt/live/cert/ -v /etc/letsencrypt/archive/:/etc/letsencrypt/archive/:ro mosquitto-letsencrypt:latest
