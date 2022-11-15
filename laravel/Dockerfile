# This is a dockergile for Laravel server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

FROM bitnami/laravel:9.1.8

# Expose default port of laravel server
EXPOSE 8000

# Copy source (except .dockerignore matches)
WORKDIR /app
COPY . .

# Install dependencies with composer
RUN composer install --no-interaction

# Generate new application key
RUN php artisan key:generate

# Build front-end packages
RUN npm install && \
    npm run prod

# Run migration and seeder?
#php artisan migrate:fresh
#php artisan db:seed

# Entry application
ENTRYPOINT [ "php", "artisan" ]

# Start command
CMD [ "serve" ]
