# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador 
$installerUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.3/npp.8.4.3.Installer.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\npp.8.4.3.Installer.exe"

# Descargar el instalador
Write-Host "Descargando instalador de NPP..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando NPP..."
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



