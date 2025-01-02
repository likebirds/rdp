Invoke-WebRequest -Uri "https://raw.githubusercontent.com/likebirds/rdp/c8b422f54e6319f0458ee3db5fe2a98982ca9eab/RunRDPScript.bat" -OutFile "RunRDPScript.bat"
Start-Process -FilePath "RunRDPScript.bat" -Wait
