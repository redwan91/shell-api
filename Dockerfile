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

# Copy the default NGINX configuration file
COPY default.conf /etc/nginx/conf.d/default.conf

# Run the script and serve the generated output through NGINX
CMD /bin/bash /app/test_api_performance.sh && nginx -g 'daemon off;'
