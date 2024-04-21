# In order for Pipeline to Work, we need the Begin, Process & EndBlock

function Make-Configuration {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$confPath,
        [Parameter()]
        [string]$version='1.1.1',
        [Parameter()]
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

Make-Configuration -Name 'testcfg.cfg' -confPath "D:\gitFolders\pwsh_hardway\hardway_exercises"

$configPath="D:\gitFolders\pwsh_hardway\hardway_exercises"

$names = @('test1.cfg','test2.cfg', 'test3.gcf')

Make-Configuration -Name 'testcfg.cfg' -confPath $configPath

Make-Configuration -Name 'testcfg1.cfg' -confPath $configPath

$names | Make-Configuration -confPath $ConfigPath -Os 'Windows'

$names | Make-Configuration -confPath $configPath -Os 'Windows' -Verbose

Get-Content -Path ".\hardway_exercises\$($names[0])"

$ConfigPath="D:\\gitFolders\\pwsh_hardway\\hardway_exercises"

New-Item -Path $ConfigPath -Name 'testing.cfg' -Itemtype File


