
function mostrarMenu 
{ 
     param ( 
           [string]$Titulo = 'AD4CU: Domain Controller 4 Cuba' 
     ) 
     cls 
     Write-Host "=================================" -ForegroundColor Green
     Write-Host "|$Titulo|" -ForegroundColor Green
     Write-Host "=================================" -ForegroundColor Green
      
     

     Write-Host "1) Crear Archivo de Variables" -ForegroundColor Green
     Write-Host "2) Instalar Controlador de Dominio" -ForegroundColor Green
     Write-Host "3) Establecer zona inversa en el DNS" -ForegroundColor Green
     Write-Host "4) Opciones Extras" -ForegroundColor Green
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
          '1'{ 
                cls 
                ./scripts/copy_conf_file.ps1
                pause 
          }'2' { 
               cls 
               ./scripts/install_dc.ps1
          }'3' { 
               cls 
               ./scripts/setup_reverse_zone.ps1
          }'4' { 
               cls 
               ./scripts/extras.ps1
          } 's' { 
                return 
           }  
     } 
      
} 
until ($input -eq 's')
