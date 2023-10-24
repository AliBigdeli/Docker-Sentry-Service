#!/bin/sh

# Waits for proxy to be available, then gets the first certificate.

set -e

until nc -z sentry-nginx 9000; do
    echo "Waiting for proxy..."
    sleep 5s & wait ${!}
done

echo "Getting certificate..."

certbot certonly \
    --standalone \
    --preferred-challenges http \
    --http-01-port 80 \
    -d "$DOMAIN" \
    --email $EMAIL \
    --force-renewal \
    --rsa-key-size 4096 \
    --agree-tos \
    --noninteractive \
    -v
