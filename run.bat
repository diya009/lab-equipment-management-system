@echo off
title College Lab Equipment Management System
cd /d "%~dp0"

where javac >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Java JDK not found. Install JDK 8 or newer and add it to PATH.
    pause
    exit /b 1
)

echo Compiling source code...
if exist out rmdir /s /q out
mkdir out
dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -cp "lib\*" -d out @sources.txt
if errorlevel 1 (
    del sources.txt
    echo [ERROR] Compilation failed.
    pause
    exit /b 1
)
del sources.txt

echo Starting application...
java -cp "out;lib\*" com.lab.Main
if errorlevel 1 pause
