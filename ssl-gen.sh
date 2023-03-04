#!/bin/bash

# Prompt user for domain name
read -p "Enter the domain name for which the SSL certificate will be generated: " domain_name
mkdir -p keys
# Generate private key and self-signed certificate
openssl req -newkey rsa:2048 -nodes -keyout "keys/${domain_name}.key" \
    -x509 -days 365 -out "keys/${domain_name}.pem" \
    -subj "/CN=${domain_name}"

# Print success message
echo "Self-signed SSL certificate generated for ${domain_name}!"
