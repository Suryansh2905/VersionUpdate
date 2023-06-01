# Function to recursively locate all "version.txt" files under the given path
function Get-VersionFiles($path) {
    Get-ChildItem -Path $path -Filter "version.txt" -File -Recurse
}

# Function to append version number to a file
function Append-Version($filePath, $versionNumber) {
    $content = Get-Content -Path $filePath
    $content += "Version: $versionNumber"
    $content | Set-Content -Path $filePath
}

# Input the path and version number
$rootPath = Read-Host "Enter the root path:"
$versionNumber = Read-Host "Enter the version number:"

# Locate all "version.txt" files under the root path
$versionFiles = Get-VersionFiles -path $rootPath

# Append the version number to each file
foreach ($file in $versionFiles) {
    Append-Version -filePath $file.FullName -versionNumber $versionNumber
}

# Commit and push the changes to GitHub
$commitMessage = "Update version numbers"
$branchName = Read-Host "Enter the branch name:"
$remoteName = Read-Host "Enter the remote name (e.g., origin):"

# Stage the modified files
$versionFiles | ForEach-Object { git add $_.FullName }

# Commit the changes
git commit -m $commitMessage

# Push the changes to the remote repository
git push $remoteName $branchName
