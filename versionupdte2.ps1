<#
.SYNOPSIS
Appends the released version number to the file, stages it for commit, and pushes the changes to a specified branch in a Git repository.

.DESCRIPTION
Appends the released version number to the file, stages it for commit, and pushes the changes to a specified branch in a Git repository.

.PARAMETER RepoPath
The path to the repository directory.

.PARAMETER FilePath
The path to the file to which the released version number needs to be appended.

.PARAMETER NewVersion
The new version number to be added to the file.

.PARAMETER Branch
(Optional) The name of the branch to push the changes to. If not specified, it defaults to "main".

.EXAMPLE
.\Update-Version.ps1 -RepoPath "C:\path\to\repository" -FilePath "version.txt" -NewVersion "1.2.3"

This example updates the "version.txt" file in the specified repository directory with the new version number "1.2.3". It pushes the changes to the "main" branch in the remote repository.

.EXAMPLE
.\Update-Version.ps1 -RepoPath "C:\path\to\repository" -FilePath "version.txt" -NewVersion "1.2.3" -Branch "develop"

This example updates the "version.txt" file in the specified repository directory with the new version number "1.2.3". It pushes the changes to the "develop" branch in the remote repository.

#>

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
