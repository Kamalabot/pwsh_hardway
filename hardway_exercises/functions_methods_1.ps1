# In order for Pipeline to Work, we need the Begin, Process & EndBlock

function Make-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$confPath,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$version='1.1.1',
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateSet("linux","windows")]
        [string]$Os='Windows'
    )
    begin {
        write-verbose "This is a function to create file $Name with $Os"
        # Used for setting up the database setup, and environment
        $CounterFailed = 0
    }
    process {
        try {
            New-Item -Path $confPath -Name $($Name) -Itemtype File -ErrorAction Stop
            $version | Out-File -FilePath "$($confPath)\$($Name)" -Force
            # The above Out-File writes the version to file
            $Os | Out-File -FilePath "$($confPath)\$($Name)" -Append -Force
        }catch{
            write-verbose $_.Exception.Message
            $CounterFailed++
        }
    }
    end {
        # used for showing error, display output and close out the environment
        write-output 'EndBlock'
        write-output "How many Errors: $CounterFailed"
    }
}

$configPath="D:\gitFolders\pwsh_hardway\hardway_exercises"

$names = @('test1.cfg','test2.cfg', 'test3.gcf')

$IISServer = New-Object -TypeName PSCustomObject 
Add-Member -InputObject $IISServer -MemberType NoteProperty -Name 'Name' -Value 'IISServer'
Add-Member -InputObject $IISServer -MemberType NoteProperty -Name 'version' -Value '1.2.5'
Add-Member -InputObject $IISServer -MemberType NoteProperty -Name 'Os' -Value 'Window'

# The above object failed to execute correctly, so moving on to another option.

$servers = Import-Csv .\hardway_exercises\multi_config_files.csv -Delimiter ','