# Script to create Bulk AD Organizational Units

$ADOU = import-csv <#C:\Scripts\ou.csv#>    # File path to CSV file of OUs to create

# ou CSV file needs to be laid out as name,path

#---Loops csv file---
foreach ($ou in $ADOU) {
    $error.clear() # Clear errors from previous loops
    $name = $ou.name # Passes name from user created CSV file
    $path = $ou.path # Passes ou's path from CSV file
    try {New-ADOrganizationalUnit -Name $name -path $path}
    catch {write-warning "An error occurred creating OU $name"} # Catches any errors and displays a warning
    if (!$error) {
        Write-Host "OU $name has been created!" -ForegroundColor Green
    }
}
