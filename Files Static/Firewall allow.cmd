netsh advfirewall firewall add rule name="Peernet Browser" dir=in program="%~dp0Backend.exe" profile=any action=allow
