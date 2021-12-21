netsh advfirewall firewall add rule name="Peernet Browser" dir=in program="%~dp0\Backend.exe" profile=any action=allow
