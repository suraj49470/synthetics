#!/bin/bash

# Check if input content is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 '<json_content>'"
    exit 1
fi

# Read the JSON content from the first argument
json_content="$1"

# Ensure the JSON content is correctly quoted for `curl`
# The `-d` option should be wrapped in double quotes, and JSON content should be properly escaped
response=$(curl -X POST "$ELASTIC_URL/s/default/api/observability/slos" \
    --user "$ELASTIC_USER_NAME:$ELASTIC_USER_PASSWORD" \
    -H "kbn-xsrf: $ELASTIC_XSRF_STRING" \
    -H "Content-Type: application/json" \
    -d "$json_content" 2>&1)  # Capture error messages from `curl`

# Check if `curl` succeeded
if [ $? -ne 0 ]; then
    echo "Curl command failed. Response:"
    echo "$response"
    exit 1
fi

# Output the response from the API
echo "Response from API:"
echo "$response"
