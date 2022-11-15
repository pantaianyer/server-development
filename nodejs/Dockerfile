# This is a dockerfile for NodeJS server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

FROM node:18

# Expose api port
EXPOSE 8080

# Move source
WORKDIR /app
COPY . .

# Install package manager
#RUN npm install -g pnpm

# Install dependencies
RUN yarn install --frozen-lockfile -only=production
#RUN npm install --frozen-lockfile -only=production
#RUN pnpm install --frozen-lockfile -only=production

# Create user
RUN groupadd --gid 1001 server && \
    useradd --uid 1001 --gid server --shell /bin/bash --create-home server

# Change project ownership to server user
RUN chown -R server:server /app

# Switch user
USER server

# Start app
ENTRYPOINT [ "yarn" ]
#ENTRYPOINT [ "npm run" ]
#ENTRYPOINT [ "pnpm run" ]
#ENTRYPOINT [ "npx pm2-runtime start" ]

# Command
CMD [ "start" ]
