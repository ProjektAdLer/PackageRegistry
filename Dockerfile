FROM nginx:alpine

RUN apk add --no-cache apache2-utils

COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/packages

# Change ownership of /var/packages to nginx user
RUN chown -R nginx:nginx /var/packages

# Create .htpasswd from environment variables
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/var/packages"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
