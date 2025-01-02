@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {iwr -Uri 'https://github.com/temujin-glitch/rdp/blob/a051e1adc6f7dd47eb36332502a9e1d2fd22228b/EnableRDP.ps1' -OutFile 'C:\Temp\EnableRDP.ps1'; Start-Process -FilePath 'powershell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File C:\Temp\EnableRDP.ps1' -Verb RunAs}"
