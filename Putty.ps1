# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.77-installer.msi"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\putty-64bit-0.77-installer.msi"

# Descargar el instalador
Write-Host "Descargando instalador de Putty..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Putty..."
Start-Process "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
