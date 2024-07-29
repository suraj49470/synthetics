#!/bin/bash

# Capture the output of fetchSLOs.sh
SLOs_names=($(bash ./fetchSLOs.sh))
for file in ../SLOs/*.json; do
    SLOs_names=($(bash ./fetchSLOs.sh))    
    echo "Processing file: $file"
    
    # Extract the SLO name from the JSON file
    SLO_NAME=$(jq -r '.name' "$file")
    
    echo "SLO name: $SLO_NAME"

    # Check if the SLO name exists in the SLOs_names array
    if printf "%s\n" "${SLOs_names[@]}" | grep -qx "$SLO_NAME"; then
        echo "Element '$SLO_NAME' exists in the array. Skipping processing."
        continue
    else
        echo "Element '$SLO_NAME' does not exist in the array. Creation in progress."
        
        # Read file content
        file_content=$(cat "$file")
        
        # Ensure the file content is properly quoted for passing as a parameter
        creatinon_response=$(bash ./createSLO.sh "$file_content")
        
        # Optional: Print the response or handle it
        echo "Creation response: $creatinon_response"
        
    fi
done
