# Use a base image compatible with ARM (e.g., OpenJDK 8 for ARM on Alpine)
FROM arm32v7/openjdk:8-jdk-alpine

# Set the working directory
WORKDIR /home/container

# Install required packages using apk
RUN apk update \
    && apk add --no-cache lsof curl ca-certificates openssl git tar sqlite fontconfig libstdc++ tzdata iproute2 \
    && adduser -D -h /home/container container

# Switch to the non-root user
USER container

# Set environment variables
ENV USER=container HOME=/home/container

# Set the working directory
WORKDIR /home/container

# Copy the entrypoint script into the container
COPY ./entrypoint.sh /entrypoint.sh

# Give execution permissions to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
