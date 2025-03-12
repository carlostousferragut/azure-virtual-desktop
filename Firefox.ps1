# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits MSI)
$installerUrl = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/106.0.4/win32/en-US/Firefox%20Setup%20106.0.4.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\FirefoxSetup106.0.4.exe"

# Descargar el instalador
Write-Host "Descargando instalador de Firefox..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Firefox..."
Start-Process -FilePath $installerPath -ArgumentList "/S /PreventRebootRequired=true" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
