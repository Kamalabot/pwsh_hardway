# work on hashtable
Set-StrictMode -Version latest


$myArray = New-Object -TypeName System.Collections.ArrayList
@(0..500).ForEach({$myArray.Add($_)})

$myArray.Count
$myArray.AddRange(0..55)
$myArray.Count

$MyHash = @{
    name='thet'
    inte=157
    age=756
}  # similar to JSON, note there is no comma

$MyHash.Keys

$MyHash.Values

$MyHash.GetType()

$MyHash.name
$MyHash.inte

$MyHash['age']
$MyHash['nullu']  # does not throw error in strict mode also

$MyHash.ContainsKey("nullu")
$MyHash.ContainsKey("age")

$MyHash.ContainsValue(157)


# Addvalue

$MyHash.Add('idea', 'super')
$MyHash

$MyHash['ky5'] = 'There is similar ways to worc'
$MyHash.ky6 = 'There is dot adderc'

$MyHash

$MyHash.Remove('ky6')
$MyHash

########Create Custom Objects###########

$Employee1 = New-Object -TypeName PSCustomObject 

$Employee1.GetType()

Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'emplId' -Value 51251
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'firstName' -Value 'Numero'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'lastName' -Value 'Uno'
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'Age' -Value 565


$Employee1

$Employee1.Age
$Employee1.firstName
$Employee1.lastName

$Employee1.Age = 56

$Employee1

Get-Member -InputObject $Employee1

$Employee2 = New-Object -TypeName PSCustomObject

Add-Member -InputObject $Employee2 -MemberType NoteProperty -Name 'emplId' -Value 5577

Get-Member -InputObject $Employee2

$Employee1.Equals($Employee2)

$Employee2

#### Second way is to create HashTable and Typecast it as custom object ####
$employee3 = [PSCustomObject]@{
    emplId = 57575
    firstName = 'Megal' 
    lastName = 'Rider'
    age = 57
}
$employee3