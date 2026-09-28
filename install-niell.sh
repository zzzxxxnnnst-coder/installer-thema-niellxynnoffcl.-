#!/bin/bash
# NIELLXYNN OFFICIAL HOSTING - THEME
# Wallpaper: https://files.catbox.moe/p8nw0e.jpg
# WA: 6285602832687
# Dev: @Niellxynn

PANEL="/var/www/pterodactyl"
WALL="https://files.catbox.moe/p8nw0e.jpg"
WA="6285602832687"
WRAPPER="$PANEL/resources/views/layouts/wrapper.blade.php"
LOGIN="$PANEL/resources/views/auth/login.blade.php"

clear
echo "======================================"
echo "  NIELLXYNN OFFICIAL HOSTING"
echo "  Blue Girl Edition"
echo "======================================"
echo "  1. Install Tema Official"
echo "  2. Uninstall / Balikin Original"
echo "  3. Keluar"
echo "======================================"
read -p "Pilih [1-3]: " PILIH

if [ "$PILIH" == "1" ]; then
echo "[1/4] Backup..."
cp $WRAPPER $WRAPPER.bak_neill_$(date +%s)
cp $LOGIN $LOGIN.bak_neill_$(date +%s)

echo "[2/4] Pasang Wallpaper & Watermark..."
cat > /tmp/niell.html <<HTML
<style id="niell-official">
@import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@700&display=swap');
body{background:url('$WALL') center/cover fixed!important}
body::before{content:'';position:fixed;inset:0;background:linear-gradient(180deg,rgba(8,10,15,0.6),rgba(8,10,15,0.93));z-index:-2}
body::after{content:"NIELLXYNN OFFICIAL HOSTING";position:fixed;bottom:30px;left:50%;transform:translateX(-50%);font-weight:800;font-size:36px;letter-spacing:7px;color:rgba(255,255,255,0.045);pointer-events:none;white-space:nowrap;font-family:'Space Grotesk'}
.main-header{background:rgba(12,16,24,0.82)!important;backdrop-filter:blur(22px)!important;border-bottom:1px solid rgba(0,212,255,0.14)!important}
.box,.card{background:rgba(16,21,31,0.82)!important;backdrop-filter:blur(20px)!important;border-radius:20px!important;position:relative;overflow:hidden}
.box::before{content:'';position:absolute;top:0;left:0;width:100%;height:1px;background:linear-gradient(90deg,transparent,#00d4ff,#0066ff,transparent)}
.btn-primary{background:linear-gradient(100deg,#00d4ff,#0066ff)!important;border:none!important;border-radius:12px!important;box-shadow:0 0 22px rgba(0,102,255,0.45)!important}
.footer{display:none!important}
</style>
<script id="niell-pop">document.addEventListener("DOMContentLoaded",()=>{setTimeout(()=>{let p=document.createElement("div");p.innerHTML=`<div style="position:fixed;top:22px;right:22px;z-index:999999;background:rgba(16,21,31,0.92);border-left:3px solid #00d4ff;padding:14px 18px;border-radius:16px;display:flex;gap:12px"><div style="width:38px;height:38px;background:linear-gradient(135deg,#00d4ff,#0066ff);border-radius:11px;display:flex;align-items:center;justify-content:center;color:#fff;font-weight:800">N</div><div><div style="color:#fff;font-weight:700">NIELLXYNN OFFICIAL HOSTING</div><div style="color:#8aa0b8;font-size:11px">Blue Girl Edition Active</div></div></div>`;document.body.appendChild(p);setTimeout(()=>p.remove(),5000)},900)})</script>
HTML

cat > /tmp/login.html <<LOGIN
<style>.login-box{width:440px!important}.login-box .card{background:rgba(16,21,31,0.9)!important;backdrop-filter:blur(26px)!important;border-radius:26px!important;border-top:1px solid rgba(0,212,255,0.35)!important}</style>
<div style="margin-top:20px;text-align:center"><div style="width:58px;height:58px;margin:0 auto;background:linear-gradient(135deg,#00d4ff,#0066ff);border-radius:18px;display:flex;align-items:center;justify-content:center;color:#fff;font-weight:800;font-size:24px">N</div><div style="color:#fff;font-weight:800;letter-spacing:3px">NIELLXYNN</div><div style="color:#00d4ff;font-weight:700;font-size:11px;letter-spacing:4px">OFFICIAL HOSTING</div><div style="margin-top:14px;display:grid;grid-template-columns:1fr 1fr;gap:10px"><div style="background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.06);border-radius:12px;padding:11px;text-align:left"><div style="color:#6b7d93;font-size:10px">DEVELOPER</div><div style="color:#fff;font-weight:700;font-size:12px">@Niellxynn</div></div><a href="https://wa.me/6285602832687?text=Halo%20min%20Niell" target="_blank" style="background:linear-gradient(100deg,#00d4ff,#0066ff);border-radius:12px;padding:11px;text-decoration:none;text-align:left;display:block"><div style="color:rgba(255,255,255,0.7);font-size:10px">SUPPORT 24/7</div><div style="color:#fff;font-weight:700;font-size:12px">WhatsApp ↗</div></a></div><div style="text-align:center;margin-top:12px;color:#3d4d61;font-size:9px;letter-spacing:2px">EST 2024</div></div>
LOGIN

echo "[3/4] Inject file..."
sed -i '/niell-official/d' $WRAPPER
sed -i '/niell-pop/d' $WRAPPER
sed -i "/<\/head>/r /tmp/niell.html" $WRAPPER
sed -i '/NIELLXYNN/d' $LOGIN
sed -i "/<\/form>/r /tmp/login.html" $LOGIN

echo "[4/4] Clear cache..."
cd $PANEL && php artisan view:clear && php artisan config:clear && php artisan cache:clear
echo ""
echo "✅ INSTALL BERHASIL! Watermark: NIELLXYNN OFFICIAL HOSTING"
echo "Refresh panel CTRL+SHIFT+R"

elif [ "$PILIH" == "2" ]; then
echo "Uninstall tema..."
sed -i '/niell-official/d' $WRAPPER
sed -i '/niell-pop/d' $WRAPPER
# restore backup terbaru
LATEST_W=$(ls -t $WRAPPER.bak_neill_* 2>/dev/null | head -n1)
LATEST_L=$(ls -t $LOGIN.bak_neill_* 2>/dev/null | head -n1)
if [ ! -z "$LATEST_W" ]; then cp $LATEST_W $WRAPPER; echo "Wrapper restored"; fi
if [ ! -z "$LATEST_L" ]; then cp $LATEST_L $LOGIN; echo "Login restored"; fi
cd $PANEL && php artisan view:clear && php artisan config:clear
echo "✅ UNINSTALL BERHASIL - Panel kembali original"

else
echo "Keluar..."
exit 0
fi