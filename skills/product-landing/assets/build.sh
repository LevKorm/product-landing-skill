#!/bin/bash
# Product landing build: wraps index.html (the artifact source, no doctype/head) into a full page
# in ./site with meta, OG image, favicon; strips the local V1/V2/V3 switch. --deploy ships to Vercel.
# Fill SITE_URL, TITLE, DESC and the favicon mark below. Link once: cd site && vercel project add NAME && vercel link --yes --project NAME
set -euo pipefail
cd "$(dirname "$0")"
SITE_URL="${SITE_URL:-https://<project-name>.vercel.app}"
TITLE="${TITLE:-<Product> for <Platform>}"
DESC="${DESC:-<One sentence that matches the hero.>}"
OUT=site
mkdir -p "$OUT"
find "$OUT" -mindepth 1 -maxdepth 1 ! -name .vercel -exec rm -rf {} +

# Placeholder: replace with the product's own mark and colors (simple shapes only)
cat > "$OUT/favicon.svg" <<'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><rect width="64" height="64" rx="14" fill="#101318"/><rect x="16" y="16" width="32" height="32" rx="8" fill="#8A8F98"/></svg>
SVG

SITE_URL="$SITE_URL" TITLE="$TITLE" DESC="$DESC" python3 - "$OUT" <<'PY'
import os, re, sys, html
out = sys.argv[1]
site = os.environ["SITE_URL"].rstrip("/")
title = html.escape(os.environ["TITLE"]); desc = html.escape(os.environ["DESC"])
src = open("index.html").read()
src = re.sub(r'<span class="vswitch"[^>]*>.*?</span>', '', src, count=1, flags=re.S)
cut = src.find('<svg class="sprite"')
if cut < 0:
    cut = src.index('<header')
head = f'''<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="{desc}">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="canonical" href="{site}/">
<meta property="og:type" content="website">
<meta property="og:url" content="{site}/">
<meta property="og:title" content="{title}">
<meta property="og:description" content="{desc}">
<meta property="og:image" content="{site}/og.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta name="twitter:card" content="summary_large_image">
<style>[hidden]{{display:none!important}}img{{max-width:100%}}</style>
'''
open(os.path.join(out, "index.html"), "w").write(head + src[:cut] + "</head>\n<body>\n" + src[cut:] + "\n</body>\n</html>\n")
PY

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -x "$CHROME" ]; then
  printf '<html><body style="margin:0"><img src="favicon.svg" style="width:180px;height:180px;display:block"></body></html>' > "$OUT/_icon.html"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=180,180 \
    --screenshot="$PWD/$OUT/apple-touch-icon.png" "file://${PWD// /%20}/$OUT/_icon.html" >/dev/null 2>&1 || true
  rm -f "$OUT/_icon.html"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1200,900 \
    --virtual-time-budget=4000 --screenshot="$PWD/$OUT/og.png" "file://${PWD// /%20}/$OUT/index.html" >/dev/null 2>&1 || true
  python3 -c "from PIL import Image; Image.open('$OUT/og.png').crop((0,0,1200,630)).save('$OUT/og.png')" 2>/dev/null \
    || magick "$OUT/og.png" -crop 1200x630+0+0 +repage "$OUT/og.png" 2>/dev/null || true
else
  echo "Chrome not found: apple-touch-icon.png and og.png skipped"
fi
ls -la "$OUT"
if [ "${1:-}" = "--deploy" ]; then
  ( cd "$OUT" && vercel deploy --prod --yes )
fi
