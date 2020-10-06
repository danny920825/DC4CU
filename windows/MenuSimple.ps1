
function mostrarMenu 
{ 
     param ( 
           [string]$Titulo = 'AD4CU: Domain Controller 4 Cuba' 
     ) 
     cls 
     Write-Host "=================================" -ForegroundColor Green
     Write-Host "|$Titulo|" -ForegroundColor Green
     Write-Host "=================================" -ForegroundColor Green
      
     
     Write-Host "1) Instalar Git para Windows" -ForegroundColor Green
     Write-Host "2) Instalar SSh"  -ForegroundColor Green
     Write-Host "3) Agregar git y ssh al PATH Global" -ForegroundColor Green
     Write-Host "4) Crear Archivo de Variables" -ForegroundColor Green
     Write-Host "5) Verificar los requerimientos" -ForegroundColor Green
     Write-Host "6) Instalar Controlador de Dominio" -ForegroundColor Green
     Write-Host "7) Opciones Extras" -ForegroundColor Green
}

do 
{ 
     mostrarMenu 
	Write-Host "Select an option or type" -ForegroundColor Green -NoNewline
	Write-Host " [S|s] " -ForegroundColor Yellow -NoNewline
	Write-Host "to exit: " -ForegroundColor Green -NoNewline
	$input = Read-Host 

    switch ($input) 
     { 
           '1' { 
                cls 
                Write-Host "Instalando Git para Windows" -ForegroundColor Yellow
		./scripts/install_git.ps1
		Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
                pause 
           } '2' { 
                cls 
                Write-Host "Instalando OpenSSH para Windows" -ForegroundColor Yellow
		./scripts/install_ssh.ps1
		Write-Host "Listo. Presione cualquier tecla para regresar al Menu" -ForegroundColor Yellow
                pause 
 
           } '3' { 
                cls 
                'Tercera Opción' 
           } 's' { 
                return 
           }  
     } 
     pause 
} 
until ($input -eq 's')
