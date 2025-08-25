#!/usr/bin/env python3
"""
🏆 Sportstatisztikai Program Szerver Indító
Egyszerű Python szerver a weboldal futtatásához
"""

import http.server
import socketserver
import webbrowser
import os
import sys
from pathlib import Path

def start_server(port=8000, auto_open=True):
    """Szerver indítása a megadott porton"""
    
    # Ellenőrizzük, hogy az index.html létezik-e
    if not Path("index.html").exists():
        print("❌ Hiba: index.html fájl nem található!")
        print("💡 Győződj meg róla, hogy a program mappájában vagy!")
        return False
    
    # Könyvtár beállítása
    os.chdir(Path(__file__).parent)
    
    # Szerver konfiguráció
    Handler = http.server.SimpleHTTPRequestHandler
    
    try:
        with socketserver.TCPServer(("", port), Handler) as httpd:
            print(f"🚀 Sportstatisztikai Program szerver elindítva!")
            print(f"🌐 Weboldal címe: http://localhost:{port}")
            print(f"📱 Mobil elérés: http://[IP-cím]:{port}")
            print(f"⏹️  Leállításhoz: Ctrl+C")
            print("-" * 50)
            
            # Automatikus böngésző megnyitás
            if auto_open:
                webbrowser.open(f"http://localhost:{port}")
                print("✅ Böngésző automatikusan megnyitva!")
            
            # Szerver futtatása
            httpd.serve_forever()
            
    except OSError as e:
        if "Address already in use" in str(e):
            print(f"❌ Hiba: A {port} port már használatban van!")
            print(f"💡 Próbáld meg a {port + 1} portot!")
            return start_server(port + 1, auto_open)
        else:
            print(f"❌ Szerver hiba: {e}")
            return False
    except KeyboardInterrupt:
        print("\n🛑 Szerver leállítva!")
        return True

def main():
    """Fő program"""
    print("🏆 Prémium Sportstatisztikai Elemző Pro")
    print("=" * 50)
    
    # Parancssori argumentumok kezelése
    port = 8000
    auto_open = True
    
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("❌ Érvénytelen port szám!")
            return
    
    if len(sys.argv) > 2 and sys.argv[2] == "--no-browser":
        auto_open = False
    
    # Szerver indítása
    start_server(port, auto_open)

if __name__ == "__main__":
    main()