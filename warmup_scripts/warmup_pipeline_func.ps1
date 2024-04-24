# Work on reading the json data from the internet 
$url = "https://jsonplaceholder.typicode.com/todos/"

$resp_content = Invoke-WebRequest -Uri $url -Method GET
# Convert the response to Json Object
$json_data = $resp_content.Content | ConvertFrom-Json
# Write the data to file as json
$json_file = "temp.json"
$json_data | ConvertTo-Json | Out-File -Path $json_file
# Get the content of the above file and print it to the output
$read_json = Get-Content -Path $json_file | ConvertFrom-Json
# convert the json data to csv and write to file
$csv_file = 'warmup.csv'
$read_json | ConvertTo-CSV | out-file $csv_file
# read the csv file
Get-Content $csv_file | ConvertFrom-Csv | select -First 5
Import-csv $csv_file | select -First 5
# convert data to xml
$temp_xml = 'temp.xml'
$read_json | Export-CliXML -Path $temp_xml
# read a regular XML
$worker_xml="D:\gitFolders\pwsh_hardway\hardway_exercises\file_manipulations\xml_data_worker.xml"
[xml]$workers = Get-Content -Path $worker_xml  # observe the $ infront of the workers variable

# read the worker data from the xml object
$workers.workers.Worker | select -First 5

# write a function that reads a xml file & writes out the count of data inside it

function Get-Workercount {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $file_path
    )
    begin {
        Write-Output "Lets start WorkerCount"
    }
    process {
        # read in xml file
        Write-Output "Reading in the data from $file_path"
        [xml]$file_data = Get-Content -Path $file_path 
        # $count = $file_data.workers.worker.Count
        Write-Output "The count of workers are $($file_data.Workers.Worker.Count)"
    }
    end{
        Write-Output "Done with the work"
    }

}

Get-Workercount -file_path $worker_xml

# Write a function that takes a worker object and returns the name and id in with writeout

function Get-NameId {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [System.Xml.XmlElement]
        $workobj
    )
    begin {
        Write-Output 'Starting to extract worker data'
    }
    process {
        Write-Output "The Id of $($workobj.Name) is $($workobj.id)"
    }
    end {
        Write-Output "Done with the process"
    }
}

$workers.workers.worker[0]

Get-NameId -workobj $workers.workers.worker[10]

$workers.workers.worker | Get-NameId

# write a function that can read in data from cli output and process the same 
