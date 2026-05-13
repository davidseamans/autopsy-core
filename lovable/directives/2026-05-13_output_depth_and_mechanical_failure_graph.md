# Lovable Directive — Output Depth + Mechanical Failure Explanation

## START

### Objective

Beef up the paid-value feel of the Autopsy Verdict page by adding short explanatory interpretation around the Dimension Pressure Profile and a Mechanical Failure Chain section.

This is a frontend/content-rendering improvement only.

### Target Project

`dc7fb6a8-9a10-4cef-9cee-85b1bf782906`

### Placement

Add explanatory content in two places:

1. Inside or immediately below the `Dimension Pressure Profile` card.
2. Add a new card titled `Mechanical Failure Chain` after the Dimension Pressure Profile and before Execution Diagnosis.

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

Do NOT invent new scores.
Do NOT create new backend business logic in the frontend.
Do NOT remove existing cards.

### Dimension Pressure Profile — Add Explanation

Add a short explanatory paragraph below the graph title:

`This profile shows where structural pressure is concentrated across the six operating dimensions. Lower scores indicate weaker proof, higher fragility, and greater risk of breakdown under real operating conditions.`

If a primary constraint exists, add:

`The Primary Constraint is the weakest confirmed operating dimension. It is the first constraint that must be stabilised before progression is trusted.`

If no primary constraint exists, add:

`No dominant constraint was identified. This does not remove the need for discipline; it means no single dimension is currently driving structural failure.`

### Mechanical Failure Chain — Required Section

Add a new card titled:

`Mechanical Failure Chain`

Purpose:
Explain how the weakness becomes business failure.

For runs with a primary constraint, render this structure:

`1. Weakest Dimension`
`The lowest-scoring dimension identifies the part of the business most likely to fail first under pressure.`

`2. Constraint Effect`
`This weakness reduces the reliability of the whole operating model. Other dimensions may still look acceptable, but they become exposed when the primary constraint is not controlled.`

`3. Failure Path`
`If this constraint is ignored, operational pressure compounds into wasted time, margin erosion, delivery failure, cash pressure, or operator overload.`

`4. Required Breakpoint`
`Progression is not trusted until the primary constraint is proven under real operating conditions and then retested.`

Where available, insert the actual primary constraint label into the text.

Example:

`Execution Discipline is the first failure point. If it is not stabilised, planning, follow-through, evidence collection, and correction loops become unreliable.`

### No-Dominant-Failure Mechanical Chain

If there is no primary constraint / weakest_dimension is null, show:

`No dominant mechanical failure chain was identified.`

Then add:

`The operating model appears structurally balanced at this assessment level. The main risk is not a visible single-point failure, but future drift caused by scaling, complacency, or loss of execution discipline.`

### Optional Visual Chain

If feasible without adding heavy dependencies, display the mechanical chain as a simple horizontal or vertical visual sequence:

`Weakest Dimension → Constraint Effect → Failure Path → Required Breakpoint`

Do not use Mermaid if it creates dependency, rendering, or security issues.

If Mermaid is already safely available in the project, it may be used. Otherwise use plain styled cards/steps.

### Tone

Keep tone:

- commercial-grade
- direct
- evidence-based
- not motivational
- not academic
- not verbose

This is a paid diagnostic product. The user should feel the system is explaining the mechanism, not merely displaying a score.

### Validation

Test the latest three completed runs:

1. Not Viable
2. High Risk
3. Structurally Viable / no-dominant-failure

Confirm:

- Dimension Pressure Profile still renders
- explanation appears below the graph title
- Mechanical Failure Chain appears before Execution Diagnosis
- primary constraint is named where present
- no-dominant-failure version renders cleanly
- no null/undefined/[object Object] appears
- no backend logic was changed

## END
