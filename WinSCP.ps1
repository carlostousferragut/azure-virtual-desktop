# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits MSI)
$installerUrl = "https://winscp.net/download/WinSCP-6.3.7-Setup.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\WinSCP-6.3.7-Setup.exe"

# Descargar el instalador
Write-Host "Descargando instalador de WinSCP..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando WinSCP..."
Start-Process -FilePath $installerPath -ArgumentList "/SP- /VERYSILENT /SUPPRESSMSGBOXES /ALLUSERS /NORESTART" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



