# working on operators
1 -eq 2  #Equals
1 -lt 2  #LessThan
1 -le 2  #LessThanEqual
3 -gt 2  #GreaterThan
2 -ge 2  #GreaterThanEqual
3 -ne 2  #NotEqual

@(1,2,3)  -contains 3
@('test', 'apple') -contains 'TEST'
@('test', 'apple') -ccontains 'TEST'


'Tets' -eq  'Test'  #False
'TEST' -eq  'TEST'  #True

$filePath = "D:\\gitfolders\\pwsh_hardway\\hardway_exercises\\conditionals.ps1"
Test-Path -Path $filePath  # True

### Starting the If Else Scripts #######

if(Test-Path -Path $filePath){
    Write-Output "File Exists"
}

if(Test-Path -Path $filePath){
    Write-Output "File Exists"
    $data = Get-Content -Path $filePath
    if($data.Count -lt 5){
        Write-Output "this is a huge file"
    }elseif($data.count -gt 15){
        Write-Output "Humoungous file"
    }else{
        Write-Output 'A Puny file'
    }
}else{
    # Write-Output 'File "$filepath" does not exist'
    Write-Output "File $filepath does not exist"  # only this works
}