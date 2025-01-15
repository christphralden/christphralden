#!/usr/bin/env bash

for zip_file in *.zip; do
    if [[ -f "$zip_file" ]]; then
        base_name="${zip_file%.zip}"
        
        unzip -q "$zip_file" -d "$base_name"
        
        mv "$base_name" "${base_name}_unzipped"
        
        echo "Unzipped ${base_name}"
    else
        echo "No zip files found in the current directory."
        break
    fi
done
