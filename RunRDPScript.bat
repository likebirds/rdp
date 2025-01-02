@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {iwr -Uri 'https://github.com/likebirds/rdp/blob/main/EnableRDP.ps1' -OutFile 'C:\Temp\EnableRDP.ps1'; Start-Process -FilePath 'powershell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File C:\Temp\EnableRDP.ps1' -Verb RunAs}"
