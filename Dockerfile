FROM ubi9
COPY setup.sh .
RUN ./setup.sh

WORKDIR /CertificateAuthCA
COPY mtls.sh .
COPY nginx.conf /etc/nginx/conf.d/