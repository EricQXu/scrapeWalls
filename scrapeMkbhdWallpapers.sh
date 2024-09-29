#!/usr/bin/bash

# URL of the JSON file
jsonUrl="https://storage.googleapis.com/panels-api/data/20240916/media-1a-i-p~s"

# Create a directory to store downloaded images and JSON
downloadDir="$HOME/Downloads/mkbhdWallpapers"
assetsDir="$downloadDir/assets"
mkdir -p "$assetsDir"

# Download the JSON file
jsonPath="$downloadDir/panels_data.json"
if ! curl -s -o "$jsonPath" "$jsonUrl"; then
    echo "Failed to download JSON file"
    exit 1
fi

# Extract all "dhd" URLs using jq
urls=$(jq -r '.. | objects | .dhd? | select(. != null)' "$jsonPath")

# Download images
while IFS= read -r url; do
    fileName=$(basename "$url" | sed 's/?.*//')
    localPath="$assetsDir/$fileName"

    if curl -s -o "$localPath" "$url"; then
        echo "Successfully downloaded: $fileName"
    else
        echo "Failed to download: $fileName"
    fi
done <<< "$urls"

echo "Download process completed. Check the folder: $downloadDir"
echo "JSON file saved as: $jsonPath"
