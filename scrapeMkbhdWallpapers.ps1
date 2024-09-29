# URL of the JSON file
$jsonUrl = "https://storage.googleapis.com/panels-api/data/20240916/media-1a-i-p~s"

# Create a directory to store downloaded images and JSON
$downloadDir = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\mkbhdWallpapers"
$assetsDir = Join-Path -Path $downloadDir -ChildPath "assets"
New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null

# Download the JSON file
$jsonPath = Join-Path -Path $downloadDir -ChildPath "panels_data.json"
Invoke-WebRequest -Uri $jsonUrl -OutFile $jsonPath

# Read and parse the JSON file
$jsonContent = Get-Content -Path $jsonPath -Raw
$data = $jsonContent | ConvertFrom-Json

# Function to recursively search for "dhd" in nested objects
function Find-DhdValues($obj) {
    $results = @()
    if ($obj -is [System.Management.Automation.PSCustomObject]) {
        $obj.PSObject.Properties | ForEach-Object {
            if ($_.Name -eq "dhd") {
                $results += $_.Value
            } elseif ($_.Value -is [System.Management.Automation.PSCustomObject] -or $_.Value -is [Array]) {
                $results += Find-DhdValues $_.Value
            }
        }
    } elseif ($obj -is [Array]) {
        $obj | ForEach-Object {
            $results += Find-DhdValues $_
        }
    }
    return $results
}

# Get all "dhd" URLs
$urls = Find-DhdValues $data

foreach ($url in $urls) {
    # Extract the filename from the URL
    $fileName = ($url -split '/')[-1] -replace '\?.*$'

    # Define the local path where the image will be saved
    $localPath = Join-Path -Path $assetsDir -ChildPath $fileName

    try {
        # Download the image
        Invoke-WebRequest -Uri $url -OutFile $localPath -ErrorAction Stop

        Write-Host "Successfully downloaded: $fileName"
    }
    catch {
        Write-Host "Failed to download: $fileName"
        Write-Host "Error: $($_.Exception.Message)"
    }
}

Write-Host "Download process completed. Check the folder: $downloadDir"
Write-Host "JSON file saved as: $jsonPath"