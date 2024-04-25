$csv_path="D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\Characters.csv"
$DataTable=New-Object System.Data.DataTable  # Create a DataTable type object
$CsvTable=Get-Content -Path $csv_path  # lines are split already into elements
$GetColumns=$CsvTable[0].split(',')  # get the top line and split it based on ','
$CsvData = $CsvTable | select -skip 1 # skip the top-line
$DataTable.Columns.AddRange($GetColumns)
# Adding data to the Datatable, after the columns are added
ForEach($pt in $CsvData){
    [void]$DataTable.Rows.Add($pt.split(','))
}
$FilterHouse = New-Object System.Data.DataView($DataTable)
$FilterHouse.RowFilter = "House like Ravenclaw"  
# There seems to be a different way to deal with csv files with empty cells
# Redoing the above with a civilization.csv
Measure-Command -Expression {
$civ_path = "civilizations.csv"
$civ_data = Get-Content -Path $civ_path
$Dtbl = New-Object System.Data.DataTable
$civ_cols = $civ_data[0].split(',') 
$civ_data = $civ_data | select -skip 1
$Dtbl.Columns.AddRange($civ_cols)
foreach ($currentItem in $civ_data) {
    write-output $currentItem
    [void]$Dtbl.Rows.Add($currentItem.split(','))
}

$civ_view = New-Object System.Data.DataView($Dtbl)
$civ_view.RowFilter = "end < 500"
$civ_view
$civ_view.RowFilter = "end < 1000"
$civ_view
}
# The above works but the regular way is faster
Measure-Command -Expression {
$csv_imp = Import-Csv $csv_path
$csv_imp | Where-Object -Property start -LE -Value 500
$csv_imp | Where-Object -Property start -LE -Value 1000
}

# Processing the data from different CSV files columns

$csv_paths = get-childitem -Filter -like -Value '*part*.csv'  # wrong syntax
$csv_paths = get-childitem -Filter -like '*part*.csv'  # -like is not required
$csv_paths = get-childitem -Filter -like '*data*.csv'  # -like is not required
$csv_paths = get-childitem -Filter -like '*.csv'  # -like is not required
$csv_paths = get-childitem -Path . -Filter '*.csv'
$csv_paths = get-childitem -Path . -Filter '*data*.csv'

$Export = [System.Collections.Arraylist]@()
$column = 'Salary'
foreach($file in $csv_paths){
    $file_data = Import-Csv -Path $file -Delimiter ','
    $ttl = 0  # this is internal to the file
    foreach($row in $file_data){
        $ttl += $row.$column
    }
    $ExportData = New-Object -TypeName PsObject
    Add-Member -InputObject $ExportData -MemberType NoteProperty -Name 'File' -Value $file.name
    Add-Member -InputObject $ExportData -MemberType NoteProperty -Name 'Total' -Value $ttl
    [void]$Export.Add($ExportData)
}

Write-output $Export

# Changing the column headers in multiple csv-files

$csv_paths = get-childitem -Path . -Filter "*data*.csv"
$columnage = @{Label="Years Old"; expression={$_.Age}}
$colsalary = @{Label="Earnings"; expression={$_.Salary}}

foreach($file in $csv_paths){
    write-output $file.Name
    $data = Import-Csv -Path $file.Name -Delimiter ',' | select Name, ID, $columnage, $colsalary
    $data
    $data | Export-Csv -Path "$($file.name)_moded.csv" -Delimiter ',' -NoTypeInformation
}

# Combine the two Salary.csv files

$result = [System.Collections.Arraylist]@()
$csv_path = get-childitem -Path . -Filter "*data*.csv"

foreach($file in $csv_path){
    $result += Import-Csv -Path $file.name -Delimiter ','
}

$result | Export-Csv -Path 'combined.csv'

# split the csv-file into smaller files
$source_file = "warmup_scripts\big-mac-raw-index.csv"

$num_files = 3
$startRow = 0

$tgt_folder = "D:\gitfolders\pwsh_hardway\to_delete"
Test-Path -Path $tgt_folder

$source_data = Import-Csv -Path $source_file -Delimiter ','

$numRowsFile = [Math]::Ceiling($source_data.Count / $num_files)
$Counter = 1

while($startRow -lt $source_data.Count){
    $source_data | select-object -Skip $startRow -First $numRowsFile | Export-Csv -Path "$($tgt_folder)\split_file_$($Counter)" -Delimiter ',' -NoTypeInformation -NoClobber
    $startRow += $numRowsFile
    $Counter += 1
}