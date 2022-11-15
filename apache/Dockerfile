# This is a dockerfile for apache server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

FROM httpd:2.4

# Apache default directory
WORKDIR /var/www/html/

# Remove default apache demo files
RUN rm -rf /var/www/html/*

# Copy static files
COPY . .

# Expose web ports (http, https)
EXPOSE 80 443

# Define host process
ENTRYPOINT [ "apache2ctl" ]

# Disable daemonization for apache in container
CMD [ "-D", "“FOREGROUND”" ]
