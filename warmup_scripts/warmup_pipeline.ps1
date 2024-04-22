# Write a function that takes a Array of elements and provides the length of each.
function Get-Length{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Collections.ArrayList]$yourArray
    )
    begin{
        Write-Output "Taking up the process"
    }
    process{
        $yourArray.foreach({
            Write-Output "The length of value is $($_.length)"
        })
    }
    end{
        Write-Output "Completed Output"
    }
}

$newArray = @('This', 'is', 'a', 'very', 'nice', 'and', 'effective')

Get-Length -yourArray $newArray

$newArray | Get-Length