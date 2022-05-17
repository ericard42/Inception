#Definir Alpine comme image de base
FROM alpine:3.14

RUN apk update && apk upgrade
RUN apk add nginx

CMD nginx -g 'daemon off;'
