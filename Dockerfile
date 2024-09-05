# Use an official lightweight Alpine Linux image as the base
FROM alpine:latest

# Install curl and bash
RUN apk add --no-cache bash curl

# Set the working directory inside the container
WORKDIR /app

# Copy the Bash script from your local repository into the container
COPY test_api_performance.sh /app/test_api_performance.sh

# Make sure the script is executable
RUN chmod +x /app/test_api_performance.sh

# Run the Bash script when the container starts
CMD ["/bin/bash", "/app/test_api_performance.sh"]