@echo off
title Servidor de Animacion por Cursor
cd /d "%~dp0"
echo ========================================================
echo   Iniciando Visor de Animacion por Cursor...
echo ========================================================

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0servidor.ps1"
if %ERRORLEVEL% equ 0 goto end

echo Abriendo directamente en el navegador...
start "" "%~dp0index.html"

:end
