# Function to check if a module is installed
function Install-PnPModuleIfNotPresent {
    # Check if the PnP.PowerShell module is already installed
    if (-not (Get-Module -ListAvailable -Name PnP.PowerShell)) {
        Write-Host "PnP.PowerShell module not found. Installing now..."
        Install-Module -Name PnP.PowerShell -Force -AllowClobber
        Write-Host "PnP.PowerShell module installed successfully."
    } else {
        Write-Host "PnP.PowerShell module is already installed."
    }
}

# Install PnP.PowerShell module if not present
Install-PnPModuleIfNotPresent

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

# Retrieve all Microsoft 365 Groups
$m365Groups = Get-PnPMicrosoft365Group

# Iterate through each Microsoft 365 Group
foreach ($group in $m365Groups) {
    Write-Host "Microsoft 365 Group Name: $($group.DisplayName), ID: $($group.Id)"

    # Retrieve the owners of the current Microsoft 365 Group
    $groupOwners = Get-PnPMicrosoft365GroupOwner -Identity $group.Id

    # Check if the group has owners
    if ($groupOwners) {
        Write-Host "Owners of the Microsoft 365 Group: $($group.DisplayName)"
        foreach ($owner in $groupOwners) {
            # Display available owner properties
            Write-Host "Owner Name: $($owner.DisplayName), User Principal Name: $($owner.UserPrincipalName)"
        }
    } else {
        Write-Host "No owners found for the Microsoft 365 Group: $($group.DisplayName)"
    }

    Write-Host "-----------------------------------"
}
