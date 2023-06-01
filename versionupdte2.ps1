<#
.SYNOPSIS
This PowerShell script updates a text file with a new version number in a local Git repository, commits the changes, and pushes them back to GitHub.

.DESCRIPTION
The script takes three parameters:
- RepoPath: The path to the local Git repository directory.
- FilePath: The path to the specific file within the repository to be updated.
- NewVersion: The new version number to append to the file.

The script changes the current working directory to the specified RepoPath. It then appends the NewVersion to the file specified by FilePath using the Add-Content cmdlet. The file is staged for commit using the git add command. The changes are committed with a commit message using the git commit command. Finally, the changes are pushed to the remote repository's main branch using the git push command with the origin remote.

.PARAMETER RepoPath
The path to the local Git repository directory.

.PARAMETER FilePath
The path to the specific file within the repository to be updated.

.PARAMETER NewVersion
The new version number to append to the file.
#>
param (
    [string]$RepoPath,
    [string]$FilePath,
    [string]$NewVersion
)

# Rest of the script...


param (
    [string]$RepoPath,
    [string]$FilePath,
    [string]$NewVersion
)

# Change to the repository directory
Set-Location $RepoPath

# Update the text file with the new version number
Add-Content -Path $FilePath -Value $NewVersion

# Stage the file for commit
git add $FilePath

# Commit the changes
git commit -m "Update version number"

# Push the changes to the remote repository
git push origin main
