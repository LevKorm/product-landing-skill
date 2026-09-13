# Page structure: from visitor questions to sections

There is no template section map here, and that is deliberate. The structure is assembled again for each product from three things:
1. who arrives and what they already know;
2. what questions they have;
3. which form of answer suits this particular product.

## 1. Who arrives and what they already know

### Awareness level decides where to start

| The visitor… | The page starts with… | What is usually unnecessary |
|---|---|---|
| is not aware of the problem | a recognizable situation or pain; the product comes second | a long feature list at the start |
| knows the problem but not the solutions | the fact that the problem can be solved, and how | comparisons with competitors they don't know |
| knows the category but not you | a difference visible in the first screen | an explanation of what the category is |
| already knows the product | pricing, access, news | persuading them again |

### Category novelty decides how much to explain the mechanic
- **New category** (the person has no ready word for the product). Show the mechanic step by step, otherwise it is unclear what they are paying for.
- **Familiar category** (a window manager, a habit tracker, vocabulary flashcards). Show the mechanic in a second. The rest of the page covers why this product is better and how it feels in use.

### Decision type decides length and evidence
- **Free download, cheap purchase:** a short page, the action early and several times.
- **Expensive purchase, B2B:** trust, evidence, security, pricing, contact.
- **Waitlist:** why sign up now and what the person gets.
- **Open source, developer tool:** install command, code, documentation, GitHub.

## 2. Visitor questions and answer forms

Below is a pool of questions. **Not all of them are needed.** Take only the ones this product's visitor really has, in the order they arise for that visitor. Each question comes with a menu of forms and conditions. Choose by the conditions, not by what already worked on another landing page.

### "What is this and is it for me?" (always, first screen)
Contents: a headline of up to ~6 words, a subheadline of up to ~20 words, the action, the signature moment. Everything else is optional.
- **The headline** is best taken from the founder's own words, if there are any. Otherwise give 2–3 options to choose from.
- **Visual:** most often this is the signature moment itself (see §3).

### "What does it look like and how does it work?"

| Form | Fits when | Avoid when |
|---|---|---|
| A live interactive mini version of the product | the value can be felt hands-on in 5 seconds | the product is not visual, or the "demo" would end up as a fake made of div rectangles |
| A real screenshot or a short video | the UI is convincing on its own and already finished | the UI is rough |
| One "before → action → after" scene | the value is in an instant change of state | the process is long and has branches |
| 2–4 steps with pictures | the mechanic is simple and linear | the steps are trivial ("download, open, use") |
| A branching process diagram that comes alive on scroll (it can be pinned or horizontal) | the product itself runs a long multi-step process with branches, and automating that process is the value | the process is short or the visitor doesn't care what is inside. Mind the cost: on mobile it becomes a list anyway, and it needs a "skip" button |
| A diagram of roles or entities | the product's idea lies in the relationships between several entities | one person does one action |
| A command or code with its output | the audience is developers, the product is an API, CLI or SDK | a non-technical audience |
| "When you…" scenarios | the audience thinks in tasks, not functions | there is one obvious task |

### "How is this different from what I already do?"

| Form | Fits when | Avoid when |
|---|---|---|
| No separate section: the demo or a line in the subheadline shows the difference | the difference is obvious from the first screen | — |
| "Before / after" on one scenario | the difference is visible in one example | — |
| A "us vs. categories" table | a familiar category with clear axes (price, platforms, privacy) | a new category: the comparison rows will be contrived |
| A "who does the work" table | the value is precisely that the product takes away manual work | the value is in speed, quality, price or enjoying the process |
| "Before / after" numbers | there are real measurements | there are no numbers: inventing them is not allowed |

Compare with competitors by name only based on public docs, with a date, and without "nobody else has this".

### "What exactly can it do?"

| Form | Fits when |
|---|---|
| 1–3 large sections, each about one feature | there are a few features, and each carries its own story |
| A bento with varied cells and animations | 4–8 features of roughly equal weight, each can be shown visually |
| A dense list of details with icons | many small practical things that remove objections |
| A catalog or wall of all features | the sheer number of features is the argument |
| A pricing table with checkmarks | features are split across plans |

### "Can I trust this?"
- **Allowed:** real testimonials, client logos, usage numbers, open source code, an explanation of data and privacy, who makes it and why.
- **Not allowed:** inventing evidence. If there is none, there is no trust section either.
- **For an early product,** trust comes from transparency: "early access", "made by one person", "your data stays on your device". This works too.

### "Will it fit my setup?"
Platforms, requirements, integrations (as logos), language, offline mode. Often one line next to the button is enough, and no separate section is needed.

### "How does it feel?"
A mood scene is needed only when the mood is part of the value or is built directly into the name and brand. For a utilitarian product it is unnecessary: the quality of the demo and the tone of the text already carry the feeling.

### "How much does it cost and how do I get it?"
- **Waitlist:** a panel with 2–3 perks and a form.
- **Pricing:** plans.
- **Download:** a button with requirements.
- **For developers:** the install command.

There are one or two forms (at the top and at the bottom). On a very long page, the action is repeated in the middle as well.

## 3. Signature moment

**One per page.** It grows out of the product's core mechanic and answers the question of which one thing the visitor should remember.

How to find it:
1. Complete the sentence "A person does ___, and ___ happens".
2. Find a visual that shows this sentence with the least text. Best of all, one the visitor can try hands-on.
3. Name-swap test:
   - with the name of a product from **another category**, the moment must fall apart, otherwise it is decoration;
   - if it fits **competitors in the same category** (they all share the same basic mechanic), that is fine, but then the product's difference must show up in the moment itself or in the very next section. Write down where exactly.

Reasoning on different products:
- **Mac window manager.** One key restores windows across all displays → a wall of three monitors where scenes switch.
- **AI agent canvas (SOFA).** You say it once, and a team of agents splits up the work and does it → a canvas of agents you can drag around, and a process diagram.
- **Nightly backup utility for a NAS** (hypothetical, only to illustrate the method). The person does nothing, and every night a copy appears from which a file can be restored in a minute → a row of nights where you pick last night and pull a deleted file out of it.

The previous landing page's signature moment does not carry over. If your hand reaches for a process diagram, a bento or a wall again, check whether this product has the same fact that justified them.

## 4. Order and length

- **Order** follows the visitor's train of thought: what it is → show it → why it is different and why believe it → how to get it. Rearrange for the awareness level (§1).
- **A section exists** only when it answers a question that is still open.
- **Strike-out test:** mentally remove a section. If the visitor lost nothing, remove it on the page too.
- **Count** equals the number of real questions. Sometimes 4, sometimes 9. The number itself is not the goal.
- **Headline devices** differ between sections but come from the same product vocabulary.

## 5. Section map in the brief

The format is mandatory, because the last column is the template check:

| # | Visitor question | One-sentence answer | Form | Which fact about this product calls for this form |
|---|---|---|---|---|

If the last column says "that's the convention", "that's how SOFA did it" or "looks impressive", replace the form.

## 6. Copywriting

- **Product units instead of epithets:** numbers, durations, names of real states and actions.
- **The user's language, not the system's:** a person "pauses", they don't "change the task status".
- **Short headlines** up to ~6 words, subheadlines up to ~20–25 words.
- **One name for the action everywhere:** the same phrase on the menu button, in the first screen and in the final form. States after the action are words too: "You’re in", "Already on the list".
- **Errors** explain what happened and what to do.
- **No** em dashes, no "seamless / unleash / elevate", no "Quietly trusted by".
- **Humor** is rare and only when it fits the brand voice.
- **Reread every line twice:** is it true, is it clear what it is about, does it sound smart but empty.
