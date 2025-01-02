# Check if the script is running as Administrator
If (-Not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "Relaunching as administrator..."
    Start-Process -FilePath PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Enable Remote Desktop by setting the registry value
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Write-Output "Remote Desktop enabled in the registry."

# Enable the firewall rule for Remote Desktop
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Write-Output "Remote Desktop firewall rule enabled."

# Capture the IP address of the machine
$IPAddresses = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "169.*" }).IPAddress
Write-Output "The following IPv4 addresses are available for remote connection:"
$IPAddresses

# Save IP addresses to a file
$FilePath = "$env:USERPROFILE\Desktop\IPAddresses.txt"
$IPAddresses | Out-File -FilePath $FilePath
Write-Output "IP addresses saved to: $FilePath"

# Optional: Copy the file to a remote location (e.g., a shared network folder)
$RemotePath = "\\ServerName\SharedFolder\IPAddresses.txt"  # Replace with your network share
Copy-Item -Path $FilePath -Destination $RemotePath -Force
Write-Output "IP addresses copied to remote location: $RemotePath"

# Add a user to the Remote Desktop Users group (optional, replace 'Username' with actual username)
# Add-LocalGroupMember -Group "Remote Desktop Users" -Member "Username"

Write-Output "Script completed successfully."
