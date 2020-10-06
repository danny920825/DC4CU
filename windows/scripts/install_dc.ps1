$Path = "c:\DC4CU\dc4cu.ini"
$values = Get-Content $Path | Out-String | ConvertFrom-StringData
$User = $values.User
$SPWord = ConvertTo-SecureString -String $values.SafeModeAdministratorPassword -AsPlainText -Force


$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = $values.DomainName
    DomainNetbiosName = $values.NetBiosName
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $SPWord
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Confirm
Install-ADDSForest @Params
Write-Host "Listo. Es necesario Reiniciar el servidor. Presione [Y|y] para Reiniciar" -ForegroundColor Green
$input = Read-Host
shutdown -r -t 00


