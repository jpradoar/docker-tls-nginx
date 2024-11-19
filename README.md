# NGINX + Certbot + Let's Encrypt (docker-tls-nginx)



### Short description
Certbot and letsencrypt require a first validation over http (port 80). If you run an nginx configured with https and http auto-redirect to 443 letsencrypt can't validate your environment.
<br>For this reason I created this simple docker-compose and script that deploy a docker compose with a step procedure to start, validate and deploy full TLS website.
<br>By the way, the nginx.conf has a lot configuration to use nginx (and your web server) with some best practices.
<br>Feel free to configure as you need ...and, obviously, send me a PR  ;) <br>



### prerequisites: 
 - a server with public ip
 - a dns associated to that IP address


### How to run:
    sh run.sh <DOMAIN> <EMAIL>

### Example: 
    sh run.sh superduperdemo.com  jtan@mydomain.com


