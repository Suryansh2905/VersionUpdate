param (
    [string]$RepoPath,
    [string]$FilePath,
    [version]$NewVersion,
    [string]$Branch = "main" # Default branch is set to "main"
)

# Change to the repository directory
Set-Location $RepoPath

# Check if the file path exists
if (-not (Test-Path $FilePath -PathType Leaf)) {
    Write-Error "Invalid file path: $FilePath"
    return
}

Add-Content -Path $FilePath -Value $NewVersion

git add $FilePath

git commit -m "Appended version number"

# Switch to the main branch
git checkout $Branch

# Push changes to main
git push origin $Branch
