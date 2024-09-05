#!/bin/bash

# API URL to test
API_URL="https://api.github.com"

# Number of iterations for the test
ITERATIONS=10

# Delay between tests in seconds
DELAY=2

# Function to test the API
test_api() {
  echo "Testing API: $API_URL"
  
  for ((i=1;i<=ITERATIONS;i++))
  do
    # Perform a GET request to the API and store the HTTP response code
    HTTP_RESPONSE=$(curl --write-out "%{http_code}" --silent --output /dev/null "$API_URL")
    
    # Check if the response code is 200 (OK)
    if [ "$HTTP_RESPONSE" -eq 200 ]; then
      echo "[$i/$ITERATIONS] API is reachable. Status code: 200"
    else
      echo "[$i/$ITERATIONS] API is unreachable. Status code: $HTTP_RESPONSE"
    fi

    # Wait for the specified delay before running the next test
    sleep "$DELAY"
  done

  echo "API test completed."
}

# Run the API test
test_api
