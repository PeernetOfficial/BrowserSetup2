# General
This is [Inno Setup](https://jrsoftware.org/isinfo.php) script that generates complete setup for Peernet software.
The script responsibility:
- Check if .NET Desktop Runtime 6.0.x is installed.  
- If the runtime is missing, the installer will download the runtime from [Official Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/5.0) website
- The installer will run downloaded runtime installer
- The installer will download checked plugins from Peernet servers
- Once runtime installation is completed and plugins downloaded, it will proceed to core Peernet installation which includes unpacking of __Peernet Browser__ together with __Backend__ and __Firewall Allow.cmd__ batch file.
- At the last step installer will run __Firewall Allow.cmd__ batch file

Downloading of the runtime from setup file is possible thanks to [Inno Download Plugin](https://jrsoftware.org/isinfo.php). 
It is the set of APIs which use in the script gives ability to download files. For more information install [the plugin](https://drive.google.com/file/d/0Bzw1xBVt0mokWHlicktGUVNXeTA/view?resourcekey=0-zNIx1s76O4jwgCPWjqEsCA) and read the documentation.

## Compilation
> Inno Setup Version 6.1 has added support for downloading files without using a third-party tool. Latest Peernet Setup revision uses Download features from Inno Setup 6.1 thus there is no need to install Inno Download Plugin (steps 2-3).
Although the plugin might be needed for some historical revisions.

1. Download and install [Inno Setup](https://jrsoftware.org/isdl.php)  
This basically gives ability to compile scripts, although since the script uses downloading features you need to:
2. Install the [Inno Download Plugin](Archive/idpsetup-1.5.1.exe) from the archive folder.
3. Modify the file `[path]\Inno Setup 6\ISPPBuiltins.iss` by adding following to the end of the file
```
#pragma include __INCLUDE__ + ";" + ReadReg(HKLM, "Software\Mitrich Software\Inno Download Plugin", "InstallDir")
```
4. Open the script in the __Inno Setup Compiler__
5. Compile.  
You can compile either by _CTRL + F9_ combination or by _Build > Compile_


## Preparation Checklist

Follow each step before generating a release version for the public.

1. Core: Update the core version number in the file `Config.go`. It is going to be part of the User Agent.

2. Cmd: Open `Main.go`. Change the User Agent to `Peernet Browser`. The core version is automatically added to it.

3. Cmd: Make sure to compile it using these flags: `go build -trimpath -ldflags "-H=windowsgui -s"`

4. Browser: Compile it using: `dotnet publish -c Release --no-self-contained`

5. Setup: Change the version number in the file `InnoPeernetSetup.iss` in the field `MyAppVersion`

## Edge Cases

### Running Setup as different User

If the setup is run as different user (for example using right-click "Run as administrator") it will actually install the browser for that selected user. If this is done from non-admin account (started under admin rights), the installed version will be inaccessible to the non-admin user.

## Additional Tasks Screen

The setup has an "Additional Tasks" screen. It lists:
* Create a desktop shortcut
* Pin to taskbar (currently not working on Windows 10)
* Download GeoIP database for Peers Map https://peernet.org/dl/setup/GeoIP.zip
* Download Media Player Plugin https://peernet.org/dl/setup/plugin/MediaPlayer.zip
* Download Text Viewer Plugin https://peernet.org/dl/setup/plugin/TextViewer.zip
* Download Picture Viewer Plugin https://peernet.org/dl/setup/plugin/PictureViewer.zip
* Download Hex Viewer Plugin https://peernet.org/dl/setup/plugin/ByteViewer.zip

The ZIP files downloaded are [update packages](https://github.com/PeernetOfficial/core/tree/master/system) placed into the `data/update` folder. They contain an `info.ini` file that instructs the backend what to do with it.


# Improvement Ideas
## Pin To Taskbar option
There is a discussion spanning topic of taskbar pin option on [Peernet Talk](https://talk.peernet.org/discussion/42/setup-pin-to-taskbar/).
### Windows 10 possible solution
Pinning to taskbar for many Windows versions used to be easy task with reusing one of COM Object resources to simulate _Pin to taskbar_ context menu click.
Starting from some Windows 10 update pinning to taskbar became tricky. Microsoft changed _Shell_ namespaces and introduced new method of _Start Layout_ management.
The method uses XML file which defines the [__Start Layout__](https://docs.microsoft.com/en-us/windows/configuration/windows-10-start-layout-options-and-policies) (including taskbar).

Such file for Peernet Browser could be defined as:

```
<LayoutModificationTemplate 
xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"  
Version="1" 
xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout">
  <CustomTaskbarLayoutCollection PinListPlacement="Replace">
    <defaultlayout:TaskbarLayout>
      <taskbar:TaskbarPinList>
        <taskbar:DesktopApp DesktopApplicationLinkPath="%appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Peernet Browser.lnk" />
      </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
  </CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
```

where 
><taskbar:DesktopApp DesktopApplicationLinkPath="%appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Peernet Browser.lnk" /> 

is .lnk file reference created based on 'Peernet Browser.exe'.  
__.lnk__ could be created from the Inno script code:
```
    PinAppFromLayout;
    FileCopy(
         ExpandConstant('{app}\Peernet Browser.lnk'), ExpandConstant('{autoappdata}\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Peernet Browser.lnk'),
         False);
```

where _PinAppFromLayout_ is defined as
```
procedure PinAppFromLayout;
begin
  CreateShellLink(
    ExpandConstant('{app}\Peernet Browser.lnk'),
    '',
    ExpandConstant('{app}\Peernet Browser.exe'),
    '',
    ExpandConstant('{app}\config'),
    '',
    0,
    SW_SHOWNORMAL);
end;
```

The XML Start Layout file should be imported to the output directory under __[File]__ directive
```
Source: "Files Static\TaskBarLayout.xml"; DestDir: "{app}"; Flags: ignoreversion
```

Having it in the file system the file can later be set as Start Layout definition either via __Group Policy Editor__ or respective registry keys.
Inno supports registry management under __[Registry]__ directrive.

```
Root: HKCU; Subkey: "Software\Policies\Microsoft\Windows\Explorer"; Flags: createvalueifdoesntexist;
Root: HKCU; Subkey: "Software\Policies\Microsoft\Windows\Explorer"; ValueName:"LockedStartLayout"; ValueData: "$1"; ValueType: dword; Flags: createvalueifdoesntexist;
Root: HKCU; Subkey: "Software\Policies\Microsoft\Windows\Explorer"; ValueName:"StartLayoutFile"; ValueData: "{app}\TaskBarLayout.xml"; ValueType: expandsz; Flags: createvalueifdoesntexist;
```

Changes to the registry require privileged access. The proposed solution requires running the setup with elevated rights. It is recommanded to look for some improvement in this matter.
Change of Start Layout XML file requires reboot (or user relog = log out + log in) to have the effect.