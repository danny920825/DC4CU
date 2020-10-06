function mostrarMenu 
{ 
    param ( 
           [string]$Titulo = 'AD4CU: Extras: Scripts de automatizacion' 
    ) 
    cls 
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "|$Titulo|" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
      
     

    Write-Host "1) Instalar Git para Windows" -ForegroundColor Green
    Write-Host "2) Instalar SSh"  -ForegroundColor Green
    Write-Host "3) Agregar git y ssh al PATH Global" -ForegroundColor Green
    Write-Host "4) Powershell Consola por Defecto" -ForegroundColor Green
}





do 
{ 
    mostrarMenu 
	Write-Host "Selecciona una Opcion o" -ForegroundColor Green -NoNewline
	Write-Host " [0] " -ForegroundColor Yellow -NoNewline
	Write-Host "para regresar al menu anterior: " -ForegroundColor Green -NoNewline
	$input = Read-Host 

    switch ($input) 
     { 
           '1' { 
                cls 
                Write-Host "Instalando Git para Windows" -ForegroundColor Yellow
                ./scripts/extras/install_git.ps1
                Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
                pause 
           } '2' { 
                cls 
                Write-Host "Instalando OpenSSH para Windows" -ForegroundColor Yellow
                ./scripts/extras/install_ssh.ps1
                Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
                pause 
 
           } '3' { 
                cls 
                ./scripts/extras/set_global_path.ps1
                Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
                pause 
           }'4' { 
            cls 
            ./scripts/extras/set_powershell_default.ps1
            Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
            pause 
       } '0' { 
                return 
           }  
     }  
} 
until ($input -eq '0')
