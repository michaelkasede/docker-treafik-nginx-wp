#!/bin/bash

# Prompt user for domain name
read -p "Enter the domain name for which the SSL certificate will be generated: " domain
mkdir -p certs
# Generate private key and self-signed certificate
openssl req -newkey rsa:2048 -nodes -keyout "certs/${domain}.key" \
    -x509 -days 365 -out "certs/${domain}.pem" \
    -subj "/CN=${domain}"

# Print success message
echo "Self-signed SSL certificate generated for ${domain}!"
