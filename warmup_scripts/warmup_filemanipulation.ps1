# Review the all actions in the csv, json and xml file manipulation
# Load csv 
$csv_path = "D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\services.csv"
$csv_data = Import-csv -Path $csv_path
# get count of rows 
$csv_data.Count
# Extract some columns 
$csv_data | Select-Object -Property Name, Status | select -First 5
# Write the output to json / xml file
$out_json_path = 'D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\partdata.json'
$csv_data | Select-Object -Proprety Name, Status | ConvertTo-Json | Out-File -Path 

# Read the json_file and extract the data from that
$json_data = Get-Content -Path $out_json_path 
# Convert the string output to object
$json_obj = $json_data | ConvertFrom-Json
# Write the data as xml
$xml_path="D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\partdata.xml"
$csv_data | ConvertTo-xml -Path $xml_path  # This wont convert the objects along with schema
# read the xml data
[xml]$xml_raw = Get-Content -Path $xml_path  # this wont work on xml files with schema
$xml_data = Import-Clixml -Path $xml_path # this will work 

$xml_your_file = "D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\xml_worker_withDate.xml"
[xml]$your_data = Get-Content -Path $xml_your_file 

# convert the xml data to csv
$your_data | convertto-csv | out-file -path $your_csv_path