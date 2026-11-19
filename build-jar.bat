@echo off
REM Builds a single runnable LabEquipmentSystem.jar (H2 database bundled inside).
cd /d "%~dp0"

echo Compiling...
if exist out rmdir /s /q out
mkdir out
dir /s /b src\*.java > sources.txt
javac -encoding UTF-8 -cp "lib\*" -d out @sources.txt
if errorlevel 1 ( del sources.txt & echo Compilation failed. & pause & exit /b 1 )
del sources.txt

echo Bundling H2 driver...
pushd out
jar xf ..\lib\h2-2.2.224.jar
if exist META-INF\MANIFEST.MF del META-INF\MANIFEST.MF
popd

echo Main-Class: com.lab.Main> manifest.txt
jar cfm LabEquipmentSystem.jar manifest.txt -C out .
del manifest.txt

echo.
echo Done: LabEquipmentSystem.jar created.
echo Run it with:  java -jar LabEquipmentSystem.jar   (keep db.properties in the same folder)
pause
