# Windows Remote Management (WinRM)-based PowerShell remoting sessions.
# WinRM is an implementation of the Web Services for Management (WS-Man) specification,

$env:COMPUTERNAME
Enable-PSRemoting -SkipNetworkProfileCheck

$test_stmt = Write-Output "this is a simple text"
$test_stmt

$testBlock = {Write-Output "This is a scriptBlock"}

& $testBlock  # will execute the script block

$credentials = Get-Credential
$localVar = 'This is from localmachine'

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'aicoder, 192.168.31.170'  # on admin shell
Get-Item WSMan:\localhost\Client\TrustedHosts 

Invoke-Command -ComputerName "aicoder" -Credential $credentials -ScriptBlock {
    $env:COMPUTERNAME
}

Invoke-Command -ComputerName "aicoder" -Credential $credentials -ScriptBlock {
    Write-Output "This command is inside : $($env:COMPUTERNAME) with $($localVar)."
}

Invoke-Command -ComputerName "aicoder" -Credential $credentials -ScriptBlock {
    Write-Output "This command is inside : $($env:COMPUTERNAME) with $($args[0])."
} -ArgumentList $argVari

Invoke-Command -ComputerName "aicoder" -Credential $credentials -ScriptBlock {
    Write-Output "This command is inside : $($env:COMPUTERNAME) with $($using:$localVar)."
}

Invoke-Command -ComputerName "aicoder" -Credential $credentials -ScriptBlock {
    get-aduser -filter * -server aicoder
}


$heySession = New-PSSession -ComputerName 192.168.31.170 -Credential $credentials

Enter-PSSession -Session $heySession  # Will enter into remote session

Exit-PSSession
Disconnect-PSSession $heySession
Remove-PSSession -Session  $heySession


##########Based on the PowerShell Remoting [qvJRaYlxI1w] ######################
winrm get winrm/config/client
winrm get winrm/config/service  # Works only on Administrator
# Checked the auth only kerberos and negotiate is allowed
winrm enumerate winrm/config/listener

Test-WSMan MDT -Authentication Negotiate -Credential $credentials

Get-NetTCPConnection -LocalPort 5985
Get-NetAdapter 
 Get-NetAdapter | Select-Object -Property Name, InterfaceDescription | Where-Object -Property Name -EQ 'WiFi'
