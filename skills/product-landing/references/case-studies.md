# Case studies: how different products became different pages

**Why this file exists.** It shows the line of thinking from product facts to structure and devices. The forms here **don't carry over**. If you catch yourself thinking "I'll do it like SOFA" or "like the window manager", stop and go through `content-architecture.md` §2–3 for your product.

Both landing pages were made with Claude using this method. They are different on purpose, because the products are different. The first product's name is hidden, because it hasn't launched yet.

---

## Mac window manager (2026)

**Product.** A window manager for Mac. It saves where every window sits across all displays as a "scene" and brings everything back with one key.

**Audience and decision.**
- The category is familiar: people know window managers.
- The decision is cheap: a free version and an inexpensive one-time Pro purchase.
- So it's enough to show the mechanic in a second. The rest of the page is about how it lives on a real desk.

**Mechanic in one sentence.** You press one key, and the windows on all displays go back to their places.

**Structure: 5 sections, each with a reason.**

| Visitor question | Form | Product fact that required it |
|---|---|---|
| What is it? | a headline about one key and a wall of three drawn monitors where scenes switch | the value is in an instant change of state across several displays |
| How do I trigger it? | three ways: under the camera notch, the ⌥⌘1–9 keys, the menu bar | the product really has three entry points |
| Can it happen automatically? | a timeline of the day with calendar events | Pro switches scenes on its own: when you connect a display, open an app or a meeting starts |
| What if my desk changes? | interactive situations: restart, a closed app, overlapping windows, the laptop moved away | the main objection is "it'll break as soon as something changes" |
| How much does it cost? | a Free / Pro table | the model is free plus a one-time purchase |

**What's not on the page, and why.**
- Competitor comparison: the category is familiar, and the demo shows the difference.
- Process diagrams: the process is a single step.
- Waitlist: the product can already be downloaded.
- Feature walls: there aren't many features, and all the important ones are already shown.

**World and devices.**
- Hardware: aluminum monitors with model names and resolutions, keycaps, the camera notch, a menu bar with a clock.
- Status lines: "5 windows placed", "Matched by model and serial".

---

## SOFA (formerly CNVS, September 2026)

**Product** ([trysofa.vercel.app](https://trysofa.vercel.app)). A Mac app: an infinite canvas where several AI coding agents (Claude Code, Codex and others) work side by side. The conductor splits the work into cards, the board runs each card in a separate worktree, tests and reviewers check it, and the person accepts the result.

**Audience and decision.**
- The category is new: people have no ready word for "a canvas with a conductor of agents".
- Access model: an early birds waitlist, because the product isn't on sale yet.
- So the mechanic needs explaining, and access needs to feel attractive right now.

**Mechanic in one sentence.** You say it once, and a team of agents splits the work, does it and checks it, and you only accept it.

**Structure: 9 sections, each with a reason.**

| Visitor question | Form | Product fact that required it |
|---|---|---|
| What is it? | "Figma for vibe coding." and a canvas with agents in a monitor frame that you can drag | the product is the canvas itself, so the best way to get it is to feel it by hand |
| Who's in there? | a simple role diagram: you, the secretary, the conductor, the agents, the board, a short step-by-step story | the product's idea lies in how the roles relate |
| What happens after a request? | a pinned process diagram with branches, live states and a Skip button | the value is that a long branching process (plan → run → review → fixes → merge) runs on its own |
| How does it feel? | the "Sit back and chill" scene: a sofa, notifications on the S·O·F·A cushions | the name itself carries the mood and spells out the roles |
| What exactly can it do? | bento with animations: limits, conductors, review, previews, files | 6 features of equal weight, each one can be shown |
| Why not just more terminals? | a "who does the work" table: terminals have "You" everywhere, SOFA has it in only one row | the value is exactly in taking manual work off the person |
| How do I get it? | early birds panel, a form at the top and at the bottom | the model is a waitlist |
| How much is in there? | an infinite wall of 54 features | for this kind of product, the breadth of features is itself an argument |
| Who makes it? | a founder quote | an early product by one person |

**Decisions that fit only SOFA.** They worked for an AI agent canvas and make no sense for another product:
- "blue = you" and the single bright "You" in the comparison;
- provider colors;
- frames with a dot grid, like on the canvas;
- text at 1100px, large blocks at 1280px, everything centered;
- Funnel Display and Funnel Sans, Phosphor duotone;
- the S·O·F·A acronym.

---

## Anti-example: vocabulary flashcards app (September 2026)

The first version of this skill kept SOFA's sections as a numbered "template". The landing page for a vocabulary flashcards app was assembled from the same numbers: a demo in the first screen, a process panorama, bento and a comparison. The author said this was the specific story of one page, and every product needs its own.

**Lesson.** First ask whether the product has a long branching process and whether the value is in taking work off the person. Only then can you use a panorama or a "who does the work" table. Derive the structure of this app (and of any future product) from scratch, from its own mechanic: this file deliberately doesn't hint at the answer.

---

## Comparison at a glance

| | Window manager | SOFA |
|---|---|---|
| Category | familiar | new |
| Access | download plus one-time purchase | waitlist |
| Sections | 5 | 9 |
| Signature moment | a wall of monitors where scenes switch | a canvas you can drag, and a process diagram |
| Competitor comparison | none | "who does the work" table |
| World | hardware, keys, menu bar | canvas, cards, cursors, sofa |
| Action | download / buy Pro | Join early birds |
