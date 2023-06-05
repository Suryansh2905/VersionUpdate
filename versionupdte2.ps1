param (
    [string]$RepoPath,
    [string]$FilePath,
    [string]$NewVersion,
    [string]$Branch = $null
)

if ($Branch -eq $null) {
    $Branch = "main"
}

# Change to the repository directory
Set-Location $RepoPath

# Update the text file with the new version number
Add-Content -Path $FilePath -Value $NewVersion

# Stage the file for commit
git add $FilePath

# Commit the changes
git commit -m "Update version number"

# Push the changes to the remote repository
git push origin HEAD:$Branch
