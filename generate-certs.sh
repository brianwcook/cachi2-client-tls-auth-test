#~/bin/bash
mkdir -p certificates
cd certificates
rm *


# todo - extend lifespan of all certs to 10 years

# generate CA cert
openssl genrsa   -out myCA.key 4096
openssl req -new -x509 -key myCA.key -out myCA.crt \
  -subj "/C=US/ST=NC/L=Raleigh/O=ca/OU=IntegrationTest/CN=mtls-client/emailAddress=dev@www.example.com"


# generate client key, certificate signing request and certificate
openssl genrsa -out testuser.key 4096
openssl \
  req \
  -new \
  -key testuser.key \
  -out testuser.csr \
  -subj "/C=US/ST=NC/L=Raleigh/O=client/OU=IntegrationTest/CN=mtls-client/emailAddress=dev@www.example.com"
openssl x509 -req -in testuser.csr -CA myCA.crt -CAkey myCA.key -set_serial 01 -out testuser.crt


# generate an SSL cert for ngingx
openssl genrsa -out ./localhost.key 4096
openssl \
  req \
  -new \
  -sha256\
  -key ./localhost.key \
  -out ./localhost.csr \
  -subj "/C=US/ST=NC/L=Raleigh/O=server/OU=IntegrationTest/CN=localhost/emailAddress=localhost@www.example.com" 
openssl x509 -req -in localhost.csr -CA myCA.crt -CAkey myCA.key -set_serial 01 -out localhost.crt

cd ..
