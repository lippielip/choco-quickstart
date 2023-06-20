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
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Define the URL of the raw packages.txt file on GitHub
$packagesUrl = 'https://raw.githubusercontent.com/lippielip/choco-quickstart/master/packages.txt'

# Check if script is run with -local argument
if ($local) {
    # Read packages from local file
    $packages = Get-Content -Path .\packages.txt
} else {
    # Download packages.txt and store the list of packages in $packages
    $packages = (Invoke-WebRequest -Uri $packagesUrl).Content.Split([Environment]::NewLine)
}

foreach ($package in $packages) {
    choco install $package -y
}
