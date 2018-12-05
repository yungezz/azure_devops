# Calculate template hash for Quickstart Templates

This tool calculates the hash of all versions of 'azuredeploy.json' for a template. These hashes are used to track the template for telemetry purposes

In order to run:
1. Run listHashes.ps1

## Example commands:
For one template:
```
.\listHashes.ps1 -QsRepoRoot "C:\Repos\azure-quickstart-templates\.git" -CurrentFolderName "101-jenkins" -OldFolderNames @("101-jenkins-master-on-ubuntu")
```
> NOTE: There is also a `devOps.ps1` script that takes just QsRepoRoot and runs this for all known devOps templates

## Parameters
|Name|Description|
|---|---|
|QsRepoRoot|Path to your local azure-quickstart-templates root (make sure to include ".git" at the end)|
|CurrentFolderName|The folder name for the template|
|OldFolderNames|An array of past folder names for this template. Git doesn't handle renaming well, so we need to make sure we're just hashing what you want|

## CalculateTemplateHash.exe
If you want to rebuild the exe to calculate the hashes, open the solution and restore nuget packages using this package source:
`<repo name="Official" uri="https://msazure.pkgs.visualstudio.com/DefaultCollection/_apis/packaging/Official/nuget/index.json" fallback="http://wanuget/Official/nuget" />`