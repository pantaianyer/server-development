# This is a dockerfile for Nginx server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

FROM nginx:alpine

# Nginx default directory
WORKDIR /usr/share/nginx/html

# Remove default nginx demo files
RUN rm -rf ./*

# Copy static files
COPY . .

# Expose web ports (http, https)
EXPOSE 80 443

# Define host process
ENTRYPOINT [ "nginx" ]

# Disable daemonization for container
CMD [ "-g", "daemon off;" ]
