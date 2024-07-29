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
response=$(curl -X POST "https://f86c0f9dcdd143a89d2fe4cb63024121.us-east-2.aws.elastic-cloud.com:9243/s/default/api/observability/slos" \
    --user "common_user:Mastek@12" \
    -H "kbn-xsrf: Mastek@12" \
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
