#!/bin/bash
chown $myuser:nginx /certificates
chmod 770 /certificates

# put certs in place
mkdir "/etc/pki/nginx"
chown -R nginx:nginx "/etc/pki/nginx"
chmod 700 "/etc/pki/nginx"

cp /certificates/localhost.crt "/etc/pki/nginx/server.crt"
cp /certificates/localhost.key "/etc/pki/nginx/server.key"
cp /certificates/myCA.crt "/etc/pki/myCA.crt"

# start nginx
# nginx
