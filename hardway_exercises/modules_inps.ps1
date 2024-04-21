$env:PSModulePath

$($env:PSModulePath).Split(';')

Get-Module

Get-Module -ListAvailable

#Import module

Import-Module -Name ScheduleTask
Import-Module -Name PowerShellGet

Get-Command -Module PowerShellGet

Remove-Module -Name PowerShellGet

Find-Module -Name AzureAD
Install-Module -Name AzureAD
Import-Module -Name AzureAD
Remove-Module -Name AzureAD
Get-Command -Module AzureAD