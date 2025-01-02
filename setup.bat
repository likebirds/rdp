Invoke-WebRequest -Uri "https://github.com/likebirds/rdp/blob/926849a9a973f4bb73fc2a2fffa54c9f07c5b2b0/RunRDPScript.bat" -OutFile "RunRDPScript.bat"
Start-Process -FilePath "RunRDPScript.bat" -Wait
