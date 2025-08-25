# 🌐 Weboldal Közzétételi Útmutató

## 🚀 Gyors Közzététel Opciók

### 1. **GitHub Pages (INGYENES)**
```bash
# GitHub repository létrehozása
git init
git add .
git commit -m "Sportstatisztikai program"
git branch -M main
git remote add origin https://github.com/[felhasznalonev]/sport-stats.git
git push -u origin main

# GitHub Pages beállítása:
# 1. Repository Settings
# 2. Pages
# 3. Source: Deploy from a branch
# 4. Branch: main
# 5. Save
```

**Weboldal címe:** `https://[felhasznalonev].github.io/sport-stats/`

### 2. **Netlify (INGYENES)**
```bash
# Netlify CLI telepítése
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=.
```

### 3. **Vercel (INGYENES)**
```bash
# Vercel CLI telepítése
npm install -g vercel

# Deploy
vercel --prod
```

### 4. **Firebase Hosting (INGYENES)**
```bash
# Firebase CLI telepítése
npm install -g firebase-tools

# Bejelentkezés
firebase login

# Projekt inicializálása
firebase init hosting

# Deploy
firebase deploy
```

## 📱 Mobil Elérés

Minden platform után a weboldal elérhető lesz:
- **iPhone Safari:** `https://your-domain.com`
- **Android Chrome:** `https://your-domain.com`
- **Minden böngésző:** `https://your-domain.com`

## 🎯 Ajánlott: GitHub Pages

**Legkönnyebb és legmegbízhatóbb:**

1. **GitHub fiók létrehozása** (ha nincs)
2. **Új repository** létrehozása
3. **Fájlok feltöltése**
4. **GitHub Pages aktiválása**
5. **Kész!** 🎉

## 🔧 Részletes GitHub Pages Útmutató

### 1. **Repository létrehozása:**
- Menj a GitHub.com-ra
- Kattints a "+" → "New repository"
- Név: `sport-stats`
- Public repository
- "Create repository"

### 2. **Fájlok feltöltése:**
```bash
git add index.html
git add README.md
git commit -m "Sportstatisztikai program hozzáadva"
git push
```

### 3. **GitHub Pages beállítása:**
- Repository → Settings
- Bal oldali menü: "Pages"
- Source: "Deploy from a branch"
- Branch: "main"
- Save

### 4. **Weboldal elérhető:**
`https://[felhasznalonev].github.io/sport-stats/`

## 🌍 Egyéb Opciók

### **Surge.sh (INGYENES)**
```bash
npm install -g surge
surge
```

### **Heroku (INGYENES)**
```bash
# Heroku CLI telepítése
# Fájlok feltöltése
# Automatikus deploy
```

## 📞 Segítség

Ha segítségre van szükséged:
1. **GitHub Pages:** Legkönnyebb
2. **Netlify:** Leggyorsabb
3. **Vercel:** Legmodernebb

**🏆 Minden platform ingyenes és mobilbarát!** 🌐📱