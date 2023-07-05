# Use the base image
FROM skiychan/caddy-php:8.1

RUN apk update && apk upgrade \
    && apk add --no-cache imagemagick imagemagick-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Expose the port for Caddy
EXPOSE 80

# Start Caddy server
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
