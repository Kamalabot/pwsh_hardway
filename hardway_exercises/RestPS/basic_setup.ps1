[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-Module RestPS
Import-Module RestPS
Invoke-DeployRestPS -LocalDir 'c:\RestPS'

$RestParams = @{
    RoutesFilePath='C:\RestPS\endpoints\RestPSRoutes.JSON'
    Port=8080
}

Start-RestPSListener @RestParams  # note the '@'

$RestMethodParams=@{
    Uri='http://localhost:8071/endpoint/shutdown'
    Method='Get'
    UseBasicParsing=$true
}

Invoke-RestMethod @RestMethodParams  #If the method fails then use below

Invoke-RestMethod -Uri 'http://127.0.0.1:8071/endpoint/shutdown' -Method 'Get' -UseBasicParsing