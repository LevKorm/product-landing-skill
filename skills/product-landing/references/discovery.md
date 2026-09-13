# Discovery: fact base, brief and vision

The goal of this phase is a true, verified picture of the product before the first pixel. A strong page rests on claims that have a source. Catch untruths (an inflated feature, an inaccurate number) before publishing, not after.

## 1. Where to look on your own (this first, questions later)

Go in this order. Stop when the picture comes together:

1. **Project memory:** `MEMORY.md` and files about positioning, the name, the founder's voice, honesty in public copy. They often already contain the tagline, pillars and banned phrasings.
2. **Docs:** `README`, `docs/`, PRD, briefs, release notes, `CHANGELOG`. The date matters: a month-old document may be outdated.
3. **Code as the source of truth:**
   - the opening comments of modules give you a feature map in a minute;
   - adapters and integrations show what is actually supported;
   - constants show the real numbers: limits, timeouts, counts;
   - assets give the logos, icons and colors the product already uses;
   - DB migrations show what gets stored.
4. **Git log:** what was done recently and what is in progress.
5. **Previous landing pages and prototypes of this product:** what the user already liked.
6. **Competitors:** web search by category, public docs only. Don't claim the user tested something if they only "looked at it".

Delegate large reading jobs to a subagent (Explore) with a concrete list of questions and the requirement "status (true / changed / gone) + file:line". This way you get conclusions, not a file dump.

## 2. What to verify in code before writing it on the site

For every feature claim: does it exist, does it work by default, does it have conditions. Common traps:
- **the feature works only in one mode** → state the condition or don't make it the headline;
- **a number in the brief doesn't match the code** ("up to 8 per task" vs "up to 8 per run") → take it from the code;
- **"any provider"** vs the list that is actually supported → name the list;
- **behavior depends on risk or plan** → say exactly that ("review grows with risk", "Pro only").

If you can't verify it, phrase it carefully or remove it.

## 3. Questions for the user (only the ones the sources didn't answer)

Ask up to 4 at a time, with options and a recommended default.

**Product and stage**
- What is it in one sentence, and for whom? What job does a person "hire" the product to do?
- Platform (web / Mac / mobile / API), stage (idea / beta / launched)?
- Is the name final? Wordmark spelling? Domain?
- Access model: download, purchase, subscription, waitlist? What do we promise early access users?

**Voice and vision**
- The founder's tagline, in their own words? Why are they doing this?
- Tone: serious, human, with humor? Site language?
- What world does the product come from: objects, units, states, gestures?

**Audience and competitors**
- Who is the visitor, and what do they use now instead of the product?
- Do they know the category, or does it need explaining?
- The main objection ("why, if X exists", "what if it breaks")?
- Who do we count as competitors, and which of them has the user actually tried?

**Proof and assets**
- Real testimonials, numbers, screenshots? If there are none, there are none on the page either.
- Is there a logo, colors, fonts already? Which sites do they like and dislike, and why exactly?

**Conversion and production**
- One main action: download, leave an email, buy?
- Where do signups go (Supabase, a mailing service)? Are consent and privacy needed?
- Hosting, domain, deadline?

## 4. Brief (write it to `docs/landing/brief.md`)

Use `assets/brief-template.md`. Required parts:
- **One-liner** and **headline candidates**: 2–3, one of them in the founder's words if there are any.
- **Audience:** awareness level, category novelty, decision type, main objection.
- **Core mechanic in one sentence:** "A person does ___, and ___ happens". The signature moment grows from it.
- **Pillars (3–5):** claim → proof → source (path to a file or document).
- **Differences (honest):** against categories, dated, no "nobody else has this". It's fine to honestly write "no separate section needed".
- **The product's world:** objects, units, states, gestures, material. The design devices grow from it.
- **Tone and don'ts.**
- **Access model and action.**
- **Section map** in the format from `content-architecture.md` §5, with the column "Which fact about this product calls for this form".
- **Open questions and defaults.**

The brief is a living document. Update it after feedback rounds and when the positioning or the name changes.

## 5. Reorganizing the positioning (if the picture is blurry)

Signs: many features but no story; the name has no link to the essence; the pillars contradict each other. What to do:
1. **Group the features** along the axis that matters to this visitor. Possible axes: what work it removes, how much time it saves, what becomes possible, what you no longer have to fear, how much simpler things get. Pick one based on the product's facts, not out of habit.
2. **Find one central idea** that the groups fit into. It can be a metaphor from the product's world, a promise or a familiar image ("Figma for…").
3. **Check** that each section answers one visitor question, and remove duplicates.
4. **Show the user** 2–3 headline and structure options briefly, and let them choose.
