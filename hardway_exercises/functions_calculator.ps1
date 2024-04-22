# Write a function that involves params, processing, try-catch along with pipeline support
# Try creating a CLI calculator
function Make-Calculation{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [int]$var1,
        [Parameter(Mandatory)]
        [int]$var2,
        [Parameter(Mandatory)]
        [ValidateSet('sum', 'sub', 'mul', 'div')]
        [string]$op
    )
    switch ($op) {
        'sum'{
            $oped = $var1 + $var2
            write-output "The sum of $var1 and var2: $oped"
            break
        }
        'sub'{
            $oped = $var1 - $var2
            write-output "The diff of $var1 and var2: $oped"
            break
        }
        'mul'{
            $oped = $var1 * $var2
            write-output "The prod of $var1 and var2: $oped"
            break
        }
        'div'{
            $oped = $var1 / $var2
            write-output "The div of $var1 and var2: $oped"
            write-output "The division of of $var1 and var2: $oped"
            break
        }
        default {
            write-output "Dunno wat you want..."
            break
        }
    }
}

Make-Calculation -var1 5 -var2 5 -op 'sum'
Make-Calculation -var1 5 -var2 5 -op 'sub'
Make-Calculation -var1 5 -var2 5 -op 'div'
Make-Calculation -var1 5 -var2 5 -op 'mul'

try{
    Make-Calculation -var1 5 -var2 5 -op 'thted' -ErrorAction Stop
}catch{
    write-output "Seems like you have wrong operation"
}