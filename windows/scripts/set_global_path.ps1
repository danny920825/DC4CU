#Add Services to Path
$ssh="`"c:\Program Files\OpenSSH-Win64`"" 
$git="`" C:\Program Files\Git\bin`"" 

echo "`$git=$($git)"> $PSHOME\Microsoft.PowerShell_profile.ps1
echo "`$ssh=$($ssh)">> $PSHOME\Microsoft.PowerShell_profile.ps1
echo "`$env:Path = ((`$env:PATH) + ';' + `$git + ';' + `$ssh)">> $PSHOME\Microsoft.PowerShell_profile.ps1
