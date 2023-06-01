param (
    [string]$RootPath,
    [string]$VersionNumber,
    [string]$BranchName,
    [string]$RemoteName
)

# Change to the root directory
Set-Location $RootPath

# Find all version.txt files recursively
$versionFiles = Get-ChildItem -Path $RootPath -Filter "version.txt" -File -Recurse

# Iterate over each version.txt file
foreach ($file in $versionFiles) {
    # Append the version number to the file
    $fileContent = Get-Content $file.FullName
    $fileContent += $VersionNumber
    $fileContent | Set-Content $file.FullName

    # Stage the file for commit
    git add $file.FullName
}

# Commit the changes
git commit -m "Update version numbers"

# Push the changes to the remote repository
git push $RemoteName $BranchName
