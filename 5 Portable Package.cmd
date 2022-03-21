del "Output\Peernet Browser.zip"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip -r -ep1 "Output\Peernet Browser.zip" "Files Release\*"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip -ep1 "Output\Peernet Browser.zip" "Files Static\Peernet Browser.dll.config"

cd "Files Static"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\Output\Peernet Browser.zip" "data\GeoLite2-City.mmdb"
