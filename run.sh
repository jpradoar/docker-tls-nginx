#!/bin/bash

# get inputs
DOMAIN=$1
EMAIL=$2

# # copy as a templates 
# cp -rp nginx/config/nginx.conf nginx/config/nginx.conf_template
# cp -rp nginx/config/enabler.conf nginx/config/enabler.conf_template
# cp -rp docker-compose.yaml docker-compose.yaml_template

# replace vars
sed -i 's/%%DOMAIN%%/'$DOMAIN'/g' ./nginx/config/nginx.conf ./docker-compose.yaml
sed -i 's/%%EMAIL%%/'$EMAIL'/g' ./docker-compose.yaml

# run nginx without https (only HTTP) to validate with certbot
docker-compose -f ./docker-compose-enabler.yaml up -d 
docker-compose -f ./docker-compose.yaml up certbot
sleep 5
# down http cerbot enabler
docker-compose -f ./docker-compose-enabler.yaml down # Wait for let's encrypt validation and close containers
sleep 2
# run nignx with TLS (https) and certbot
docker-compose -f ./docker-compose.yaml up -d 
# See you leter
echo;echo "Done!"
echo "Happy TLS"