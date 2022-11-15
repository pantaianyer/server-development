# This is a dockerfile for Go Mux server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

###
### BUILD STAGE
###

FROM golang:apline as build

# Install git for package acquisition
RUN apk update && \
    apk add git

# Copy source (except files in .dockerignore)
WORKDIR /go/src/app
COPY . .

# Install dependencies
RUN go mod download

# Build application
RUN go build -a -v -o server .

###
### DEPLOY STAGE
###

FROM SCRATCH

# Expose server port
EXPOSE 8080

# Server location
WORKDIR /app

# Copy compiled server
COPY --from=build ./server .

# Set entry to server
ENTRYPOINT [ "./server" ]

# Additional parameters
#CMD [ "8080" ]
