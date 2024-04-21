 New-ModuleManifest -Path "D:\\gitFolders\\pwsh_hardway\\hardway_exercises\\Configurations\\Configurations.psd1" -Author 'LofaMan' -Description 'Super Conf Module' -ModuleVersion '1.2.5' -RootModule 'Configurations.psm1' 

 import-Module .\Configurations\ -Force

 Remove-Module -Name Configurations

 Get-Command -Module Configurations

 Remove-Module -Name Configurations