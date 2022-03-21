cd ..\Backend

go build -trimpath -ldflags "-H=windowsgui -s"

cd..
cd Browser
SET DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet publish -c Release --no-self-contained

cd..
cd BrowserPlugins
dotnet publish -c Release --no-self-contained

PAUSE
