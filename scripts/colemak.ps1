

# Set your URL, zip file name, and executable name
$url = "https://colemak.com/pub/windows/Colemak-1.1-Caps-Lock-Unchanged.zip"
$zipFileName = "colemak.zip"
$executableName = "Colemak2_amd64.msi"

## Set the path where you want to save the downloaded file
#$downloadPath = "C:\Path\To\Download"

# Set the path where you want to extract the contents
$extractPath = [System.IO.Path]::Combine($env:TEMP, "Extract")
$downloadPath = [System.IO.Path]::Combine($env:TEMP, "Download")

# Create the download and extract directories if they don't exist
New-Item -ItemType Directory -Force -Path $downloadPath
New-Item -ItemType Directory -Force -Path $extractPath

# Download the zip file
Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile "$downloadPath\$zipFileName"

# Extract the contents of the zip file
Write-Host "Extracting files..."
Expand-Archive -Path "$downloadPath\$zipFileName" -DestinationPath $extractPath -Force
#
## Change into the extracted directory
#Set-Location -Path $extractPath

# Execute the named .exe package
Write-Host "Executing $executableName..."
Start-Process -FilePath "$extractPath\$executableName" -Wait -ArgumentList "/quiet"
