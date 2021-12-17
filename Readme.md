# General
This is [Inno Setup](https://jrsoftware.org/isinfo.php) script that generates complete setup for Peernet software.
The script responsibility:
- Check if .NET Desktop Runtime 5.0.x is installed.  
- If the runtime is missing, the installer will download the runtime from [Official Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/5.0) website
- The installer will run downloaded runtime installer
- Once runtime installation is completed it will proceed to core Peernet installation which includes unpacking of __Peernet Browser__ together with __Backend__ and __Firewall Allow.cmd__ batch file.
- At the last step installer will run __Firewall Allow.cmd__ batch file

Downloading of the runtime from setup file is possible thanks to [Inno Download Plugin](https://jrsoftware.org/isinfo.php). 
It is the set of APIs which use in the script gives ability to download files. For more information install [the plugin](https://drive.google.com/file/d/0Bzw1xBVt0mokWHlicktGUVNXeTA/view?resourcekey=0-zNIx1s76O4jwgCPWjqEsCA) and read the documentation.

### Compilation
To compile the script you need to:  
1. Download and install [Inno Setup](https://jrsoftware.org/isdl.php)  
This basically gives ability to compile scripts, although since the script uses downloading features you need to:

2. Download and install [Inno Download Plugin](https://jrsoftware.org/isinfo.php).
3. Modify [path]\Inno Setup 6\ISPPBuiltins.iss file by adding following to the end of the file
> #pragma include __INCLUDE__ + ";" + "[path]\Inno Download Plugin"

4. Open the script in the __Inno Setup Compiler__
5. Compile.  
You can compile either by _CTRL + F9_ combination or by _Build > Compile_