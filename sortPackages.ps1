<#
.SYNOPSIS
This script sorts a text file line by line within each category.

.DESCRIPTION
A category is defined by a comment line starting with "#". 
The script ignores empty lines and does not add an empty line at the start of each category.
An empty line is added at the end of each category.

.PARAMETER filename
The name (or path) of the file you want to sort.
If not specified, the script defaults to "packages.txt".

.EXAMPLE
.\SortPackages.ps1 "my_file.txt"
#>

function Sort-File {
    param (
        [Parameter(Position=0)]
        [string]$filename = "packages.txt"
    )

    # Read the file into an array of lines
    $lines = Get-Content $filename

    # Initialize an array to hold the sorted lines
    $sortedLines = @()

    # Initialize an array to hold the lines of the current category
    $categoryLines = @()

    foreach ($line in $lines) {
        $stripped = $line.Trim()

        # Ignore empty lines
        if (-not $stripped) {
            continue
        }

        if ($stripped.StartsWith("#")) {
            # If we encounter a new category and there are items in categoryLines, sort them and add to sortedLines
            if ($categoryLines.Count -gt 0) {
                $sortedLines += $categoryLines | Sort-Object
                $sortedLines += ""  # Add an empty line after each category
                $categoryLines = @()
            }

            $sortedLines += $stripped
        }
        else {
            $categoryLines += $stripped
        }
    }

    # Sort and add the last category
    if ($categoryLines.Count -gt 0) {
        $sortedLines += $categoryLines | Sort-Object
    }

    # Write the sorted lines back to the file
    $sortedLines | Out-File -FilePath $filename
}

# Get the filename from command-line arguments and pass it to the function
Sort-File -filename $args[0]
