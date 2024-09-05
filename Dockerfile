# Use an official lightweight Alpine Linux image as the base
FROM alpine:latest

# Install bash and curl
RUN apk add --no-cache bash curl

# Set the working directory inside the container
WORKDIR /app

# Copy the Bash script from your local repository into the container
COPY scripts/test_api_performance.sh /app/test_api_performance.sh

# Make sure the script is executable
RUN chmod +x /app/test_api_performance.sh

# Specify that the bash shell should be used to run the script
CMD ["bash", "/app/test_api_performance.sh"]
