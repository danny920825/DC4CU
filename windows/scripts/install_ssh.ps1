#Set SSL Channel
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

#Download the last version from Github (check URL https://github.com/PowerShell/Win32-OpenSSH/releases) para updates
Invoke-WebRequest https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip -OutFile openssh.zip

#Extract file in Program Files
Expand-Archive .\openssh.zip 'C:\Program Files\'

#Entrar a la carpeta
cd 'c:\Program Files\OpenSSH-Win64'

#install SSH Service using PowerShell script provided for that
.\install-sshd.ps1

#Firewall Rules
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

#Start SSH Server Service
Start-Service sshd 





