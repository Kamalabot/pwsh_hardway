$url = "https://jsonplaceholder.typicode.com/todos"
# get the response
$request_data = Invoke-WebRequest -Uri $url -Method Get
# convert the json request to PSCustomObj
$request_json = $request_data.content | ConvertFrom-Json

$todo = "https://jsonplaceholder.typicode.com/todos"
$json_todo = $request_todos.Content | ConvertFrom-Json  # has been moded to PS objs

# do some looping
foreach($todo in $json_todo){
    Write-Output "Task of id $($todo.id) is $($todo.title)"
}

$json_todo.foreach({
    write-output "Task of id $($_.id) is $($_.title)"
})

$json_todo | foreach $($_.id.GetType())  # Errors out

$json_todo | Out-File -Path 'todo.json'  # will write text data, not json

# Write the output of the todo data to file
$json_todo | ConvertTo-Json | Out-File -Path 'todo.json'

# Write a function that will extract the company data from their data from API

$user_url = "https://jsonplaceholder.typicode.com/users"

$user_request = Invoke-WebRequest -Uri $user_url -Method GET

$user_data = $user_request.Content

$user_obj = $user_data | ConvertFrom-Json

# Write a function that extracts company data
function Get-Company{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int]$userid,
        [Parameter()]
        [PSCustomObject]$user_obj
    )
    write-output $userid
    $your_user = $user_obj[$userid-1]
    Write-Output $your_user.company
}


function Get-Companypipe{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [int]$userid
        # [Parameter()]
        # [PSCustomObject]$user_obj
    )
    begin {
        write-output 'Lets begin' 
    }
    process {
        # foreach($id in $userid){
            # $your_user = $user_obj[$id-1]
            # Write-Output $your_user.company
        # }
        Write-Output $_.company
    }
    end{
        write-output 'All Done'
    }
}