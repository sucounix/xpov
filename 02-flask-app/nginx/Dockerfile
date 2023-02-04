FROM nginx:alpine
RUN apk update && apk add bash


COPY nginx.conf /etc/nginx/nginx.conf

# Forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

STOPSIGNAL SIGTERM
HEALTHCHECK CMD curl --fail http://localhost:80/health || exit 1

CMD ["nginx", "-g", "daemon off;"]