# get latest download url for git-for-windows 64-bit exe
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
$git_url = "https://api.github.com/repos/git-for-windows/git/releases/latest"
$asset = Invoke-RestMethod -Method Get -Uri $git_url | % assets | where name -like "*64-bit.exe"
# download installer
$installer = "$env:temp\$($asset.name)"
Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $installer
# run installer
$git_install_inf = "install.inf"
$install_args = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LOADINF=""$git_install_inf"""
Start-Process -FilePath $installer -ArgumentList $install_args -Wait
#Agregar git al Path
$git='C:\Program Files\Git\bin'
$env:Path = ($arrPath + $git) -join ';'
