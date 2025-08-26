# 📡 Sport RSS Integráció és Automatikus Adatfolyam

## 🎯 **Cél: TippmixPro Szelvény Pontosság Növelése**

Ez a rendszer valós sportadatok alapján AI-elemzéssel növeli a TippmixPro szelvények találati pontosságát.

## 🏗️ **Rendszer Architektúra**

```
Sport RSS Feeds → Zapier → Google Sheets → Claude AI → Elemző Program → TippmixPro
```

## 📡 **Sport RSS Feed Beállítása**

### **🏈 Futball (Football/Soccer) RSS Feedek:**

1. **ESPN Soccer:**
   - `https://www.espn.com/espn/rss/soccer/news`

2. **BBC Football:**
   - `https://feeds.bbci.co.uk/sport/football/rss.xml`

3. **Sky Sports Football:**
   - `https://www.skysports.com/rss/0,20514,11661,00.xml`

4. **UEFA Champions League:**
   - `https://www.uefa.com/rssfeed/news/rss.xml`

5. **FIFA News:**
   - `https://www.fifa.com/rss/news.xml`

### **🏀 Kosárlabda (Basketball) RSS Feedek:**

1. **ESPN NBA:**
   - `https://www.espn.com/espn/rss/nba/news`

2. **NBA Official:**
   - `https://www.nba.com/rss/news.xml`

3. **EuroLeague:**
   - `https://www.euroleague.net/rss/news.xml`

4. **FIBA Basketball:**
   - `https://www.fiba.basketball/rss/news.xml`

### **🎾 Tenisz (Tennis) RSS Feedek:**

1. **ESPN Tennis:**
   - `https://www.espn.com/espn/rss/tennis/news`

2. **ATP Tour:**
   - `https://www.atptour.com/rss/news.xml`

3. **WTA Tennis:**
   - `https://www.wtatennis.com/rss/news.xml`

### **🏒 Jégkorong (Ice Hockey) RSS Feedek:**

1. **ESPN NHL:**
   - `https://www.espn.com/espn/rss/nhl/news`

2. **NHL Official:**
   - `https://www.nhl.com/rss/news.xml`

### **🌍 Általános Sport RSS Feedek:**

1. **BBC Sports:**
   - `https://feeds.bbci.co.uk/sport/rss.xml`

2. **Sky Sports General:**
   - `https://www.skysports.com/rss/0,20514,11661,00.xml`

### **RSS Feed Beállítás Lépései:**

1. **RSS Feed típus kiválasztása** a dropdown menüből
2. **Vagy egyéni RSS URL** megadása
3. **RSS Beállítás gombra** kattintás
4. **Státusz ellenőrzése:**
   - ✅ Zöld: Sikeres csatlakozás
   - ❌ Piros: Hiba

## ⚡ **Automatikus Adatfolyam**

### **1. Sport RSS Beolvasás**
- **Funkció:** Valós sportadatok automatikus betöltése
- **Frekvencia:** Manuális vagy automatikus (Zapier)
- **Adatok:** Mérkőzések, eredmények, statisztikák
- **Sportágak:** Futball, Kosárlabda, Tenisz, Jégkorong

### **2. Google Sheets Integráció**
- **Cél:** Adatok strukturált tárolása
- **Formátum:** CSV/JSON
- **Oszlopok:** Dátum, Csapatok, Eredmény, Statisztikák, Sportág

### **3. Claude AI Elemzés**
- **Input:** Google Sheets adatok
- **Output:** Strukturált elemzés
- **Formátum:** JSON
- **Tartalom:** Kockázat, Bizalmi szint, Elemzés

### **4. Webhook Küldés**
- **Cél:** Elemzés eredményeinek továbbítása
- **Formátum:** JSON POST
- **Fogadó:** TippmixPro vagy más rendszer

## 🔧 **Technikai Implementáció**

### **Sport RSS Beolvasás:**
```javascript
async function fetchSportRSS() {
    const proxyUrl = 'https://api.allorigins.win/raw?url=';
    const rssUrl = integrations.sportRSS.rssUrl;
    const rssType = integrations.sportRSS.rssType;
    const response = await fetch(proxyUrl + encodeURIComponent(rssUrl));
    
    const xmlText = await response.text();
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(xmlText, 'text/xml');
    
    const items = xmlDoc.querySelectorAll('item');
    // Adatok feldolgozása...
}
```

### **Sportág Felismerés:**
```javascript
function detectSportType(title, description, rssType) {
    const text = (title + ' ' + description).toLowerCase();
    
    if (text.includes('football') || text.includes('soccer') || rssType.includes('soccer')) {
        return 'football';
    } else if (text.includes('basketball') || rssType.includes('basketball')) {
        return 'basketball';
    } else if (text.includes('tennis') || rssType.includes('tennis')) {
        return 'tennis';
    } else if (text.includes('hockey') || rssType.includes('hockey')) {
        return 'hockey';
    }
    
    return 'unknown';
}
```

### **Automatikus Folyam:**
```javascript
async function startAutomatedFlow() {
    // 1. Sport RSS beolvasás
    const sportsData = await fetchSportRSS();
    
    // 2. Google Sheets mentés
    if (integrations.sheets.active) {
        // Sheets API hívás
    }
    
    // 3. Claude AI elemzés
    if (integrations.claude.active) {
        // Claude API hívás
    }
    
    // 4. Webhook küldés
    if (integrations.webhook.active) {
        // Webhook POST
    }
}
```

## 📊 **Adatstruktúra**

### **Sport RSS Adatok:**
```json
{
    "title": "Manchester United vs Liverpool",
    "description": "Premier League match details...",
    "pubDate": "2024-01-15T20:00:00Z",
    "source": "ESPN_SOCCER",
    "sportType": "football"
}
```

### **Claude AI Elemzés:**
```json
{
    "event": "Manchester United vs Liverpool",
    "sportType": "football",
    "outcomes": [
        {
            "name": "1X2 - Hazai Győzelem",
            "risk": "low",
            "confidence": 75,
            "analysis": "Hazai pálya előny...",
            "stats": "Hazai forma: 8/10..."
        }
    ]
}
```

## 🏒 **Jégkorong Elemzés**

### **Alap Kimenetelek:**
- **Hazai Győzelem** (65% bizalmi szint)
- **Vendég Győzelem** (50% bizalmi szint)

### **Gól Kimenetelek:**
- **Összes gól - 5.5 felett** (60% bizalmi szint)
- **Összes gól - 3.5 alatt** (35% bizalmi szint)

### **Periódus Kimenetelek:**
- **1. periódus - Hazai győzelem** (55% bizalmi szint)
- **1. periódus - Döntetlen** (70% bizalmi szint)

### **🔥 Extrém Kimenetelek:**
- **Döntetlen (hosszabbítás)** (15% bizalmi szint)
- **Vendég győzelem + 3+ gól** (20% bizalmi szint)
- **0-0 döntetlen** (8% bizalmi szint)

## 🚀 **Használat**

### **1. Kezdeti Beállítás:**
1. Sport RSS feed típus kiválasztása
2. Google Sheets ID beállítása
3. Claude MCP URL konfigurálása
4. Zapier webhook generálása

### **2. Automatikus Folyam Indítása:**
1. "📡 Sport RSS Automatikus Folyam" gombra kattintás
2. Adatok automatikus betöltése
3. AI elemzés futtatása
4. Eredmények megjelenítése

### **3. Eredmények Értelmezése:**
- **Alacsony kockázat:** Biztos tippek
- **Közepes kockázat:** Mérsékelt tippek
- **Magas kockázat:** Kockázatos tippek
- **Extrém kockázat:** Ritka, de értékes tippek

## 🔍 **Hibaelhárítás**

### **Sport RSS Hiba:**
- **Probléma:** CORS hiba
- **Megoldás:** CORS proxy használata
- **Proxy:** `https://api.allorigins.win/raw?url=`

### **Google Sheets Hiba:**
- **Probléma:** API kulcs hiányzik
- **Megoldás:** Google Sheets API kulcs beállítása
- **Engedélyek:** Olvasás/Írás

### **Claude AI Hiba:**
- **Probléma:** MCP kapcsolat megszakadt
- **Megoldás:** MCP URL újrakonfigurálása
- **Teszt:** "🤖 Claude Elemzés Teszt" gomb

## 📈 **Teljesítmény Optimalizálás**

### **Adatfrissítés:**
- **Frekvencia:** 15 percenként
- **Szűrés:** Csak releváns mérkőzések
- **Cache:** Lokális tárolás

### **AI Elemzés:**
- **Batch feldolgozás:** Több mérkőzés egyszerre
- **Prioritás:** Fontos mérkőzések előre
- **Cache:** Elemzés eredmények tárolása

## 🎯 **TippmixPro Integráció**

### **Eredmények Exportálása:**
1. **Formátum:** CSV/JSON
2. **Oszlopok:** Mérkőzés, Sportág, Tipp, Kockázat, Bizalmi szint
3. **Rendezés:** Bizalmi szint szerint

### **Automatikus Tippelés:**
- **Algoritmus:** Bizalmi szint alapú
- **Kockázat:** Kockázati szint szerint
- **Portfólió:** Diversifikált tippek

## 🔮 **Jövőbeli Fejlesztések**

1. **Több adatforrás:** Marca, L'Equipe, Sport Bild
2. **Machine Learning:** Tippelési algoritmus fejlesztése
3. **Real-time:** Valós idejű adatok
4. **Mobil app:** iOS/Android alkalmazás
5. **API:** Nyilvános API szolgáltatás

---

**🎯 Cél: A TippmixPro szelvények találati pontosságának növelése valós sportadatok és AI elemzés alapján!**

**🏈🏀🎾🏒 Négy sportág támogatása: Futball, Kosárlabda, Tenisz, Jégkorong!**