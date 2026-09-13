# Landing brief: product-landing (Claude Code skill)

> Updated: 2026-09-13 (version 2). Sources: `README.md`, `skills/product-landing/**`, two dry runs of the skill (vocabulary flashcards app, invoice API), the live SOFA landing page.

## One-liner
A free Claude Code skill: ask for a landing page, and it studies your product first, builds the page around what the product actually does, and deploys it to Vercel.

## Headline candidates
1. Landing pages that fit your product, not a template. (used)
2. The page takes the shape of the product. (repo banner; too abstract for a first screen)
3. Ask for a landing page. Get one only your product could have.

## Audience
- Who: people who build products with Claude Code: indie developers, designer-founders, small teams.
- What they use now: they ask Claude "make a landing page", use templates, site generators, general design skills.
- Awareness level: they know the category (AI makes landing pages) but not this skill.
- Category novelty: familiar. Show the idea in a second; the rest is how it differs.
- Decision type: free, open source, one install command.
- Main objection: "Claude already makes landing pages" and "all AI landing pages look the same".

## Core mechanic
A person asks for a landing page, and the skill turns the facts of their product into a page that only fits that product: every section needs a fact, template blocks without one are cut.

Signature moment: one request ("Make a landing page for my product") and three different mini pages side by side, for three products. Hover or tap scrolls each page, so its length and shape show. Name-swap test: a template generator can't claim it, because its pages look the same for every product.

## Pillars
| Claim | Proof | Source |
|---|---|---|
| Structure comes from visitor questions, not a template | a menu of forms with "fits when / not when" conditions | `references/content-architecture.md` §2 |
| A template check before any code | the "Which fact about this product calls for this form" column is required | `SKILL.md`, the gate before code |
| Different products get different pages | 5 / 9 / 3+2 sections in three products | `references/case-studies.md`, dry runs |
| It gets to a live site | build.sh (OG, favicon), Vercel, insert-only Supabase waitlist | `references/build-and-ship.md`, `assets/` |

## Differences (honest)
No comparison table: the category is familiar and the difference is clearest on one example. Form: the usual seven AI landing blocks, with what the skill did to each one for an invoice API (cut, replaced, kept).

## The product's world
- Objects: a request to Claude, mini pages, section blocks, an install command.
- Units: sections, facts.
- States: kept, replaced, cut; "waits for facts" (dashed).
- Gestures: scroll a page, copy a command.
- Devices: wireframe pages in browser frames, a prompt bubble, verdict chips, strike-through for cut blocks.

## Tone and don'ts
- Tone: plain and direct. Every line should make sense to someone who has never seen the skill.
- Don't: internal method jargon in headings ("signature moment", "section map"), made-up testimonials, star counters, "trusted by", pinned process diagrams, bento, feature walls.

## Access model and action
- Main action: install (`/plugin marketplace add LevKorm/product-landing-skill`).
- Second action: open GitHub.
- Signups: none. No waitlist needed.

## Section map
| # | Visitor question | One-sentence answer | Form | Which fact about this product calls for this form |
|---|---|---|---|---|
| 1 | What is it, and is it for me? | A free Claude Code skill that makes landing pages fitted to your product. | Headline, one-line lead, install command, GitHub; below it one request and three different mini pages | The skill's output is a page whose shape depends on the product; three pages side by side show that without explanation |
| 2 | What does it actually do? | It reads the product, keeps only what fits, and ships the page. | Three numbered steps | The process is short and linear from the user's side |
| 3 | Claude already makes landing pages. Why this? | The usual blocks have to earn their place. | The seven usual blocks with a verdict and a short reason each, for one product | The difference is the check itself, and one example shows it |
| 4 | How do I get it? | Two commands in Claude Code, then ask. | Commands with Copy, GitHub, MIT | Open source, installs as a plugin |

Template check:
- Three mini pages share a device with the repo banner (different section stacks). Kept: it is this product's own output.
- Version 1 used a product switcher with a "why this form" panel, a template check you run, a phase list and a SOFA screenshot. The owner found it hard to understand from the first screen. Version 2 keeps one idea per section and drops the method's internal vocabulary.
- SOFA proof moved into the caption of its mini page (a "live" link) instead of a separate section.

## Visual language
- Color: background `#FFFFFF`, ink `#12151B`, secondary `#5B6270`, lines `#DDE1E7`, tile `#F2F4F7`, accent `#FF5A26` (text on it `#12151B`), dashed `#B9C0CA`. The accent means one thing: what belongs only to this product (the signature block in each mini page, "replaced" verdicts). Dark theme through tokens.
- Type: Schibsted Grotesk for headings and text, IBM Plex Mono for commands and small labels.
- Layout: left-aligned, 1160px wide, short sections with one idea each.
- Icons: Phosphor bold.

## Assets
- Banner: `docs/preview.png` (also the OG image).

## Open questions and defaults
- [x] Domain → `landingskill.vercel.app`.
- [x] Site language → English.
- [ ] Update the repo banner to match the simpler message → default: keep for now.
