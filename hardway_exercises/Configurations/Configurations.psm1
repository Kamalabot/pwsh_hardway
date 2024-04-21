function Get-Configuration{
    <#
        .DESCRIPTION
        This is a description
        .EXAMPLE
        This is Ex1
        .EXAMPLE
        This is Ex2
        .LINK
        THis s a link
    #>
    [CmdletBinding()]
    Param()
    write-output "Get-Configuration"
}

function Set-Configuration{
    [CmdletBinding()]
    Param()
    write-output "Set-Configuration"
}