# Working on how to do the testing
param(
    $comptername,
    $credentials
)

Describe 'checking deployment'{
    # checking higher level env, services
    Context 'checking windows services'{
        It 'Making Sure Spooler is working'{
            $Service = Invoke-Command -ComputerName $comptername -Credential $credentials -ScriptBlock {
                Get-Service Spooler
            }
            $Service.status | Should Be "Running"
        }
    }  
}


Invoke-Pester -Script (.\pester_testing.ps1 -ComputerName 'Linux' -Credential (Get-Credential))

$ScripParam = @{
    Path=".\pester_testing.ps1"
    Parameters=@{
        ComputerName='192.168.12.17'
        Credentials=Get-Credential
    }
}

Invoke-Pester -Script $ScripParam -OutputFile "pester-out.xml"  -outputformat NUnitXml