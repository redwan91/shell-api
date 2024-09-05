# Dockerfile
FROM alpine:latest

# Install curl and bash
RUN apk add --no-cache bash curl

# Set the working directory inside the container
WORKDIR /app

# Copy the Bash script from the scripts/ folder inside your repository into the container
COPY scripts/example.sh /app/example.sh

# Make sure the script is executable
RUN chmod +x /app/test_api_performance.sh

# Run the Bash script when the container starts
CMD ["/bin/bash", "/app/example.sh"]
