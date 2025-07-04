# Rename_Guest_Account.ps1

<#

.SYNOPSIS
This script renames the Guest account on the local machine.

.DESCRIPTION
The script checks if the Guest account exists and renames it to a specified name.

.PARAMETER newGuestAccountName
The new name for the Guest account.

.NOTES
- Qualys ID: 105228
- This script requires administrative privileges to run.
- The script uses the Get-WmiObject cmdlet to retrieve information about the Guest account.
- If the Guest account is found, it is renamed using the Rename() method of the Win32_UserAccount class.
- The script outputs a success message if the Guest account is renamed, or a failure message if the Guest account is not found.

.EXAMPLE
Rename-GuestAccount -newGuestAccountName "VCGuest"
#>

# Define new Guest account name
$newGuestAccountName = "VCGuest"

# Check if Guest account exists and rename it
$guestAccount = Get-WmiObject Win32_UserAccount -Filter "Name='Guest'"
if ($guestAccount) {
    $guestAccount.Rename($newGuestAccountName)
    Write-Output "Guest account renamed to $newGuestAccountName."
} else {
    Write-Output "Guest account not found."
}
