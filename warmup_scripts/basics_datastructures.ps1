# A DataStructures Warmup along with loops, logic and conditional branching
# Create variables str, int and double
$var1 = 1
$var2 = 5.6
[int]$var3 = 12.5
[float]$var5 = 78.5

# Work with Math, Logic operators and assign to the variables
$test1 = $var1 -lt $var2
$test2 = $var5 -eq $var2
$test3 = $var5 -gt $var1

# Use the assigned vars to work with if / else / switch statements
if($test1){
    write-output "$var1 is less than $var2"
}else{
    write-output "$var2 is less than $var2"
}

if($test2){
    write-output "Var5: $var5 and Var2: $var2 are equal"
}elseif($test3){
    write-output "Var5: $var5 is greater than Var1: $var1"
}else{
    write-output "Who cares"
}

# Get Inputs from the user and check with conditions and provide output
while($true){
    $urInput = Read-Host -Prompt "Where is you?"
    if($urInput -eq 'q'){
        break
    }else{
        switch($urInput){
            {$_ -eq 'India'}{
                write-output "I see you are Asian"
                break
            }
            {$_ -eq 'China'}{
                write-output "You are from China?"
                break
            }
            {$_ -eq 'USA'}{
                write-output "A caucasian in pedigree"
                break
            }
            {$_ -eq 'Europe'}{
                write-output "An Aryan in background"
                break
            }
            default{
                write-output "You have provided input: $urInput"
                write-output "An Alien in nature"
                break
            }
        }
    }
}


while($true){
    $urInput = Read-Host -Prompt "Where is you?"
    if($urInput -eq 'q'){
        break
    }else{
        switch($urInput){
            'India'{
                write-output "I see you are Asian"
                break
            }
            'China'{
                write-output "You are from China?"
                break
            }
            'USA'{
                write-output "A caucasian in pedigree"
                break
            }
            'Europe'{
                write-output "An Aryan in background"
                break
            }
            default{
                write-output "You have provided input: $urInput"
                write-output "An Alien in nature"
                break
            }
        }
    }
}
# Create array-list, print the output, add-item, remove-items
$countries = @('India', 'USA', 'China', 'England', 'Brazil', 'Canada')
$number = @(7..50)
$services = Get-Service | select -First 5 
# Create empty array, add and remove data from it
$emptyArray = @()

$emptyArray += 'Test'
$emptyArray += 'Test5'
$emptyArray += 'Test7'

$emptyArray = $ $emptyArray -ne 'Test5'

# Create an ArrayList and operate on that
$arlist = New-Object -TypeName System.Collections.ArrayList
$arlist.AddRange($countries)
$newArlist = [System.Collections.Arraylist]@()
$countries.foreach({$newArlist.Add($_)})
$countries.foreach({[void]$newArlist.Add($_)})
# Create HashTables, print the output, add-keys and remove-keys
$myHash = @{
    name='newhash'
    age=55
    location='USA'
}

$myHash.Keys
$myHash.Values
$myHash['marks'] = 557

$myHash.add('belong','land') 
$myHash.remove('belong')

# Create PSCustomObject in traditional/ shortcut method addmember to it, print the output 
$AddObject = New-Object -TypeName PSCustomObject

Add-Member -InputObject $AddObject -Member NoteProperty -Name 'idea' -Value 'addObj'
Add-Member -InputObject $AddObject -Member NoteProperty -Name 'location' -Value 'India'
Add-Member -InputObject $AddObject -Member NoteProperty -Name 'Age' -Value 57
Add-Member -InputObject $AddObject -Member NoteProperty -Name 'table' -Value 'Members'

$hashobj = [PSCustomObject]@{
    FirstName = "Naik" 
    LastName = "Krish" 
    Subject = "ML" 
    Subscribers = 575 
}

# Add the HashObjects and PSCustomObjects into the ArrayList
$objlist = New-Object -TypeName System.Collections.ArrayList
$objlist.add($hashobj)
$objlist.add($AddObject)

# Work on the loops, for, foreach, do while and do until
#> foreach with item
foreach($item in $countries){
    write-output "The country in question is $item"
}
#> foreach on arraylist
$countries.foreach(
    {
        Write-Output "foreached countries: $_"
    }
)
#> for loop with numbers
for($i=0; $i -lt 10; $i+=2){
    write-output "Ther number is: $i"
    write-output "The country is:" + $countries[$i]
}

#do while loop with index
$indx = 0
do{
    write-output $newArlist[$indx]
    $indx += 1
}until($indx -eq $newArlist.Count+1)

$counter = 0
do{
    write-output 'This is super nice'
    $counter += 1
}while($counter -lt 5)

$counter = 0
do{
    write-output 'This is super nice'
    $counter += 1
}until($counter -gt 5)
