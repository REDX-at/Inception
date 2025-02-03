FROM debian:11

# Install NGINX and OpenSSL
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Company/OU=Org/CN=localhost"

# Copy NGINX configuration
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
