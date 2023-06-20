# This script will first check if Chocolatey is installed on your system.
# If it is not installed, it will download and install it.
# After that, it will download packages.txt from GitHub and install the packages you specify,
# unless it is run with the -local argument, in which case it will read packages.txt from the local file system.

param (
    [switch]$local = $false
)

Set-ExecutionPolicy Bypass -Scope Process -Force; 

# Check if Choco is installed
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    # Install Chocolatey
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Define the URL of the raw packages.txt file on GitHub
$packagesUrl = 'https://raw.githubusercontent.com/lippielip/choco-quickstart/master/packages.txt'

# Check if script is run with -local argument
if ($local) {
    # Read packages from local file, excluding comment lines and empty lines
    $packages = Get-Content -Path .\packages.txt | Where-Object { $_ -notmatch '^\s*#' -and $_.Trim() -ne "" }
}
else {
    # Try to download packages.txt
    try {
        # Download packages.txt, convert to UTF8, remove BOM if present, split lines, and store the list of packages in $packages, excluding comment lines and empty lines
        $rawPackages = Invoke-WebRequest -Uri $packagesUrl
        $utf8PackagesContent = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes($rawPackages.Content))
        $bomFreePackagesContent = $utf8PackagesContent.TrimStart([System.Text.Encoding]::UTF8.GetPreamble())
        $packages = $bomFreePackagesContent.Split([Environment]::NewLine) | Where-Object { $_ -notmatch '^\s*#' -and $_.Trim() -ne "" }
    }
    catch {
        Write-Host "Error: Failed to download packages.txt from $packagesUrl. If you're trying to install packages from a local file, run this script with the -local flag."
        exit 1
    }
}

foreach ($package in $packages) {
    choco install $package -y
}
