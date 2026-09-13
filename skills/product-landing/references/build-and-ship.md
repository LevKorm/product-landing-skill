# Build, mobile version, deploy and the page action

## 1. Source format

- **One HTML file without `<!doctype>` and `<head>`:** `<title>`, a `<link>` to Google Fonts and `<style>` at the top, then the icon sprite and the body. Such a file publishes directly as an artifact on claude.ai and also serves as the source for the production build.
- **The icon and logo sprite** is inlined (see `design-system.md` §5).
- **JS at the end,** a separate IIFE for each interactive section. Every animation loop stops when off screen.
- **Files:** `<landing folder>/index.html` (+ `v1.html`, `v2.html`, `build.sh`, `site/`).

## 2. Mobile adaptation (<760px), section by section

Check on the **built** `site/index.html`: the raw file has no viewport meta, and the emulator renders it at 980px.

Below are common visual patterns. Take only the rows for the patterns your page has.

| Desktop pattern | What to do on a phone |
|---|---|
| Interactive demo or a device in a frame | lower height (~420–480px), remove small hints, keep the gesture if it works with a finger |
| Diagram on a fixed canvas with scaling | cancel the scaling; elements `position:relative` in a grid or stack in logical order; hide lines and decoration that no longer make sense |
| Wide or pinned scroll-linked diagram | hide it; build a vertical list of steps from the same cards (clones) |
| Several monitors or devices side by side | one main one at full width, the rest smaller below it or behind a switcher |
| Illustrated scene | a closer crop on the main object; replace pop-up labels with a card below the scene |
| Bento | one or two columns; keep the animated visuals, but smaller |
| Comparison or pricing table | tabs with one column at a time (the product or the recommended plan selected by default) or pricing cards stacked one under another |
| Infinite marquee or wall | fewer rows and tiles; repack on breakpoint change (`matchMedia` + `change`) |
| Action panel with a form | smaller padding, form in a column, smaller perks |

Checks:
- `document.documentElement.scrollWidth === innerWidth`;
- key section heights are reasonable;
- no clipped text;
- buttons don't wrap to two lines.

## 3. Production build

Copy `assets/build.sh` into the landing page folder, fill in `SITE_URL`, `TITLE`, `DESC` and the favicon glyph. It:
- wraps `index.html` in a full document: doctype, charset, viewport, description, canonical, OG/Twitter, favicon, `[hidden]{display:none!important}`;
- strips the version switcher (`<span class="vswitch">`) and skips `vN.html`;
- creates `favicon.svg`, `apple-touch-icon.png` and a 1200×630 `og.png` via headless Chrome;
- with `--deploy`, runs `vercel deploy --prod --yes` in `site/`.

## 4. Vercel

```bash
cd site && vercel project add <project-name> && vercel link --yes --project <project-name>
cd .. && ./build.sh --deploy
```

- The project name gives the domain `<name>.vercel.app`. Check that `SITE_URL` in build.sh matches the alias in the deploy output.
- The user explicitly asks to publish → that is the confirmation for production. For the first deploy, briefly name the project and the URL.
- **After deploy:**
  - `curl` on `/`, `/og.png`, `/favicon.svg` returns 200;
  - `/v1.html` returns 404;
  - the HTML has no `vswitch`;
  - `vercel inspect` shows Ready;
  - open the live page on desktop and at 375.
- Record the live link wherever the team tracks projects (Notion, README, tracker), if such a place exists.

### Changing the domain when the old link is already shared
1. Check that the new name is free: `curl -sI https://<new>.vercel.app` returns 404 `DEPLOYMENT_NOT_FOUND`.
2. `cd site && vercel domains add <new>.vercel.app`.
3. In `build.sh`, change `SITE_URL` and generate `site/vercel.json` with a host-based redirect. The root `/` needs its own rule, because `/:path*` doesn't catch it:
   ```json
   { "redirects": [
     { "source": "/", "has": [{ "type": "host", "value": "<old>.vercel.app" }], "destination": "https://<new>.vercel.app/", "permanent": true },
     { "source": "/:path*", "has": [{ "type": "host", "value": "<old>.vercel.app" }], "destination": "https://<new>.vercel.app/:path*", "permanent": true }
   ] }
   ```
4. Deploy and verify: the old `/`, `/?utm=x` and `/og.png` return 308 to the new domain with the same path and query; canonical and `og:image` point to the new domain.

## 5. The page action: depends on the access model

| Model | What to connect |
|---|---|
| Waitlist, early access | email form → Supabase (§6) |
| Free download | direct link to `.dmg` / App Store / release, with the requirements next to it (OS, architecture) |
| Purchase or subscription | Lemon Squeezy, Paddle or Stripe checkout; prices on the page match the checkout |
| Open source | install command with a copy button, links to the repo and docs |

## 6. Waitlist in Supabase

1. **Project.** Use the product's existing project. Creating a new one may cost money, so agree on it with the user.
2. **Migration.** Put `assets/early_birds.sql` into `supabase/migrations/NNNN_<table>.sql` (adjust the table name and the allowed `source` values to the page's forms) and apply it via the MCP `apply_migration`. The essentials:
   - the public key can only INSERT into allowed columns (column grants);
   - SELECT, UPDATE and DELETE are forbidden;
   - unique `lower(email)`, checks on format and lengths;
   - `source` only from the list of forms on the page.
3. **Key.** Take the public one (`get_publishable_keys`, preferably `sb_publishable_…`). It is safe in the client only thanks to RLS and grants.
4. **Client.** `assets/waitlist-form.js`: POST to `/rest/v1/<table>` with `Prefer: return=minimal`, a honeypot field, states (validation, "sending", success, "already on the list", network error), sync across all forms, `localStorage`. Match the button and state texts to the name of the action on the page.
5. **Verify with curl requests** (delete the test rows afterwards via `execute_sql`):
   - a valid request returns 201;
   - a duplicate returns 409;
   - a malformed email returns 400;
   - an unlisted `source` or a supplied `created_at` returns 401;
   - GET and DELETE are denied.
6. **Advisors.** `get_advisors security` must come back empty.
7. **A real submission** from the production domain (this checks CORS), then delete the test row.
8. **Give the user a link to the table:** `https://supabase.com/dashboard/project/<ref>/editor/<table_oid>?schema=public` (oid: `select 'public.<table>'::regclass::oid`).
9. **Privacy.** Under the form, add a line about what the email is for. If a newsletter is planned, add consent.

## 7. After launch: access for the waitlist

Explain this to the user, build on request:
- **mailing:** CSV from the table → a mailing service (Resend, Loops);
- **login in the app:** Supabase Auth magic link (it also confirms the owner of the address);
- **access:** a table with `access_until`; on first login a function looks up the email in the waitlist and sets the date;
- **payment** after the free period: Stripe, Paddle or Lemon Squeezy;
- **the user decides:** where the free period starts (from launch or from first login).
