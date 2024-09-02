Running the nginx container
podman run -p 8443:8443 -p 8080:8080 quay.io/bcook/cachi2-nginx

CHeck that it is running
curl http://localhost:8080

Check that tls client auth is working
curl --insecure https://localhost:8443

You should receive:
400 No required SSL certificate was sent

Send all the right certs:
curl \
  --cacert certificates/myCA.crt \
  --key certificates/testuser.key \
  --cert certificates/testuser.crt \
  https://localhost:8443