del "Output\Peernet Browser.zip"
del "Output\Packages\ByteViewer.zip"
del "Output\Packages\ImageViewer.zip"
del "Output\Packages\MediaPlayer.zip"
del "Output\Packages\TextViewer.zip"

REM Peernet Browser.zip

"C:\Program Files\WinRAR\WinRAR.exe" a -afzip -r -ep1 "Output\Peernet Browser.zip" "Files Release\*"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip -ep1 "Output\Peernet Browser.zip" "Files Static\Peernet Browser.dll.config"

cd "Files Static"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\Output\Peernet Browser.zip" "data\GeoLite2-City.mmdb"

REM Plugin Update Packages

cd "plugins\ByteViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\ByteViewer.zip" "info.ini"

cd "..\ImageViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\ImageViewer.zip" "info.ini"

cd "..\MediaPlayer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\MediaPlayer.zip" "info.ini"

cd "..\TextViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\TextViewer.zip" "info.ini"

cd "..\ExcelViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\ExcelViewer.zip" "info.ini"

cd "..\PDFViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\PDFViewer.zip" "info.ini"

cd "..\WordViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\..\Output\Packages\WordViewer.zip" "info.ini"

cd "..\..\..\Files Release\Plugins"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\ByteViewer.zip" "ByteViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\ImageViewer.zip" "ImageViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\MediaPlayer.zip" "MediaPlayer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\TextViewer.zip" "TextViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\ExcelViewer.zip" "ExcelViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\PDFViewer.zip" "PDFViewer"
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "..\..\Output\Packages\WordViewer.zip" "WordViewer"

PAUSE
