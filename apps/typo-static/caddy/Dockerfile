# Use the base image
FROM skiychan/caddy-php:8.1

RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s \
    gd imagick

# Expose the port for Caddy
EXPOSE 80

# Start Caddy server
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
