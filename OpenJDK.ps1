# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits MSI)
$installerUrl = "https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u442-b06/openlogic-openjdk-8u442-b06-windows-x64.msi"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\openlogic-openjdk-8u442-b06-windows-x64.msi"

# Descargar el instalador
Write-Host "Descargando instalador de OpenJDK..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando OpenJDK..."
Start-Process "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



