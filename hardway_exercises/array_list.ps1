# There are array & array_list DS
# Better is arrayList for datapoints more than 100 
Set-StrictMode -Version latest
Set-StrictMode -Off

$myArray = @()

$myArray.GetType()

$myArray.IsFixedSize

$arryWithItem = @('test', 'prgm', 'length')

$arryWithItem[0].GetType()

$arryWithItem[0]

# $arryWithItem[5] = 'nidex_add'
# Adding element to array
$arryWithItem += 'nidex_add'

$arryWithItem.Length

$arryWithItem

# removing is off by lot

$arryWithItem = $arryWithItem -ne 'prgm'
# sets arryWithItem where is not equal to prgm

$arryWithItem

#######################Array - List##################

$MyList1 = [System.Collections.ArrayList]@()
$MyList = New-Object -TypeName System.Collections.ArrayList

$MyList1.GetType()
$MyList.GetType()

$MyList1.add('Awesmose')
$MyList1

[void]$MyList1.add('Samose')

[void]$MyList1.add('Subway')

$myList2 = New-Object -TypeName System.Collections.ArrayList

$myList1.Remove('Subway')  # can remove any number of time in easy mode

$myList2.add('OutMenu')
$myList2

$myList2.AddRange(@('ele1', 'ele2', 'ele3'))
$myList2

$myList2.Remove('ele1')

# $myList2.RemoveRange(@('ele2', 'OutMenu'))  # will fail

$myList2.RemoveAt(1)
$myList2

$myList2.RemoveRange(5,3)  # second var is offset, not the end of range

Measure-Command -Expression {}  # will measure the command inside the flower-braces

$newArray = @()
Measure-Command -Expression {@(0..50000).ForEach({$newArray += $_})}  # takes a lot of time

$newList = New-Object -Typename System.Collections.Arraylist
Measure-Command -Expression {@(0..50000).ForEach({$newList.Add($_)})}  #  Completes in < 500 ms
Measure-Command -Expression {$newList.AddRange(0..500000)}  #  

$newList.Capacity
$newList.Count