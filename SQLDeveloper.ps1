# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# URL oficial del instalador
$installerUrl = "https://download.oracle.com/otn_software/java/sqldeveloper/sqldeveloper-24.3.1.347.1826-no-jre.zip"  # Puedes cambiarlo si hay nueva versión

# Ruta destino del instalador
$installerPath = "$destinationFolder\sqldeveloper-24.3.1.347.1826-no-jre.zip"
$installPath = "C:\Program Files\SQLDeveloper"

# Descargar el instalador
Write-Host "Descargando instalador de SQL Developer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar silenciosamente
Write-Host "Descomprimiendo SQL Developer..."
Expand-Archive -Path $installerPath -DestinationPath $installPath -Force

# Crear acceso directo para todos
$wshell = New-Object -ComObject WScript.Shell
$shortcut = $wshell.CreateShortcut("C:\Users\Public\Desktop\SQL Developer.lnk")
$shortcut.TargetPath = "$installPath\SQLDeveloper\sqldeveloper.exe"
$shortcut.Save()

# Limpiar
Remove-Item $installerPath -Force
Write-Host "Instalación completada."



