Param(
[Parameter(Mandatory=$true)][string]$hostname='local')
Get-WmiObject -Class win32_computersystem `
    -ComputerName $hostname |
    fl numberofprocessors,totalphysicalmemory

Param(
[string]$hostname='local')
Get-CimInstance -ClassName win32_computersystem `
    -ComputerName $hostname |
    fl NumberOfProcessors, TotalPhysicalMemory


function MyFunction ($param1, $param2)
{
    Write-Output "$param1 & $param2"
}

MyFunction('5656', 5565)