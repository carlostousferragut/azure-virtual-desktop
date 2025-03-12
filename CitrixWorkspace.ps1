# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador (versión 64 bits Exe)
$installerUrl = "
https://downloadplugins.citrix.com/Windows/CitrixWorkspaceApp.exe"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\CitrixWorkspaceApp.exe"

# Descargar el instalador
Write-Host "Descargando instalador de Citrix Workspace..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Instalando Citrix Workspace..."
Start-Process -FilePath $installerPath -ArgumentList "/silent /norestart /AutoUpdateCheck=disabled" -Wait

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



