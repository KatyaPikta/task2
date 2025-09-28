FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY index.html .
COPY style.css .
COPY app.js .

COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache gettext
COPY nginx-entrypoint.sh /docker-entrypoint.d/99-envsubst.sh
RUN chmod +x /docker-entrypoint.d/99-envsubst.sh

EXPOSE 80
