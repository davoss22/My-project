@echo off
chcp 65001 >nul
title 🏆 Sportstatisztikai Program

echo.
echo 🏆 Prémium Sportstatisztikai Elemző Pro
echo ================================================
echo.

REM Ellenőrizzük, hogy Python telepítve van-e
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Hiba: Python nincs telepítve!
    echo 💡 Töltsd le innen: https://python.org
    pause
    exit /b 1
)

REM Ellenőrizzük, hogy az index.html létezik-e
if not exist "index.html" (
    echo ❌ Hiba: index.html fájl nem található!
    echo 💡 Győződj meg róla, hogy a program mappájában vagy!
    pause
    exit /b 1
)

echo 🚀 Szerver indítása...
echo 🌐 Weboldal: http://localhost:8000
echo 📱 Mobil: http://[IP-cím]:8000
echo ⏹️  Leállítás: Ctrl+C
echo.

REM Szerver indítása
python -m http.server 8000

echo.
echo 🛑 Szerver leállítva!
pause