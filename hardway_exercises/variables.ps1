# Set-StrictMode -Version latest
Set-StrictMode -off
$PSVersionTable

$alpha = 5657
Write-Output $alpha
# if you use F8 for selection execution, then we will see the
# commands repeated on the cli
$myVar="SuperPS"
$myVar
$myVar.Length
# $myVar.GetType()
$alpha = 5657
$betadeci = 566.25

$alpha % $betadeci
$betadeci.GetType()

$alpha + $betadeci  # if var is not set, then wont get any output

$myExpr = $true
$myExpr.GetType()

$alpha = 5657
$myCheck = ($alpha -lt 1000)
$myCheck

# strict mode will throw error as the below var is not defined
$notSet

[int]$myConstraint = 3.52
[double]$myConstraintd = 3.52
$myConstraint
$myConstraintd
$myConstraint.GetType()

# the commands once executed using F8, stores the data in the execution space.
$today = Get-Date
$today