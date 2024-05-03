# Work on basic variables with PS commands
$getprocess = Get-Process

$getservice = Get-Service

$num = 57

$floatilla = 689.52

$driver = 'Trucker'

$yourpdt = $num * $floatilla

$errorop = $driver * $floatilla

Get-Alias dir | Select-Object -property Name | Get-Member

Get-Alias dir | Select-Object -NoteProperty

$arry = [System.Collections.ArrayList]@()

$arry.add($driver)
$arry.add($num)
$arry.add($floatilla)
$arry.add($yourpdt)

$object = [PSCustomObject]@{
    driver = 'newobj' 
    micro = 6568 
    phone = 957
}

$anotherobj = New-Object PsCustomObject

Add-Member -InputObject $anotherobj -Membertype NoteProperty -Name driver -Value 576
Add-Member -InputObject $anotherobj -Membertype NoteProperty -Name student -Value Jean

for($i = 5; $i -lt 15; $i+2){
    write-output "The element is $i"
}

for($i = 5; $i lt 15; $i+2){
    write-output "The element is $i"
}
# The issue is in the third part of the for loop expr
# it has to be assignment

$num -lt 58

$num -gt 58

$bolto = $true

for($i = 1; $i -lt 5; $i+=1){
    write-output "The value is $i"
}

$getprocess.foreach({
    write-output "The data is $($_.name)"
})

foreach($point in $getprocess){
    write-output "Point data is $($point.name)"
}

Get-Process | gm | where-object -Property Membertype -EQ -Value Property

$storebj = New-Object PsCustomObject
$arrstore = [System.Collections.ArrayList]@()

foreach($pt in $getprocess){
    $tempjbo = New-Object PSCustomObject
    Add-Member -InputObject $tempjbo -Membertype NoteProperty -Name Pname -Value $pt.ProcessName
    Add-Member -InputObject $tempjbo -Membertype NoteProperty -Name Start -Value $pt.StartInfo
    $arrstore.add($tempjbo)
}

$arrstore[0]
# Reviewing the Error handlin