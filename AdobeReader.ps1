# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2500120432/AcroRdrDC2500120432_es_ES.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\AcroRdrDC2500120432_es_ES.exe"

# Descargar el instalador
Write-Host "Descargando instalador de Adobe Reader..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Adobe Reader..."
Start-Process -FilePath $installerPath -ArgumentList "/sAll /msi /norestart /quiet" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."
