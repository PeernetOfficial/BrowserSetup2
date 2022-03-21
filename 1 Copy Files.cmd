set "DIRTARGET=Files Release"
set "DIRBACKEND=C:\Data\Peernet\Backend"
set "DIRBROWSER=C:\Data\Peernet\Browser\Peernet.Browser.WPF\bin\Release\net6.0-windows\win-x64\publish\"
set "DIRPLUGINS=C:\Data\Peernet\BrowserPlugins"

REM Backend

del "%DIRTARGET%\Backend.exe"
copy "%DIRBACKEND%\Backend.exe" "%DIRTARGET%\Backend.exe"

REM Browser

del "%DIRTARGET%\Application.dll"
del "%DIRTARGET%\Infrastructure.dll"
del "%DIRTARGET%\Microsoft.Extensions.DependencyInjection.Abstractions.dll"
del "%DIRTARGET%\Microsoft.Extensions.Logging.Abstractions.dll"
del "%DIRTARGET%\Microsoft.Extensions.Logging.dll"
del "%DIRTARGET%\Microsoft.Extensions.Options.dll"
del "%DIRTARGET%\Microsoft.Extensions.Primitives.dll"
del "%DIRTARGET%\Newtonsoft.Json.dll"
del "%DIRTARGET%\Peernet Browser.deps.json"
del "%DIRTARGET%\Peernet Browser.dll"
del "%DIRTARGET%\Peernet Browser.exe"
del "%DIRTARGET%\Peernet Browser.runtimeconfig.json"
del "%DIRTARGET%\Serilog.dll"
del "%DIRTARGET%\Serilog.Extensions.Logging.dll"
del "%DIRTARGET%\Serilog.Sinks.File.dll"
del "%DIRTARGET%\Serilog.Sinks.Trace.dll"
del "%DIRTARGET%\AsyncAwaitBestPractices.dll"
del "%DIRTARGET%\AsyncAwaitBestPractices.MVVM.dll"
del "%DIRTARGET%\Microsoft.Extensions.DependencyInjection.dll"
del "%DIRTARGET%\Peernet.SDK.dll"

copy "%DIRBROWSER%\Application.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Infrastructure.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.DependencyInjection.Abstractions.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Logging.Abstractions.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Logging.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Options.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Primitives.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Newtonsoft.Json.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Peernet Browser.deps.json" "%DIRTARGET%\"
copy "%DIRBROWSER%\Peernet Browser.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Peernet Browser.exe" "%DIRTARGET%\"
copy "%DIRBROWSER%\Peernet Browser.runtimeconfig.json" "%DIRTARGET%\"
copy "%DIRBROWSER%\Serilog.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Serilog.Extensions.Logging.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Serilog.Sinks.File.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Serilog.Sinks.Trace.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\AsyncAwaitBestPractices.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\AsyncAwaitBestPractices.MVVM.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.DependencyInjection.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Peernet.SDK.dll" "%DIRTARGET%\"

REM Browser Plugins

rmdir /S /Q "%DIRTARGET%\Plugins"
mkdir "%DIRTARGET%\Plugins"

xcopy "%DIRPLUGINS%\Peernet.Browser.Plugins.ImageViewer\bin\Release\net6.0-windows\publish" "%DIRTARGET%\Plugins\ImageViewer" /E /I
xcopy "%DIRPLUGINS%\Peernet.Browser.Plugins.MediaPlayer\bin\Release\net6.0-windows\publish" "%DIRTARGET%\Plugins\MediaPlayer" /E /I
xcopy "%DIRPLUGINS%\Peernet.Browser.Plugins.TextViewer\bin\Release\net6.0-windows\publish" "%DIRTARGET%\Plugins\TextViewer" /E /I
xcopy "%DIRPLUGINS%\Peernet.Browser.Plugins.ByteViewer\bin\Release\net6.0-windows\publish" "%DIRTARGET%\Plugins\ByteViewer" /E /I
