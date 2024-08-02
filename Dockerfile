# FROM ubi9
FROM registry.fedoraproject.org/fedora:40
COPY setup.sh .
RUN ./setup.sh

WORKDIR /CertificateAuthCA
COPY mtls.sh .
COPY nginx.conf /etc/nginx/conf.d/