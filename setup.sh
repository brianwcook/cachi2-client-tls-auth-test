#!/bin/bash
dnf -y install openssl nginx nano procps-ng && \
cd /
mkdir CertificateAuthCA
chown $myuser:nginx /CertificateAuthCA
chmod 770 /CertificateAuthCA
cd /CertificateAuthCA

