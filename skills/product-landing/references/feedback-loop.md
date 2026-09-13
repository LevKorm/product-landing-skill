# Feedback loop and versions

A stylish page comes from many short rounds of edits, not from the first version. This file describes how to run those rounds. The user's taste that carries over between products lives separately, in `taste-profile.md`.

## Protocol for one round

1. **Parse the feedback.** The user often dictates by voice, with recognition errors. Restate the edits as a short list in your own words. If something is ambiguous, pick the most likely reading, state it plainly and offer the alternative in one line.
2. **Generalize, but within the product.** "The logos are off in one block" → check all logos on the page. "Too much accent here" → check that the accent isn't spread thin elsewhere too.
3. **Apply everything at once,** section by section, without partial republishes.
4. **Verify:**
   - a script for card overflow and horizontal scroll;
   - a console with no errors;
   - one or two screenshots at 1440 and, if you touched the layout, at 375;
   - for the mobile check, the built file with the viewport meta.
5. **Publish** the same artifact (the URL doesn't change). For major pivots, make a new version.
6. **Report:** what changed, point by point; what was verified; what you couldn't see with your own eyes. List open decisions (numbers, quotes) separately.
7. **Record** (see the end of the file).

## Versions

- A major concept pivot → a new version. Copy the previous one to `vN.html`. `index.html` stays the latest.
- Put a version switcher in the menu of every version, for comparison.
- **Only the final version goes to production:** `build.sh` strips the switcher, and `vN.html` pages are not deployed. Visitors don't need versions. They only confuse them.

## Taste or product decision

Every edit is about either the person or this product. Tell them apart, because that decides where to record it:
- **The person's taste** repeats across products: "too much text", "pale icons", "don't draw people". These edits go into `taste-profile.md` and become defaults for future landing pages.
- **A product decision** is right only here: "the accent color means you", "everything centered", "a wall of all features at the end". It stays in this landing page's brief and doesn't carry over to the next product.
- **Not sure?** Record it as a hypothesis and check it on the next product.

## What to record after the session

- **In `taste-profile.md` (or in the user memory):** edits about the person's taste, marked "carries over" or "hypothesis".
- **In the brief and project memory:** this landing page's decisions, its structure and its signature moment in one line. That way the next product won't repeat them out of inertia. If the landing page worked out, add it briefly to `case-studies.md` in the format "question → form → fact".
- **Verified product facts** that went on the site, with their source.
- **Open questions:** numbers, founder quote, wordmark spelling, domain.
- **Production technical details:** URL, Vercel project, build script, where signups go.
