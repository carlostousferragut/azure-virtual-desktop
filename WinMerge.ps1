# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://github.com/WinMerge/winmerge/releases/download/v2.16.20/WinMerge-2.16.20-x64-Setup.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\WinMerge-2.16.20-x64-Setup.exe"

# Descargar el instalador
Write-Host "Descargando instalador de WinMerge ..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando WinMerge..."
Start-Process -FilePath $installerPath -ArgumentList "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
