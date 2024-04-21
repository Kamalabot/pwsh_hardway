# take results from commandlet to multiple command-lets
# get-service, start-service, stop-service
$sshd = 'sshd'
$sshd

Get-Service -Name $sshd
start-service -Name $sshd

Get-Help Stop-Service -Full

(Get-Service -Name $spoolerName).GetType()

$services = New-Object -Typename System.Collections.ArrayList
$services.AddRange(@('sshd', 'w32time'))

$services | Get-Service | Stop-Service
$services | Get-Service | Start-Service
$services | Get-Service 


$services | Get-Service | ForEach-Object{Write-Output "Service: $($_.displayname) is currently $($_.status)"}