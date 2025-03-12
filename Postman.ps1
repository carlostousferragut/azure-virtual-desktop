# Crear carpeta temporal si no existe
$destinationFolder = "C:\Temp"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Descargar el instalador de Postman
$installerUrl = "https://dl.pstmn.io/download/latest/win64"
$installerPath = "$destinationFolder\Postman-win64-setup.exe"

# Descargar el instalador
Write-Host "Descargando instalador de Postman..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Ejecutar el instalador (instalación típica)
Write-Host "Instalando Postman..."
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait

# Crear carpeta temporal si no existe
$destinationFolder = "C:\Program Files\Postman"
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Ruta dinámica al directorio del usuario actual
$userProfile = [System.Environment]::GetEnvironmentVariable("USERPROFILE")
$sourceFolder = "$userProfile\AppData\Local\Postman"

# Comprobar si la ruta de origen existe
if (Test-Path $sourceFolder) {
    # Copiar los archivos a la carpeta de destino
    Write-Host "Copiando los archivos de Postman a $destinationFolder..."
    Copy-Item -Path "$sourceFolder\*" -Destination $destinationFolder -Recurse -Force

    Write-Host "Postman copiado correctamente."
} else {
    Write-Host "No se encontró la carpeta de instalación de Postman en $sourceFolder. Asegúrate de que esté instalado correctamente."
}

# Crear acceso directo para todos
$wshell = New-Object -ComObject WScript.Shell
$shortcut = $wshell.CreateShortcut("C:\Users\Public\Desktop\Postman.lnk")
$shortcut.TargetPath = "$destinationFolder\postman.exe"
$shortcut.Save()