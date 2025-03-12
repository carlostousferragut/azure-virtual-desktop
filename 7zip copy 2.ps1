# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits MSI)
$installerUrl = "https://www.7-zip.org/a/7z2409-x64.msi"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\7zip.msi"

# Descargar el instalador
Write-Host "Descargando instalador de 7-Zip..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando 7-Zip..."
Start-Process "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



