function versionupdte2
{
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [string]$RepoPath,
        [string]$FilePath,
        [version]$NewVersion,
        [string]$Branch = 'main'
    )

    # Resolve the absolute file path within the repository
    $AbsoluteFilePath = Join-Path -Path $RepoPath -ChildPath $FilePath

    Set-Location $RepoPath

    if (-not (Test-Path $AbsoluteFilePath -PathType Leaf)) {
        throw "Invalid file path: $AbsoluteFilePath"
    }
    if ($PSCmdlet.ShouldProcess('Program adds the released version number to the specified file, commits the changes and pushes them.')) {
        Add-Content -Path $AbsoluteFilePath -Value $NewVersion

        git add $AbsoluteFilePath

        git checkout $Branch

        git commit -m 'Appended version number'

        git push origin $Branch
    }
}