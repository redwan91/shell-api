#!/bin/bash

# API URL to test
API_URL="https://api.github.com"

# Number of iterations for the test
ITERATIONS=5

# Delay between tests in seconds
DELAY=2

# Function to test the API
test_api_performance() {
  echo "Testing API: $API_URL"

  for ((i=1;i<=ITERATIONS;i++))
  do
    echo "------------------------------"
    echo "Test #$i:"

    # Perform a GET request and extract performance metrics
    curl -o /dev/null -s -w @- "$API_URL" <<'EOF'
      HTTP Status Code:  %{http_code}\n
      Time to connect:   %{time_connect} seconds\n
      Time to start transfer: %{time_starttransfer} seconds\n
      Total time:        %{time_total} seconds\n
      DNS lookup time:   %{time_namelookup} seconds\n
      Size of response:  %{size_download} bytes\n
      Response speed:    %{speed_download} bytes/sec\n
EOF

    # Wait for the specified delay before running the next test
    sleep "$DELAY"
  done

  echo "API performance test completed."
}

# Run the API performance test
test_api_performance

