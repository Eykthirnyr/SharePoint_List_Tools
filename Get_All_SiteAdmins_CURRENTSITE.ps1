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

# Retrieve site collection administrators
$siteAdmins = Get-PnPSiteCollectionAdmin

# Display the site collection administrators
Write-Host "Site Collection Administrators for: $SiteURL"
foreach ($admin in $siteAdmins) {
    Write-Host "Admin: $($admin.Title), Email: $($admin.Email)"
}
Write-Host "-----------------------------------"