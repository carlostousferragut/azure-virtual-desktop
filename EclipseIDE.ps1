# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2024-12/R/eclipse-jee-2024-12-R-win32-x86_64.zip"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\eclipse-jee-2024-12-R-win32-x86_64.zip"
$installPath = "C:\Program Files\Eclipse"

# Descargar el instalador
Write-Host "Descargando instalador de Eclipse IDE..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Descomprimiendo Eclipse IDE..."
Expand-Archive -Path $installerPath -DestinationPath $installPath -Force

# Crear acceso directo para todos
$wshell = New-Object -ComObject WScript.Shell
$shortcut = $wshell.CreateShortcut("C:\Users\Public\Desktop\Eclipse IDE.lnk")
$shortcut.TargetPath = "$installPath\eclipse.exe"
$shortcut.Save()

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."


