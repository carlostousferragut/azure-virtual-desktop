# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\googlechromestandaloneenterprise64.msi"

# Descargar el instalador
Write-Host "Descargando instalador de Google Chrome..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Google Chrome..."
Start-Process "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



