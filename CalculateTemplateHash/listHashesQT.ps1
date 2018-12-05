[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [String]
    [ValidateNotNullOrEmpty()]
    $QsRepoRoot,
    
    [Parameter(Mandatory = $true)]
    [String]
    [ValidateNotNullOrEmpty()]
    $CurrentFolderName,

    [Parameter(Mandatory = $false)]
    [String[]]
    $OldFolderNames
)

process {
    $output = git --git-dir $QsRepoRoot log --name-only --format='%H' --follow -- $CurrentFolderName\azuredeploy.json | Out-String
    $commits=($output -split '[\r\n]') | Where-Object {$_}
    $hashes=@()

    For ($i=0; $i -lt $commits.Count; $i=$i+2) {
        $commit=$commits[$i]
        $filepath=$commits[$i+1]
        $folderName=$filepath.Substring(0, $filepath.IndexOf('/'))
        if ($folderName -eq $CurrentFolderName -Or ($OldFolderNames.Count -gt 0 -And @($OldFolderNames).Contains($folderName)))
        {
            $fileurl = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/$commit/$filepath"
            Write-Verbose ("Hashing url '$fileurl'...")
            $hash = & "HashExe\CalculateTemplateHash.exe" $fileurl
            Write-Verbose ("Hash=$hash")
            $hashes+=$hash
        }
        else {
            Write-Verbose ("Skipping folder '$folderName'.")
        }
    }

    Write-Host "${CurrentFolderName}:"
    Write-Host """$($hashes -join '","')"""
}