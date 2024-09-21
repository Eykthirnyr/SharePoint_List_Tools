# Import PnP PowerShell module
Import-Module PnP.PowerShell -Verbose

# User Credential to connect to SharePoint Online
$userCredential = Get-Credential
Write-Verbose "Credential acquired" -Verbose

# SharePoint site URL
$SiteURL = "https://XXXXXXXXX.sharepoint.com/sites/XXXXXX"
Write-Verbose "Setting Site URL to $SiteURL" -Verbose

# Connect to the SharePoint site
Connect-PnPOnline -Url $SiteURL -Credentials $userCredential -Verbose
Write-Verbose "Connected to SharePoint site: $SiteURL" -Verbose

# Retrieve all users from the site collection
$users = Get-PnPUser

# Loop through each user and output all their properties
foreach ($user in $users) {
    Write-Host "User Properties for: $($user.Title)"
    foreach ($prop in $user.PSObject.Properties) {
        Write-Host "$($prop.Name): $($prop.Value)"
    }
    Write-Host "-----------------------------------"
}