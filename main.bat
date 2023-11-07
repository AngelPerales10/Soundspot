@echo off
:menu
cls
echo Select an option:
echo 1. Launch
echo ---
echo ### Remember to sign in and use this command to start your Docker Container wherever it's located:
echo sudo docker-compose up -d
echo ### To check if it's running, use this command: 
echo sudo docker container ls -a
echo ---
echo 2. Kill
echo 3. Scrape
echo 4. Transfer
echo 5. Archieve
echo 6. Open Web Navigation
set /p choice="Enter the option number (1-6): "

if "%choice%"=="1" (
    call _scripts\launchserver.bat
) else if "%choice%"=="2" (
    call _scripts\killserver.bat
) else if "%choice%"=="3" (
    call python _scripts\scrapelikes.py
) else if "%choice%"=="4" (
    call _scripts\sshtransfer.bat
) else if "%choice%"=="5" (
    call python _scripts\archieve.py
) else if "%choice%"=="6" (
    call _scripts\webnav.ps1
) else (
    echo Invalid choice. Please enter a number between 1 and 5.
    pause
    goto menu
)
