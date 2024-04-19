Param(
[Parameter(Mandatory=$true)][string[]]$myarray)
foreach ($ele in $myarray)
{
    Write-Output $ele

}

# Region
# myarray[0]: 1,2,3,5
# myarray[1]: 5
# myarray[2]: 7
# myarray[3]: 8
# myarray[4]: 9
# myarray[5]: 
# 1,2,3,5
# 5
# 7
# 8
# 9
# endregion