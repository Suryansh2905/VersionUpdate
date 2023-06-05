param (
    [string]$RepoPath,
    [string]$FilePath,
    [string]$NewVersion
)

# Change to the repository directory
Set-Location $RepoPath

Add-Content -Path $FilePath -Value $NewVersion

git add $FilePath

git commit -m "Appended version number"

git push origin main
