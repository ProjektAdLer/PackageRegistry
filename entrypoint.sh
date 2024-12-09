#!/bin/sh

# Generate .htpasswd using environment variables
if [ -n "$UPLOAD_USER" ] && [ -n "$UPLOAD_PASS" ]; then
    htpasswd -bc /etc/nginx/.htpasswd "$UPLOAD_USER" "$UPLOAD_PASS"
else
    echo "Error: UPLOAD_USER and UPLOAD_PASS environment variables are required."
    exit 1
fi

exec "$@"
