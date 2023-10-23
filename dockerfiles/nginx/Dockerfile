FROM nginx:alpine

COPY ./dockerfiles/nginx/config/* /etc/nginx/
COPY ./dockerfiles/nginx/entrypoint.sh /entrypoint.sh

USER root

RUN apk add --no-cache openssl bash
RUN chmod +x /entrypoint.sh


CMD ["/entrypoint.sh"]