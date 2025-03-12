# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://github.com/git-for-windows/git/releases/download/v2.48.1.windows.1/Git-2.48.1-64-bit.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\Git-2.48.1-64-bit.exe"

# Descargar el instalador
Write-Host "Descargando instalador de Git..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Git..."
Start-Process -FilePath $installerPath -ArgumentList "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
