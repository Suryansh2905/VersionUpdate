param (
    [string]$RepoPath,
    [string]$FilePath,
    [string]$NewVersion,
    [string]$Branch = "main" # Default branch is set to "main"
)

# Change to the repository directory
Set-Location $RepoPath

Add-Content -Path $FilePath -Value $NewVersion

git add $FilePath

git commit -m "Appended version number"

git push origin $Branch # Push to the specified branch

