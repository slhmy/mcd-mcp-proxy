FROM nginx:alpine

# Copy nginx configuration template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Set default allowed origin (can be overridden by environment variable)
ENV ALLOWED_ORIGIN="*"

# Expose port 80
EXPOSE 80

# Start nginx with environment variable substitution
# nginx:alpine already includes envsubst from gettext
CMD ["/bin/sh", "-c", "envsubst '${ALLOWED_ORIGIN}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
