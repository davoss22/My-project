#!/bin/bash

echo "🏆 Sportstatisztikai Program Közzététel"
echo "========================================"
echo

echo "Válassz egy opciót:"
echo "1. GitHub Pages (INGYENES)"
echo "2. Netlify (INGYENES)"
echo "3. Vercel (INGYENES)"
echo "4. Surge.sh (INGYENES)"
echo "5. Firebase (INGYENES)"
echo

read -p "Válaszd ki a számot (1-5): " choice

case $choice in
    1)
        echo "🚀 GitHub Pages közzététel..."
        echo "1. Menj a GitHub.com-ra"
        echo "2. Hozz létre egy új repository-t: sport-stats"
        echo "3. Futtasd ezeket a parancsokat:"
        echo
        echo "git init"
        echo "git add ."
        echo "git commit -m 'Sportstatisztikai program'"
        echo "git branch -M main"
        echo "git remote add origin https://github.com/[felhasznalonev]/sport-stats.git"
        echo "git push -u origin main"
        echo
        echo "4. Repository Settings → Pages → Deploy from branch → main"
        echo "5. Weboldal: https://[felhasznalonev].github.io/sport-stats/"
        ;;
    2)
        echo "🚀 Netlify közzététel..."
        if command -v netlify &> /dev/null; then
            netlify deploy --prod --dir=.
        else
            echo "Netlify CLI telepítése: npm install -g netlify-cli"
            echo "Majd futtasd: netlify deploy --prod --dir=."
        fi
        ;;
    3)
        echo "🚀 Vercel közzététel..."
        if command -v vercel &> /dev/null; then
            vercel --prod
        else
            echo "Vercel CLI telepítése: npm install -g vercel"
            echo "Majd futtasd: vercel --prod"
        fi
        ;;
    4)
        echo "🚀 Surge.sh közzététel..."
        if command -v surge &> /dev/null; then
            surge
        else
            echo "Surge CLI telepítése: npm install -g surge"
            echo "Majd futtasd: surge"
        fi
        ;;
    5)
        echo "🚀 Firebase közzététel..."
        if command -v firebase &> /dev/null; then
            firebase login
            firebase init hosting
            firebase deploy
        else
            echo "Firebase CLI telepítése: npm install -g firebase-tools"
            echo "Majd futtasd: firebase login && firebase init hosting && firebase deploy"
        fi
        ;;
    *)
        echo "❌ Érvénytelen választás!"
        ;;
esac

echo
echo "✅ Közzététel befejezve!"
echo "📱 A weboldal most elérhető iPhone Safari-ban is!"