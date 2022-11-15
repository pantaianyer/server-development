# This is a dockerfile for Angular server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

###
### BUILD STAGE
###

FROM node:16 as build

# Create app workdir
WORKDIR /app

# Copy project
COPY . .

# Install dependencies
RUN yarn install --frozen-lockfile
#RUN npm install --frozen-lockfile

# Build project
RUN npx ng build

###
### DEPLOY STAGE
###

FROM nginx:alpine as deploy

# Project name (as defined in your angular.json outputPath)
ENV PROJECT_NAME angular-project

# Nginx default serve directory
WORKDIR /usr/share/nginx/html

# Clean default nginx demo files
RUN rm -rf ./*

# Copy deployment from build stage
COPY --from=build /app/dist/${PROJECT_NAME} .

# Expose web ports (http, https)
EXPOSE 80 443

# Define host process
ENTRYPOINT [ "nginx" ]

# Disable daemonization
CMD [ "-g", "daemon off;" ]
