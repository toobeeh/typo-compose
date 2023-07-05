# Use the base image
FROM skiychan/caddy-php:8.1

# Install ImageMagick for PHP
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Copy your PHP application files to the container
COPY . /var/www/html

# Expose the port for Caddy
EXPOSE 80

# Start Caddy server
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
