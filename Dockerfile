# Use an official lightweight NGINX image
FROM nginx:alpine

# Install bash and curl for running the script
RUN apk add --no-cache bash curl

# Set the working directory
WORKDIR /app

# Copy the shell script to the container
COPY test_api_performance.sh /app/test_api_performance.sh

# Make sure the script is executable
RUN chmod +x /app/test_api_performance.sh

# Run the script and keep NGINX running to serve the output
CMD /bin/bash /app/test_api_performance.sh && nginx -g 'daemon off;'
