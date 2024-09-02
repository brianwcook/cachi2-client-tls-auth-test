# FROM ubi9
FROM registry.fedoraproject.org/fedora:40
RUN dnf -y install openssl nginx nano procps-ng
COPY certificates /certificates
COPY setup.sh .
RUN ./setup.sh

#COPY configure-nginx.sh .
#RUN configure-nginx.sh
COPY nginx.conf /etc/nginx/conf.d/
EXPOSE 8443 
ENTRYPOINT /usr/sbin/nginx -g 'daemon off;'


# todo: put the user certificate in the unauthenticated port 8080 dir
