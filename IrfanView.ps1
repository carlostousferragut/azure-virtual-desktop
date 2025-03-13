# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits MSI)
$installerUrl = "https://files02.tchspt.com/storage2/temp/iview460_x64_setup.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\iview460_x64_setup.exe"

# Descargar el instalador
Write-Host "Descargando instalador de IrfanView..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando IrfanView..."
Start-Process -FilePath $installerPath -ArgumentList "/silent /desktop=1 /group=1 /allusers=1" -Wait

# Falta copiar el fichero de licencia del repo

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
