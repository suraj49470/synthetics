#!/bin/bash

# Initialize variables
#totalSlos=0
SLOs_names=()

# Fetch SLOs data
SLOs=$(curl -s -X GET $ELASTIC_URL/s/default/api/observability/slos \
 --user "$ELASTIC_USER_NAME:$ELASTIC_USER_PASSWORD" \
 -H "kbn-xsrf: $ELASTIC_XSRF_STRING")

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
