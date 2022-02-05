set "DIRTARGET=Files Release"
set "DIRBACKEND=C:\Data\Peernet\Backend"
set "DIRBROWSER=C:\Data\Peernet\Browser\Peernet.Browser.WPF\bin\Release\net5.0-windows\win-x64\publish\"

del "%DIRTARGET%\Backend.exe"
del "%DIRTARGET%\Application.dll"
del "%DIRTARGET%\Infrastructure.dll"
del "%DIRTARGET%\Microsoft.Extensions.DependencyInjection.Abstractions.dll"
del "%DIRTARGET%\Microsoft.Extensions.Logging.Abstractions.dll"
del "%DIRTARGET%\Microsoft.Extensions.Logging.dll"
del "%DIRTARGET%\Microsoft.Extensions.Options.dll"
del "%DIRTARGET%\Microsoft.Extensions.Primitives.dll"
del "%DIRTARGET%\Models.dll"
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
del "%DIRTARGET%\System.Runtime.CompilerServices.Unsafe.dll"

copy "%DIRBACKEND%\Backend.exe" "%DIRTARGET%\Backend.exe"

copy "%DIRBROWSER%\Application.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Infrastructure.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.DependencyInjection.Abstractions.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Logging.Abstractions.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Logging.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Options.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Microsoft.Extensions.Primitives.dll" "%DIRTARGET%\"
copy "%DIRBROWSER%\Models.dll" "%DIRTARGET%\"
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
copy "%DIRBROWSER%\System.Runtime.CompilerServices.Unsafe.dll" "%DIRTARGET%\"
