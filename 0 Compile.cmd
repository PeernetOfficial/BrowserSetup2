cd ..\Backend

go build -trimpath -ldflags "-H=windowsgui -s"

cd..
cd Browser
dotnet publish -c Release --no-self-contained

PAUSE
