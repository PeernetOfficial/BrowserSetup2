set "DIRTARGET=Files Release"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Backend.exe"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Peernet Browser.exe"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Application.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Infrastructure.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Peernet Browser.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Serilog.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Serilog.Extensions.Logging.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Serilog.Sinks.File.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Serilog.Sinks.Trace.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\AsyncAwaitBestPractices.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\AsyncAwaitBestPractices.MVVM.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Peernet.SDK.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\DevExpress.Xpf.Themes.PeernetDarkTheme.v22.2.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\DevExpress.Xpf.Themes.PeernetLightTheme.v22.2.dll"

REM Plugins

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ImageViewer\Peernet.Browser.Plugins.ImageViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ImageViewer\Peernet.SDK.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\MediaPlayer\LibVLCSharp.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\MediaPlayer\LibVLCSharp.WPF.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\MediaPlayer\Peernet.Browser.Plugins.MediaPlayer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\MediaPlayer\Peernet.SDK.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\TextViewer\Peernet.Browser.Plugins.TextViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\TextViewer\Peernet.SDK.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ByteViewer\Peernet.Browser.Plugins.ByteViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ByteViewer\Peernet.SDK.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ByteViewer\WPFHexaEditor.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ExcelViewer\Peernet.Browser.Plugins.ExcelViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\ExcelViewer\Peernet.SDK.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\PDFViewer\Peernet.Browser.Plugins.PDFViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\PDFViewer\Peernet.SDK.dll"

signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\WordViewer\Peernet.Browser.Plugins.WordViewer.dll"
signtool sign /n "Peernet" /fd SHA256 "%DIRTARGET%\Plugins\WordViewer\Peernet.SDK.dll"

PAUSE
