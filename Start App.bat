@echo off
title College Lab Equipment Management System
cd /d "%~dp0"

where java >nul 2>nul
if errorlevel 1 (
    echo.
    echo [!] Java is not installed on this computer.
    echo.
    echo Please install Java first:
    echo   1. Open https://adoptium.net/ in your browser
    echo   2. Click the big blue "Latest LTS Release" button to download
    echo   3. Run the installer. On the "Custom Setup" screen, set
    echo      "Add to PATH" and "Set JAVA_HOME variable" to be installed.
    echo   4. Restart your computer, then double-click this file again.
    echo.
    pause
    exit /b 1
)

java -jar LabEquipmentSystem.jar
if errorlevel 1 pause
