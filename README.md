# SharePoint & Office 365 PowerShell Scripts

This repository contains a collection of PowerShell scripts designed to gather and list various types of information related to specific SharePoint sites or an entire Office 365 tenant.

## Features:
- List site owners
- List site users
- List groups
- List all sites in a tenant
- List all sites along with their owners for the tenant

The scripts are interactive, prompting you to input an administrator account within the PowerShell window.

## Requirements:
- **PowerShell v7.4.5** (recommended; compatibility with older versions is not guaranteed)
- Must be run with **administrator privileges**
- Requires the **PnP.PowerShell** module

### PnP.PowerShell Module Installation:
Some scripts will automatically check and install this module if not present. If manual installation is needed, use the following command:

```powershell
Install-Module -Name PnP.PowerShell
