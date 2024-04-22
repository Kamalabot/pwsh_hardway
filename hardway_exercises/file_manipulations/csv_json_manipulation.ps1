$json_raw_path = "errors_hints.json"

$json_data = Get-Content -Path $json_raw_path | ConvertFrom-Json

foreach($js in $json_data){
    write-output "The day is $($js.day)"
    write-output "The date is $($js.date)"
}

$csv_raw = "Characters.csv"
$csv_data = Import-Csv -Path $csv_ra

foreach($d in $csv_data){
    write-output "The Character name is $($d.'Character Name')"
}

$serv_data = Get-Service | Select-Object -Property Name, DisplayName, Status, StartType, @{Name="Time"; Expression={Get-Date -Format "MM-dd-yyyy HH:mm:ss"}}
$serv_data | Export-Csv -Path "services_withTime.csv"

$csv_data | ConvertTo-Json > 'characters.json'
$csv_data | ConvertTo-Json | out-file 'characters.json'

###### Working on the JSON net data ##############
$uri = "https://restcountries.com/v2/all"

$webRequest = Invoke-WebRequest -Uri $uri -Method Get

$content = $webRequest.content | ConvertFrom-Json

$content | where-object capital 'Harare'

# Next is creating json object to send request to Post / Put req to the APIs

$Jsonbod = @"
{
    "Emp_id":"1005",
    "Name":"Captain"
}
"@

$Jsonbod | ConvertFrom-Json

$customJson = New-Object -TypeName PSCustomObject
Add-Member -InputObject $customJson -MemberType NoteProperty -Name "EmployeeID" -Value 1006
Add-Member -InputObject $customJson -MemberType NoteProperty -Name "Name" -Value 'Exercises' 

Add-Member -InputObject $customJson -MemberType NoteProperty -Name "EmployeeID" -Value 1005
Add-Member -InputObject $customJson -MemberType NoteProperty -Name "Name" -Value 'Exercises' 