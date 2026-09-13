# Visual language: derive the style from the product and don't slide into AI slop

Style is not picked from a catalog. It is assembled from what the product's world is made of. So this file holds a method and constraints, not a ready palette, grid or animation set.

## 1. Design read and a plan before code

First, one line: "This is a <page type> for <audience>, in a <vibe> voice, in a world of <what the product is made of>". Then a compact plan:
- **Color:** 4–6 hex values with roles (background, surface, ink, secondary text, lines, accent). Add entity and state colors only if the product has entities and states that the page shows.
- **Fonts:** display (with character, restrained), text, utility if needed.
- **Composition:** one phrase plus why it is right for this product.
- **Devices** (3–4) from the product's vocabulary.

Check the plan against the clichés (§8) and against landing pages already made (`case-studies.md`, memory). Replace anything that sounds like a default or a copy, and say what exactly you replaced.

## 2. The product's world → devices

List what the product is made of:
- **objects** (window, card, bill, display, key);
- **units** (seconds, scenes, words per day, dollars);
- **states** (running, paused, learned, overdue);
- **gestures** (drag, flip, press, swipe);
- **material and environment** (the metal and glass of hardware, paper, terminal, canvas, kitchen).

Each item is a candidate for a device. Devices from one product look foreign on another product's page, and that is fine: that is how it should be.

| Product | World | Devices that grew out of it |
|---|---|---|
| Mac window manager | hardware: aluminum monitors, keys, the camera notch, the menu bar | drawn monitors with scenes, keys 1–9, calling up a scene from under the notch, pricing plans as labels |
| SOFA, AI agent canvas | canvas and kanban: selection frames, pins, cursors, cards, statuses | a circled word in the headline, a pinned note above the demo, agent cursors on tiles, live card statuses |
| Nightly backup utility (hypothetical) | server rack, nights, file versions, disks | a row of nights instead of a feature timeline, a disk indicator as a scale, "version from 02:00" as a caption |

Build a table like this for your product before drawing. If the "world" column is empty, go back to discovery first.

## 3. Color

- **Decide what the accent means here.** The user's action, the brand, or "done"? One meaning for the whole page. If the accent is everywhere, it stops meaning anything, and large accent areas drown out the action button itself.
- **Entity colors** (providers, categories, people) are only for cases when entities need to be told apart. Each entity keeps its color consistently across the whole page.
- **State colors** (ok, warning, stop) are separate from the accent. Use darker variants for text on a light background and bright ones for fills.
- **Tokens:** for each role, a color and the color of text on it. Calculate contrast: white on orange or green often fails.
- **Theme** follows from the product and brand. Two themes through tokens: light in `:root`, dark through `prefers-color-scheme` and `[data-theme]`. The `body` background comes explicitly from a token.
- **Neutral gray** with a slight tint toward the accent, not a pure mid gray.

## 4. Typography

- **Display** with a character that suits the product: engineering-precise, warm, editorial, playful. Don't reuse the font from the previous landing page automatically.
- **Text** is a calm sans that pairs with the display.
- **Mono** only where the product really has code, a terminal or command names. Mono in captions and chips reads as "too technical".
- **The scale** is fixed and followed, `text-wrap: balance` for headlines, ~65 characters per line of body text.
- **Headline devices** come from the product's vocabulary (§2), not from a list of effects.

## 5. Icons, logos, images

- **Icons from one library, not hand-drawn.** The default is Phosphor: SVG from `cdn.jsdelivr.net/npm/@phosphor-icons/core@2.1.1/assets/<weight>/<name>-<weight>.svg`, inlined as a sprite `<symbol id="i-name">` and `<svg><use href="#i-name"/></svg>`. Pick the weight (regular, duotone, fill) to match the style, one per page.
- **Brand logos** come from the product's assets or from simple-icons (CC0).
- **No fake screenshots made of div rectangles.** Instead, use a real interactive mini version, a real screenshot, or an honest diagram that does not pretend to be an interface.
- **Illustrations are simple shapes:** frames, rounded rectangles, outlined text, schematic objects from the product's world. Don't draw people or complex characters.

## 6. Composition

Choose for the product and the vibe, not out of habit:

| Composition | When it fits |
|---|---|
| Everything centered, a narrow text column, wide visuals | a calm tone, the story runs top to bottom, the visuals are the main thing |
| A split first screen (text and visual side by side) | the product is best shown as one large object next to the claim |
| An asymmetric editorial grid | lots of text and character, the brand is closer to media |
| A full-width visual with text on top | hardware, photos, atmosphere |
| Short screens, each about one idea | a simple product, 3–5 claims |
| A long story with diagrams | a complex product in a new category |

- **Widths** are set with two tokens (text and large blocks), so the page does not stretch at 1440+.
- **Frames around visuals** are needed when the product itself has windows or a canvas. Otherwise don't frame everything.
- **Not everything is a card:** shadow and border only where the object is truly separate.
- **Frame labels** go inside the frame or as a heading above it, not as a white tag that cuts through the border.

## 7. Motion

Every animation answers "what is happening here". Pick the type by what needs explaining:

| What to explain | Type of motion |
|---|---|
| An instant change of state | a "before → after" transition on click or in a loop |
| A sequence of actions | a step-by-step story with a caption for each step |
| Flow through a system | a diagram along which tokens or messages move |
| Live status | quiet micro-animations: progress, counter, pulse, sound wave |
| Direct interaction | something you can drag, flip, press |
| Mood | slow atmosphere. Rarely, and only when the mood is part of the value |

- **Scroll-driven animations** (`view-timeline`, `animation-range`) and pinned sections are an expensive tool. They are justified when the story is really long. They need a fallback for browsers without support, `prefers-reduced-motion`, a "skip" button and a separate mobile view.
- **One orchestrated story** beats scattered effects.
- **Loops are paused by IntersectionObserver** when they are off screen. Under `prefers-reduced-motion`, everything is static and in its finished state.
- **The page reads at rest:** content does not hide behind `opacity:0` waiting for scroll.

## 8. Clichés to avoid (unless the user asks for them)

**AI defaults**
- cream background + serif + terracotta; black background + a single acid accent; purple-blue gradient;
- Inter or Space Grotesk as the "safe" choice; emoji as section markers;
- three identical cards in a row; a small all-caps label above every section; 01/02/03 numbering without a real sequence;
- em dashes; "seamless", "unleash", "elevate", "Quietly trusted by";
- fake screenshots made of divs; illustrations of people; "Jane Doe" and "Acme";
- the same radius and shadow everywhere; gray without a tint;
- "BETA" or version banners in the first screen for no reason;
- mono in every caption; an accent on every element.

**Your own templates.** Repeating a structure or signature moment from a previous landing page without the same fact in the product is slop too. For example: a process diagram, a "who does the work" table, an endless feature wall, a name acronym, a demo inside a monitor frame.

## 9. Technical traps

- **Descendant selectors like `.hub svg`** catch icons inside logos and shift them. Use the child selector `.hub > svg`.
- **Fixed card heights** lead to overflow. After the build, a script compares the bottom of the last child element with the bottom of the card.
- **Duplicate ids** in a section and a diagram break anchors and scripts.
- **A pinned section with a scaled canvas:** compute the scale from the free height minus padding and the heading.
- **An artifact on claude.ai blocks external fetches and images.** Load fonts only from Google Fonts and inline everything else. A form in the artifact will not submit, and that is fine.
