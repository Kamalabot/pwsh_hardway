$dataPath = "xml_worker_withDate.xml"

[xml]$xmlData = Get-Content -Path $dataPath  

$xmlData.workers.worker

$worker_data = $xmlData.workers.worker

$worker_data | gm  # TypeName: System.Xml.XmlElement

foreach($emp in $worker_data){
    write-output "Employee: $($emp.id) has $($emp.name) and earns salary of $emp.salary"
}

$clixml = Import-Clixml -Path $dataPath
# Import-Clixml: Element 'Objs' with namespace name 'http://schemas.microsoft.com/powershell/2004/04' was not found. Line 1, position 2.
$services_path = "services.xml"

get-service | Export-Clixml -Path $services_path 

$services_raw = Import-Clixml $services_path

foreach($rao in $services_raw){
    write-output "$($rao.DisplayName) has a status of $($rao.Status)"
}
$worker_data | Select-Object -Property Name, id     