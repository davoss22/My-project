#!/bin/bash

# 🏆 Sportstatisztikai Program Indító Script

echo "🏆 Prémium Sportstatisztikai Elemző Pro"
echo "================================================"
echo

# Ellenőrizzük, hogy Python telepítve van-e
if ! command -v python3 &> /dev/null; then
    echo "❌ Hiba: Python3 nincs telepítve!"
    echo "💡 Telepítsd: sudo apt install python3 (Ubuntu/Debian)"
    echo "💡 Vagy: brew install python3 (macOS)"
    exit 1
fi

# Ellenőrizzük, hogy az index.html létezik-e
if [ ! -f "index.html" ]; then
    echo "❌ Hiba: index.html fájl nem található!"
    echo "💡 Győződj meg róla, hogy a program mappájában vagy!"
    exit 1
fi

echo "🚀 Szerver indítása..."
echo "🌐 Weboldal: http://localhost:8000"
echo "📱 Mobil: http://[IP-cím]:8000"
echo "⏹️  Leállítás: Ctrl+C"
echo

# Szerver indítása
python3 -m http.server 8000

echo
echo "🛑 Szerver leállítva!"