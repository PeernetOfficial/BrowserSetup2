; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Peernet Browser"
#define MyAppVersion "0.7.0"
#define MyAppPublisher "Peernet"
#define MyAppURL "https://peernet.org/"
#define MyAppExeName "Peernet Browser.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt
#include <idp.iss>

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{ACA98841-0FF4-487B-BBDB-35AA720DE142}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={localappdata}\Peernet\Peernet Browser
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=Peernet Setup
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardStyle=modern
VersionInfoVersion={#MyAppVersion}
SetupIconFile=Files Static\Peernet.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
Name: "taskbaricon"; Description: "Pin to &taskbar"; GroupDescription: "{cm:AdditionalIcons}";
Name: "geoipsdatabase"; Description: "Download GeoIPs database for Peers Map"; GroupDescription: "{cm:AdditionalIcons}";
Name: "mediaplayerplugin"; Description: "Install MediaPlayer Plugin"; GroupDescription: "{cm:AdditionalIcons}";

[UninstallDelete]
Type: filesandordirs; Name: "{app}\data\blockchain global"
Type: filesandordirs; Name: "{app}\data\search index"

[Dirs]
Name: "{app}\data"

[Files]
Source: "Files Release\Application.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Infrastructure.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.DependencyInjection.Abstractions.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.Logging.Abstractions.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.Logging.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.Options.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.Primitives.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Peernet Browser.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Peernet Browser.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Static\Peernet Browser.dll.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Peernet Browser.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Peernet Browser.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Serilog.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Serilog.Extensions.Logging.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Serilog.Sinks.File.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Serilog.Sinks.Trace.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Static\Firewall allow.cmd"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Backend.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\AsyncAwaitBestPractices.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\AsyncAwaitBestPractices.MVVM.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Microsoft.Extensions.DependencyInjection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Files Release\Peernet.SDK.dll"; DestDir: "{app}"; Flags: ignoreversion
//Source: "{tmp}\GeoLite2-City.rar"; DestDir: "{app}\data"; Flags: external;
//Source: "{tmp}\MediaPlayer.rar"; DestDir: "{app}\Plugins"; Flags: external;
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{autoappdata}\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: taskbaricon

[Run]
; Filename: "{app}\Firewall allow.cmd"; Verb: runas; Flags: runascurrentuser shellexec
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[CustomMessages]
IDP_DownloadFailed=Download of .NET 6 failed. .NET 6 Desktop runtime is required to run Peernet Browser.
IDP_RetryCancel=Click 'Retry' to try downloading the files again, or click 'Cancel' to terminate setup.
InstallingDotNetRuntime=Installing .NET 6 Desktop Runtime. This might take a few minutes...
DotNetRuntimeFailedToLaunch=Failed to launch .NET Runtime Installer with error "%1". Please fix the error then run this installer again.
DotNetRuntimeFailed1602=.NET Runtime installation was cancelled. This installation can continue, but be aware that this application may not run unless the .NET Runtime installation is completed successfully.
DotNetRuntimeFailed1603=A fatal error occurred while installing the .NET Runtime. Please fix the error, then run the installer again.
DotNetRuntimeFailed5100=Your computer does not meet the requirements of the .NET Runtime. Please consult the documentation.
DotNetRuntimeFailedOther=The .NET Runtime installer exited with an unexpected status code "%1". Please review any other messages shown by the installer to determine whether the installation completed successfully, and abort this installation and fix the problem if it did not.

[Code]
var
  requiresRestart: boolean;

function CompareVersion(V1, V2: string): Integer;
var
  P, N1, N2: Integer;
begin
  Result := 0;
  while (Result = 0) and ((V1 <> '') or (V2 <> '')) do
  begin
    P := Pos('.', V1);
    if P > 0 then
    begin
      N1 := StrToInt(Copy(V1, 1, P - 1));
      Delete(V1, 1, P);
    end
      else
    if V1 <> '' then
    begin
      N1 := StrToInt(V1);
      V1 := '';
    end
      else
    begin
      N1 := 0;
    end;
    P := Pos('.', V2);
    if P > 0 then
    begin
      N2 := StrToInt(Copy(V2, 1, P - 1));
      Delete(V2, 1, P);
    end
      else
    if V2 <> '' then
    begin
      N2 := StrToInt(V2);
      V2 := '';
    end
      else
    begin
      N2 := 0;
    end;
    if N1 < N2 then Result := -1
      else
    if N1 > N2 then Result := 1;
  end;
end;

function NetRuntimeIsMissing(): Boolean;
var
  runtimes: TArrayOfString;
  registryKey: string;
  I: Integer;
  meetsMinimumVersion: Boolean;
  meetsMaximumVersion: Boolean;
  minimumVersion: string;
  maximumExclusiveVersion: string;
begin
  Result := True;

  minimumVersion := '6.0.0';
  maximumExclusiveVersion := '6.1.0';
  registryKey := 'SOFTWARE\WOW6432Node\dotnet\Setup\InstalledVersions\x64\sharedfx\Microsoft.WindowsDesktop.App';
  if RegGetValueNames(HKLM, registryKey, runtimes) then
  begin
    for I := 0 to GetArrayLength(runtimes)-1 do
    begin
      meetsMinimumVersion := not (CompareVersion(runtimes[I], minimumVersion) = -1);
      meetsMaximumVersion := CompareVersion(runtimes[I], maximumExclusiveVersion) = -1;
      if meetsMinimumVersion and meetsMaximumVersion then
      begin
        Log(Format('[.NET] Selecting %s', [runtimes[I]]));
        Result := False;
          Exit;
      end;
    end;
  end;
end;

procedure InitializeWizard;
begin
  if NetRuntimeIsMissing() then
  begin
    idpAddFile('https://download.visualstudio.microsoft.com/download/pr/efa32b7a-6eec-4d97-9cdc-c7336a29a749/3df4296170397cf60884dae1be3d103b/windowsdesktop-runtime-6.0.2-win-x64.exe', ExpandConstant('{tmp}\NetRuntimeInstaller.exe'));
    idpDownloadAfter(wpReady);
  end;
end;

function InstallDotNetRuntime(): String;
var
  StatusText: string;
  ResultCode: Integer;
begin
  StatusText := WizardForm.StatusLabel.Caption;
  WizardForm.StatusLabel.Caption := CustomMessage('InstallingDotNetRuntime');
  WizardForm.ProgressGauge.Style := npbstMarquee;
  try
    if not Exec(ExpandConstant('{tmp}\NetRuntimeInstaller.exe'), '/passive /norestart /showrmui /showfinalerror', '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then
    begin
      Result := FmtMessage(CustomMessage('DotNetRuntimeFailedToLaunch'), [SysErrorMessage(resultCode)]);
    end
    else
    begin
      // See https://msdn.microsoft.com/en-us/library/ee942965(v=vs.110).aspx#return_codes
      case resultCode of
        0: begin
          // Successful
        end;
        1602 : begin
          MsgBox(CustomMessage('DotNetRuntimeFailed1602'), mbInformation, MB_OK);
        end;
        1603: begin
          Result := CustomMessage('DotNetRuntimeFailed1603');
        end;
        1641: begin
          requiresRestart := True;
        end;
        3010: begin
          requiresRestart := True;
        end;
        5100: begin
          Result := CustomMessage('DotNetRuntimeFailed5100');
        end;
        else begin
          MsgBox(FmtMessage(CustomMessage('DotNetRuntimeFailedOther'), [IntToStr(resultCode)]), mbError, MB_OK);
        end;
      end;
    end;
  finally
    WizardForm.StatusLabel.Caption := StatusText;
    WizardForm.ProgressGauge.Style := npbstNormal;
    
    DeleteFile(ExpandConstant('{tmp}\NetRuntimeInstaller.exe'));
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  // 'NeedsRestart' only has an effect if we return a non-empty string, thus aborting the installation.
  // If the installers indicate that they want a restart, this should be done at the end of installation.
  // Therefore we set the global 'restartRequired' if a restart is needed, and return this from NeedRestart()
  DelTree(ExpandConstant('{app}\data\blockchain global'), True, True, True);
  DelTree(ExpandConstant('{app}\data\search index'), True, True, True);

  if NetRuntimeIsMissing() then
  begin
    Result := InstallDotNetRuntime();
  end;
end;

function NeedRestart(): Boolean;
begin
  Result := requiresRestart;
end;

#ifdef UNICODE
  #define AW "W"
#else
  #define AW "A"
#endif

const
  // these constants are not defined in Windows
  SHELL32_STRING_ID_PIN_TO_TASKBAR = 5386;
  SHELL32_STRING_ID_PIN_TO_STARTMENU = 5381;
  SHELL32_STRING_ID_UNPIN_FROM_TASKBAR = 5387;
  SHELL32_STRING_ID_UNPIN_FROM_STARTMENU = 5382;

type
  HINSTANCE = THandle;
  HMODULE = HINSTANCE;

  TPinDest = (
    pdTaskbar,
    pdStartMenu
  );

function LoadLibrary(lpFileName: string): HMODULE;
  external 'LoadLibrary{#AW}@kernel32.dll stdcall';
function FreeLibrary(hModule: HMODULE): BOOL;
  external 'FreeLibrary@kernel32.dll stdcall';
function LoadString(hInstance: HINSTANCE; uID: UINT;
  lpBuffer: string; nBufferMax: Integer): Integer;
  external 'LoadString{#AW}@user32.dll stdcall';

function TryGetVerbName(ID: UINT; out VerbName: string): Boolean;
var
  Buffer: string;
  BufLen: Integer;
  Handle: HMODULE;
begin
  Result := False;

  Handle := LoadLibrary(ExpandConstant('{sys}\Shell32.dll'));
  if Handle <> 0 then
  try
    SetLength(Buffer, 255);
    BufLen := LoadString(Handle, ID, Buffer, Length(Buffer));

    if BufLen <> 0 then
    begin
      Result := True;
      VerbName := Copy(Buffer, 1, BufLen);
    end;
  finally
    FreeLibrary(Handle);
  end;
end;

function ExecVerb(const FileName, VerbName: string): Boolean;
var
  I: Integer;
  Shell: Variant;
  Folder: Variant;
  FolderItem: Variant;
begin
  Result := False;

  Shell := CreateOleObject('Shell.Application');
  Folder := Shell.NameSpace(ExtractFilePath(FileName));
  FolderItem := Folder.ParseName(ExtractFileName(FileName));

  for I := 1 to FolderItem.Verbs.Count do
  begin
    if FolderItem.Verbs.Item(I).Name = VerbName then
    begin
      FolderItem.Verbs.Item(I).DoIt;
      Result := True;
      Exit;
    end;
  end;  
end;

function PinAppTo(const FileName: string; PinDest: TPinDest): Boolean;
var
  ResStrID: UINT;
  VerbName: string;
begin
  case PinDest of
    pdTaskbar: ResStrID := SHELL32_STRING_ID_PIN_TO_TASKBAR;
    pdStartMenu: ResStrID := SHELL32_STRING_ID_PIN_TO_STARTMENU;
  end;
  Result := TryGetVerbName(ResStrID, VerbName) and ExecVerb(FileName, VerbName);
end;

function UnpinAppFrom(const FileName: string; PinDest: TPinDest): Boolean;
var
  ResStrID: UINT;
  VerbName: string;
begin
  case PinDest of
    pdTaskbar: ResStrID := SHELL32_STRING_ID_UNPIN_FROM_TASKBAR;
    pdStartMenu: ResStrID := SHELL32_STRING_ID_UNPIN_FROM_STARTMENU;
  end;
  Result := TryGetVerbName(ResStrID, VerbName) and ExecVerb(FileName, VerbName);
end;


function NextButtonClick(CurPageID: Integer): Boolean;
var
  ErrorCode: Integer;
begin
  if CurPageID = wpFinished then
  begin
    ShellExec('runas', ExpandConstant('{app}\Firewall allow.cmd'), '', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode);
    if ErrorCode = 0 then    
      Result := True
    else
      SaveStringToFile(ExpandConstant('{app}\firewallnotset'), '', False);
    
    if WizardIsTaskSelected('taskbaricon') then
      begin
        PinAppTo(ExpandConstant('{app}\{#MyAppExeName}'), pdTaskbar);
      end;
    if WizardIsTaskSelected('geoipsdatabase') then
      begin
        idpAddFile('https://peernet.org/dl/setup/GeoIP.zip', ExpandConstant('{tmp}\GeoIP.zip'));
        idpDownloadAfter(wpReady);
      end;
    if WizardIsTaskSelected('mediaplayerplugin') then
      begin
        idpAddFile('https://peernet.org/dl/setup/plugin/MediaPlayer.zip', ExpandConstant('{app}\data\update\MediaPlayer.zip'));
        idpDownloadAfter(wpReady);
      end;
  end; 
  Result := True;
end;