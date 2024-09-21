# Import PnP PowerShell module
Import-Module PnP.PowerShell -Verbose

# User Credential to connect to SharePoint Online
$userCredential = Get-Credential
Write-Verbose "Credential acquired" -Verbose

# SharePoint site URL
$SiteURL = "https://XXXXXXX.sharepoint.com/sites/XXXXX"
Write-Verbose "Setting Site URL to $SiteURL" -Verbose

# Connect to the SharePoint site
Connect-PnPOnline -Url $SiteURL -Credentials $userCredential -Verbose
Write-Verbose "Connected to SharePoint site: $SiteURL" -Verbose

# Retrieve general information about the site
$site = Get-PnPWeb

# Output general information about the site
Write-Host "Site Title: $($site.Title)"
Write-Host "Site URL: $($site.Url)"
Write-Host "Site Description: $($site.Description)"
Write-Host "Site Language: $($site.Language)"
Write-Host "Site Template: $($site.WebTemplate)"

# Additional site information
Write-Host "Site Master Page URL: $($site.MasterUrl)"
Write-Host "Site Custom Master Page URL: $($site.CustomMasterUrl)"
Write-Host "Site Logo URL: $($site.SiteLogoUrl)"
Write-Host "Allow Designer: $($site.AllowDesigner)"
Write-Host "Allow Master Page Editing: $($site.AllowMasterPageEditing)"
Write-Host "Allow Revert From Template: $($site.AllowRevertFromTemplate)"
Write-Host "Site Features:"

# List all activated features on the site
Get-PnPFeature -Scope Site | ForEach-Object {
    Write-Host "`t$($_.DisplayName) - ID: $($_.Id)"
}

# Retrieve lists and libraries
Write-Host "Lists and Libraries:"
Get-PnPList | ForEach-Object {
    Write-Host "`t$($_.Title) - Item Count: $($_.ItemCount)"
}

# Retrieve Site Users
Write-Host "Site Users:"
Get-PnPUser | ForEach-Object {
    Write-Host "`t$($_.Title) - Email: $($_.Email)"
}

# Retrieve content types
Write-Host "Content Types:"
Get-PnPContentType | ForEach-Object {
    Write-Host "`t$($_.Name) - ID: $($_.Id)"
}