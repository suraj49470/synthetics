#!/bin/bash

# Initialize variables
#totalSlos=0
SLOs_names=()

# Fetch SLOs data
SLOs=$(curl -s -X GET https://f86c0f9dcdd143a89d2fe4cb63024121.us-east-2.aws.elastic-cloud.com:9243/s/default/api/observability/slos \
 --user "common_user:Mastek@12" \
 -H "kbn-xsrf: string")

# Print raw SLOs data
#echo "$SLOs"

# Extract and print total SLOs
#totalSlos=$(echo "$SLOs" | jq -r '.total')
#echo "Total SLOs: $totalSlos"

# Extract SLO names and store in the array
SLOs_names=($(echo "$SLOs" | jq -r '.results[].name'))
# echo "SLOs Names: ${SLOs_names[0]}"
# echo "SLOs Names: ${SLOs_names[1]}"
# Print SLO names
echo "${SLOs_names[@]}"
# for name in "${SLOs_names[@]}"; do
#     echo "$name"
# done
