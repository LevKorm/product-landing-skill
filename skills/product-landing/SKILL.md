---
name: product-landing
description: Full cycle of a product landing page, from a blank slate to a live site. Gathers facts about the product (from memory, docs and code, and asks questions about whatever is missing), writes a brief, and derives the section structure, signature moment and visual language from this specific product (no templates, no AI slop). Iterates in versions with feedback, adapts for mobile, deploys to Vercel and, when needed, connects a waitlist in Supabase. ALWAYS use it when someone needs a site, a landing page, a promo page, a product page, "a page for my product or app", a showcase page, an early-access or waitlist page, a landing redesign, or repackaging a product's positioning for a site, even if the user just says "make a landing", "a page for my app", "throw together a landing", "a site for my product" or "package the product into a page".
---

# Product landing: from facts to a live site

The skill gives a **method**, not a page template. The structure, number of sections, signature moment, composition, palette and animations are derived from the specific product. Two landing pages made with this skill for different products should not look alike. If they do, the method failed.

Core idea: **the shape of the page follows the shape of the product.**
- Visitor questions decide which sections are needed.
- The product's core mechanic becomes the page's signature moment.
- The product's objects, units and states supply the visual devices.

Example: a window manager where everything comes down to one key got a short landing page with five sections and a wall of monitors in the first screen. An AI agent canvas got a long story with a process diagram. Both decisions are right, because each grew out of its own product.

## What the skill does not give

There is also no ready-made section map and no mandatory blocks. A comparison table, a process panorama, a bento, a feature wall, a vibe scene or a founder quote appear only when a fact about this product calls for them. In the same way, there is no fixed grid, palette or animation set.

Real case studies are in `references/case-studies.md`. They show the reasoning from facts to form. The forms themselves do not carry over.

## Phases

Go in order. Each phase leaves an artifact, so the next chat, or you a week later, does not start from zero.

### 0. Triage (5 minutes)
Find out what already exists:
- project memory (MEMORY.md, notes on positioning and the name);
- README, `docs/`, briefs, PRDs;
- earlier drafts of this product's landing page;
- brand assets: logos, icons, colors, fonts;
- domain and hosting;
- the user's taste profile (`references/taste-profile.md`, memory about the user);
- **landing pages for other products already made with this skill** (memory, `case-studies.md`). Record their structure and signature moments as "already used", so you don't repeat them out of inertia.

If a landing page already exists, this is a redesign: keep the content and names, change the presentation.

### 1. Facts and brief
Read `references/discovery.md`. The result is `docs/landing/brief.md`, based on the template `assets/brief-template.md`:
- one sentence about the product;
- audience, awareness level, decision type;
- **the core mechanic in one sentence:** "A person does ___, and ___ happens";
- 3–5 pillars, each with evidence and its source;
- honest differences (if the page needs them at all);
- the product's world: objects, units, states;
- tone, access model, open questions.

Don't invent features, numbers, testimonials or quotes. If something is missing, mark it as an open question. Show the brief to the user in short form. Ask only what actually changes the page, up to 4 questions at a time. Close the rest with sensible defaults and name them.

### 2. Structure from visitor questions
Read `references/content-architecture.md`:
1. List the questions this specific visitor has, in the order they arise in their head.
2. For each question, pick a form from those that suit this product. The menu of forms and the conditions for each are in the reference.
3. Find **one signature moment** in the core mechanic.
4. Remove sections that answer a question that is already closed.

The number of sections equals the number of real questions. A short page for a simple product is fine.

### 3. Visual language
Read `references/design-system.md`. If the `artifact-design` and `design-taste-frontend` skills are available in the session, load them too. Before writing code, write down a plan:
- colors with roles that make sense for this product;
- 2–3 fonts with roles;
- composition: one phrase on why it is this one;
- 3–4 devices from the product's vocabulary.

### The gate before code: template check
Build the section map as a table with the column **"Which fact about this product calls for this form?"**. Go through every row and every device:
- Does the answer sound like "that's how another landing page did it" or "that's how it's usually done"? Replace the form or remove the section.
- Does the form match one already used for another product (case studies, memory)? Keep it only if this product has the same fact, and write that fact down.
- Could the page be handed to another product by just swapping the name? Then it is templated. Rework the signature moment.

Briefly show the user the map with its explanations before building.

### 4. Build V1
One HTML file: an artifact on claude.ai for review and, at the same time, the source for deployment. Take icons from one library and logos from the real assets, and inline everything into the page. Animation explains the product's mechanic. It does not decorate. Look once at 1440 and at 375, fix, publish the artifact.

### 5. Feedback loop and versions
Read `references/feedback-loop.md`. Each round:
1. Restate the edits in your own words.
2. Make all of them.
3. Check by eye and with a script.
4. Publish.
5. Record: the user's taste in `references/taste-profile.md` (carries over between products), this landing page's decisions in the brief (do not carry over).

Do big pivots as a separate version with a switcher in the menu. The switcher is local only and does not go to production.

### 6. Production
Read `references/build-and-ship.md`:
- mobile adaptation, section by section;
- `assets/build.sh` (head, OG, favicon, stripping the version switcher);
- `vercel deploy --prod`;
- the action that matches the access model: a waitlist in Supabase (`assets/early_birds.sql`, `assets/waitlist-form.js`), a download link, or payment;
- check the live URL;
- record the live link wherever the team tracks its projects.

### 7. After launch
Only for a waitlist or early access: explain the access plan (export to a mailing list, magic-link login, an access table, payment). Build it when the user is ready.

## Principles

- **The first screen passes a 5-second test.** Someone who has never heard of the product can say what it is and who it is for. Internal vocabulary (the product's own terms or this method's terms like "signature moment") stays out of headings. A clever demo that needs a legend fails the test.
- **Structure comes from the product, not from the previous page.** Every section and every device must name the product fact that calls for it.
- **Facts beat epithets.** The product's real units ("one key", "up to 9 scenes", "0.3 s") persuade better than "seamless workflow". Every claim has a source.
- **Compare only when it helps.** If a comparison is needed, compare against categories, without "nobody else has this", with a date and "according to public docs".
- **The accent is rare and has one meaning.** Decide what exactly it means in this product and don't spread it thin.
- **Motion explains.** Every animation answers "what is happening here". If the product has no process, it does not need a process diagram.
- **Scannability.** The gist should read in seconds: a visual, 2–3 words, one line.
- **A user's edit is a signal.** Generalize it across the whole page. But tell the person's taste apart from decisions that suit only one product.
- **Verify, don't trust.** Screenshots at two widths, a script for overflow and horizontal scroll, the console, a real form request from the production domain.

## What to read when

| Situation | File |
|---|---|
| No brief, few facts, unclear positioning | `references/discovery.md` |
| Which sections are needed, which forms, signature moment, copywriting | `references/content-architecture.md` |
| Palette, fonts, devices, composition, motion, anti-slop | `references/design-system.md` |
| How real products turned into different pages | `references/case-studies.md` |
| The user gives feedback, versions | `references/feedback-loop.md` |
| Known user taste that carries over between products | `references/taste-profile.md` |
| Mobile version, deployment, waitlist, domain, checks | `references/build-and-ship.md` |
| Templates for the brief / build / SQL / form | `assets/` |
