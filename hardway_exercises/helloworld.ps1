Write-Output "Hello World"

function Recieve-Output
{
    process { write-host $_ -Foregroundcolor Green}
}

Write-Output 'This is a test' | Recieve-Output
Write-Host 'This is a test' | Recieve-Output

$name = "Nama"
Write-Output "Hello $name"
Write-Output 'Hello $name'

$query = "SELECT * FROM OS WHERE NAME LIKE %SERVER%"

write-Output "Hello `t`t`t world"
write-Output $query

$xna = Read-Host "Tell me something?"
$howe = Read-Host "Tell pass" - AsSecureString  # works on pwsh only
# below works on pwsh only
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($howe))