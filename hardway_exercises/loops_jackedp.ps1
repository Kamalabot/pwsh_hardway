# for-each loop
$filePath = "D:\\gitFolders\\pwsh_hardway\\hardway_exercises\\names_data.txt"
$data = Get-Content -Path $filePath
$folderPath ="D:\\gitFolders\\pwsh_hardway\\hardway_exercises\\del_folder\\" 

foreach($name in $data){
    Write-Output "Name is $name"
    if((Test-Path -Path "$folderPath$($name)") -eq $false){
        New-Item -Path $folderPath -Name $name -ItemType Directory
    }else{
        Write-Output 'File Folder Exists'
    }
}

$data | foreach-object -Process {
    Write-Output "Name is $_"
    if((Test-Path -Path "$folderPath$($_)") -eq $false){
        New-Item -Path $folderPath -Name $_ -ItemType Directory
    }else{
        Write-Output 'File Folder Exists'
    }

}

$data.foreach(
    {
        Write-Output $_
    }
)

$data.foreach(
    {
        if((Test-Path -Path "$folderPath$($_)") -eq $false){
            New-Item -Path $folderPath -Name $_ -ItemType Directory
        }else{
            Write-Output 'File Folder Exists'
        }
    }
)


if((Test-Path -Path "$folderPath$($data[0])") -eq $false){
    New-Item -Path $folderPath -Name $data[0] -ItemType Directory
}else{
    Write-Output 'File Folder Exists'
}

#### Entering Into other loops and Do While ######
for($i=0; $i -lt 10; $i+=2){
    Write-Output $i
}

$forArry = @("test1", "test2", "tes3", "test4")

$forArry.foreach(
    {
        Write-Output $_
    }
)

for($i=0; $i -lt $forArry.Length; $i++){
    Write-Output $forArry[$i]
}

foreach($item in $forArry){
    Write-Output $item
}

while ((Get-Date).minute -eq 11) {
    Get-Date 
}

while ($true){
    Write-Output "Welcome to Parrot Pshell"
    Write-Output "Press q when fed-up"
    $getInput = Read-Host -Prompt 'Provide a phrase'
    if ($getInput -ne 'q'){
        Write-Output $getInput
    }else{
        break
    }
}


do {
    Write-Output "Welcome to Parrot Pshell"
    Write-Output "Press q when fed-up"
    $getInput = Read-Host -Prompt 'Provide a phrase'
} until (
    $getInput -eq 'q'
)

$counter = 0
do{
    write-output 'This is super nice'
    $counter += 1
}while($counter -lt 5)

$counter = 0
do{
    write-output 'This is super nice'
    $counter += 1
}until($counter -gt 5)