# Lovable Directive — Dimension Definitions + Authority Layers

## START

### Objective

Improve commercial authority and user comprehension on the Autopsy Verdict page by adding plain-English definitions of the six dimensions and a short verdict authority layer.

This is a frontend/content-rendering improvement only.

### Target Project

`dc7fb6a8-9a10-4cef-9cee-85b1bf782906`

### Placement

1. Add concise dimension definitions inside the Dimension Pressure Profile card, preferably as small help text, tooltip, expandable legend, or compact definition row.
2. Add a new card titled `What This Verdict Means` after Mechanical Failure Chain and before Execution Diagnosis.

### Non-Negotiable Constraints

Do NOT change:

- Supabase schema
- Supabase functions
- finalize_autopsy_run
- finalize_autopsy_run_internal
- get_autopsy_gateway_payload
- score thresholds
- verdict logic
- hard-fail logic
- worksheet logic
- retest logic
- Make webhook logic

Do NOT invent scores.
Do NOT create new backend business logic.
Do NOT remove existing cards.

### Dimension Definitions

Add plain-English definitions suitable for a cleaning/business operator.

Use these definitions:

Cash Reality:
`Can the business survive on real cash, not hope, invoices, or guesses?`

Economic Literacy:
`Does the operator understand margin, costs, pricing, and what must be true for the job to make money?`

Market Reality:
`Is there real demand from real buyers, proven by behaviour rather than opinion?`

Operational Capacity:
`Can the work be delivered consistently without chaos, missed standards, or overloading the operator?`

Execution Discipline:
`Does the operator reliably do the required work, follow through, record evidence, and correct problems?`

Psychological Resilience:
`Can the operator handle pressure, rejection, fatigue, uncertainty, and correction without avoiding reality?`

Important wording rule:
Do not make Psychological Resilience sound clinical or psychiatric. It is about business pressure tolerance and reality-facing behaviour.

### Preferred Display

Keep the Dimension Pressure Profile visually clean.

Preferred options:

Option A — small expandable section titled:
`What the dimensions mean`

Option B — small info/help text under each dimension when expanded.

Option C — tooltip/info icon if already available and reliable.

If unsure, use Option A: one compact expandable section below the graph.

### New Card — What This Verdict Means

Add a card titled:

`What This Verdict Means`

Purpose:
Make the output feel authoritative, not merely clever.

Use conditional text based on final_verdict.

#### Not Viable

`This is not a warning label. It is a stop signal. The current evidence does not support progression. The business should not move into expansion, hiring, major spending, or complexity until the primary constraint is proven and retested.`

#### High Risk

`This verdict means the business is showing partial viability but remains structurally exposed. Progression is possible only through controlled correction, evidence collection, and retesting of the dominant constraint.`

#### Viable

`This verdict means the business has enough evidence to proceed cautiously, but not enough to scale casually. The next step is controlled execution, proof collection, and monitoring for drift.`

#### Structurally Viable

`This verdict means the business currently shows strong operating evidence across the assessed dimensions. It may be ready for controlled progression, but only if discipline, telemetry, and governance remain intact.`

### Authority Test Prompt

Add a small internal design note in code comments only, not visible to the user:

`Authority test: Does this verdict feel like a serious operational assessment, or just a smart statement?`

### Tone

Keep tone:

- plain English
- commercial-grade
- direct
- evidence-based
- practical for a cleaning operator
- not academic
- not motivational
- not psychiatric

### Validation

Test the latest three completed runs:

1. Not Viable
2. High Risk
3. Structurally Viable / no-dominant-failure

Confirm:

- Dimension definitions are available without cluttering the page
- Psychological Resilience definition is business-pressure oriented, not clinical
- What This Verdict Means card appears before Execution Diagnosis
- verdict explanation changes correctly by final_verdict
- no null/undefined/[object Object] appears
- no backend logic was changed

## END
