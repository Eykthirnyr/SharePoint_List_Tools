# Import PnP PowerShell module
Import-Module PnP.PowerShell -Verbose

# User Credential to connect to SharePoint Online
$userCredential = Get-Credential
Write-Verbose "Credential acquired" -Verbose

# SharePoint site URL
$SiteURL = "https://XXXXXXX.sharepoint.com/sites/XXXXXX"
Write-Verbose "Setting Site URL to $SiteURL" -Verbose

# Connect to the SharePoint site
Connect-PnPOnline -Url $SiteURL -Credentials $userCredential -Verbose
Write-Verbose "Connected to SharePoint site: $SiteURL" -Verbose

# Retrieve all groups in the site collection and include the Users property
$groups = Get-PnPGroup -Includes Users

# Iterate through each group
foreach ($group in $groups) {
    Write-Host "Group Name: $($group.Title), ID: $($group.Id)"

    # Check if the group has members
    if ($group.Users -ne $null -and $group.Users.Count -gt 0) {
        Write-Host "Members of the group: $($group.Title)"
        foreach ($member in $group.Users) {
            Write-Host "Name: $($member.Title), Email: $($member.Email), Login Name: $($member.LoginName)"
        }
    } else {
        Write-Host "No members found in the group: $($group.Title)"
    }

    Write-Host "-----------------------------------"
}