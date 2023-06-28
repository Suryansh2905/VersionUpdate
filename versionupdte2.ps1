Function Add-VersionEntry {
    [CmdletBinding( SupportsShouldProcess )]
    param (
        [Parameter( Mandatory )]
        [string]
        $FilePath,
        [version]
        $NewVersion,
        [string]
        $Branch = 'main'
    )

    if (-not (Test-Path $FilePath -PathType Leaf)) {
        throw "Invalid file path: $FilePath"
    }
    if ( $PSCmdlet.ShouldProcess('Program adds the released version number to the specified file, commits the changes and pushes them.') ) {
        Add-Content -Path $FilePath -Value $NewVersion

        git add $FilePath

        git checkout $Branch

        git commit -m 'Appended version number'

        git push origin $Branch
    }
}
