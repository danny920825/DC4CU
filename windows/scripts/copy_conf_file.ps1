if (Test-Path "C:\DC4CU") {
    Write-Host "La carpeta de Configuracion existe." -ForegroundColor Yellow
    Write-Host "Copiando archivo de configuracion para C:\DC4CU" -ForegroundColor Yellow
    cp "dc4cu.ini" "c:\DC4CU\" 
}
else{
    Write-Host "Creando carpeta de configuracion: 'c:\DC4CU'" -ForegroundColor Yellow
    mkdir "c:\DC4CU"
    Write-Host "Copiando archivo de configuracion para C:\DC4CU" -ForegroundColor Yellow
    cp "dc4cu.ini" "c:\DC4CU\" 
}

Write-Host "Listo. Estas son las opciones por defecto:" -ForegroundColor Yellow
Get-Content 'c:\DC4CU\dc4cu.ini' | ForEach-Object {
    if($_ -match $regex){
        Write-Host $_ -ForegroundColor Red
    }
}