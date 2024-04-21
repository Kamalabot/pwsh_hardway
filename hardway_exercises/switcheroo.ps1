# We will look at switches compared to if-else
$filePath = "D:\\gitFolders\\pwsh_hardway\\hardway_exercises\\names_data.txt"
$Data = Get-Content -Path $filePath
$firstname = $Data[0]

if($firstname -eq 'Nick'){
   Write-Output "Name is $firstname" 
}elseif($firstname -eq 'Tom'){
    Write-Output "Name is $firstname"
}elseif($firstname -eq 'John'){
    Write-Output "Finally $firstname"
}else{
    Write-Output "Unsure..."
}

switch($firstname){
    "Tim"{
        Write-Output "Switched $firstname"
        break
    }
    "John"{
        Write-Output "Will call $firstname"
        break
    }
    default{
        Write-Output "Call Anyone.."
        break
    }
}

# Anything to be eval in PShell, need to use {}
# If refering the value inside a loop or switch, use $_
switch($Data.Count){
    {$_ -lt 5}{
        Write-Output 'File has less than 5 lines'
        Write-Output "There is ($Data.Count) lines"
        break
    }
    {$_ -lt 10}{
        Write-Output 'File might have more than 5 lines and less than 10 lines'
        Write-Output "There is ($Data.Count) lines"
        break
    }
    default{
        Write-Output 'No Idea how big the file is...'
        break
    }
}