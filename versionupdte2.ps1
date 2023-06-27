
[CmdletBinding(SupportsShouldProcess)]
    param (
        [string]$RepoPath,
        [string]$FileName,
        [version]$NewVersion,
        [string]$Branch = 'main'
    )

    Push-Location $RepoPath

    if (-not (Test-Path $FileName -PathType Leaf)) {
        throw "Invalid file path: $FileName"
    }
    if ($PSCmdlet.ShouldProcess('Program adds the released version number to the specified file, commits the changes and pushes them.')) {
        Add-Content -Path $FileName -Value $NewVersion

        git add $FileName

        git commit -m 'Appended version number'

        git checkout $Branch

        git push origin $Branch
    }

    Pop-Location
