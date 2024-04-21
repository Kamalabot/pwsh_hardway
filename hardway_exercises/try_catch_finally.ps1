$ErrorActionPreference="Stop"
$Error  # Will provide all the error in the session
# The above is set to avoid setting -ErrorAction Stop

try{
    $filePath="D:\\gitFolders\\pwsh_hardway\\hardway_exercises\\"
    $files = Get-ChildItem -Path $filePath
    $files.foreach({
        Write-Output $_.name
    })
    Write-Output "this is after error"
}catch{
    Write-Output "Gotcha"
}finally{
    Write-Output "Always Executes"
}