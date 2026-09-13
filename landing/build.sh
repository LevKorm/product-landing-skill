#!/bin/bash
# Builds the product-landing skill's own landing into ./site; --deploy ships it to Vercel.
# index.html is the source (no doctype/head); this adds head meta, favicon, OG image.
set -euo pipefail
cd "$(dirname "$0")"
SITE_URL="${SITE_URL:-https://landingskill.vercel.app}"
TITLE="product-landing · Claude Code skill"
DESC="A Claude Code skill that builds a landing page from your product's facts. Every section names the fact behind it, the rest gets cut, and the page ships to Vercel."
OUT=site
mkdir -p "$OUT"
find "$OUT" -mindepth 1 -maxdepth 1 ! -name .vercel -exec rm -rf {} +

cat > "$OUT/favicon.svg" <<'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><rect width="64" height="64" rx="14" fill="#12151B"/><rect x="14" y="13" width="36" height="14" rx="4" fill="#FF5A26"/><rect x="14" y="31" width="36" height="8" rx="3" fill="#FFFFFF" opacity=".85"/><rect x="14" y="43" width="36" height="8" rx="3" fill="#FFFFFF" opacity=".55"/></svg>
SVG
cp ../docs/example-sofa.png "$OUT/example-sofa.png"
python3 -c "from PIL import Image; Image.open('../docs/preview.png').resize((1280,640), Image.LANCZOS).save('$OUT/og.png', optimize=True)"

SITE_URL="$SITE_URL" TITLE="$TITLE" DESC="$DESC" python3 - "$OUT" <<'PY'
import os, sys, html
out = sys.argv[1]
site = os.environ["SITE_URL"].rstrip("/")
title = html.escape(os.environ["TITLE"]); desc = html.escape(os.environ["DESC"])
src = open("index.html").read()
cut = src.index('<svg class="sprite"')
head = f'''<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="{desc}">
<meta name="theme-color" content="#FFFFFF">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="canonical" href="{site}/">
<meta property="og:type" content="website">
<meta property="og:url" content="{site}/">
<meta property="og:title" content="{title}">
<meta property="og:description" content="{desc}">
<meta property="og:image" content="{site}/og.png">
<meta property="og:image:width" content="1280">
<meta property="og:image:height" content="640">
<meta name="twitter:card" content="summary_large_image">
<style>[hidden]{{display:none!important}}img{{max-width:100%}}</style>
'''
open(os.path.join(out, "index.html"), "w").write(head + src[:cut] + "</head>\n<body>\n" + src[cut:] + "\n</body>\n</html>\n")
PY

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -x "$CHROME" ]; then
  printf '<html><body style="margin:0"><img src="favicon.svg" style="width:180px;height:180px;display:block"></body></html>' > "$OUT/_icon.html"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=180,300 \
    --screenshot="$PWD/$OUT/_icon.png" "file://${PWD// /%20}/$OUT/_icon.html" >/dev/null 2>&1 || true
  python3 -c "from PIL import Image; Image.open('$OUT/_icon.png').crop((0,0,180,180)).save('$OUT/apple-touch-icon.png')" 2>/dev/null || true
  rm -f "$OUT/_icon.html" "$OUT/_icon.png"
fi
ls -la "$OUT"
if [ "${1:-}" = "--deploy" ]; then
  ( cd "$OUT" && vercel deploy --prod --yes )
fi
