[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [String]
    [ValidateNotNullOrEmpty()]
    $QsRepoRoot
)

process {
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "101-jenkins" -OldFolderNames @("101-jenkins-master-on-ubuntu")
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "101-jenkins-with-SSH-public-key"
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "101-spinnaker" -OldFolderNames @("spinnaker-vm-simple")
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "201-spinnaker-acr-k8s" -OldFolderNames @("spinnaker-vm-to-kubernetes")
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "201-jenkins-acr" -OldFolderNames @("201-jenkins-to-azure-container-registry")
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "301-jenkins-acr-spinnaker-k8s"
    .\listHashes.ps1 -QsRepoRoot $QsRepoRoot -CurrentFolderName "301-jenkins-aptly-spinnaker-vmss" -OldFolderNames @("spinnaker-jenkins-to-vmss")
}